package main

import "core:fmt"
import "core:mem"
import rt "core:runtime"
import "core:math/bits"
import "core:os"
import sdl "vendor:sdl2"
import img "vendor:sdl2/image"
import vk "vendor:vulkan"
import vkx11 "x11/vulkan"
import xlib "x11/xlib"
import lin "core:math/linalg/glsl"
import time "core:time"
import "core:thread"

screen_width :: 640
screen_height :: 480
max_frames_in_flight :: 2
API_VERSION_1_1 :: (1<<22) | (1<<12) | (0)

UniformBufferObject :: struct {
	model: lin.mat4,
	view: lin.mat4,
	proj: lin.mat4,
}

VulkanContext :: struct {
	instance : vk.Instance,
	enableValidationLayers : bool,
	device: vk.Device,
	physicalDevice: vk.PhysicalDevice,
	surface: vk.SurfaceKHR,
	graphicsQueue: vk.Queue,
	presentQueue: vk.Queue,
	swapChain: vk.SwapchainKHR,
	swapChainImages: []vk.Image,
	swapChainImageFormat: vk.Format,
	swapChainExtent: vk.Extent2D,
	swapChainImageViews: []vk.ImageView,
	swapChainFramebuffers: []vk.Framebuffer,
	graphicsFamily: u32,
	presentFamily: u32,
	capabilities: vk.SurfaceCapabilitiesKHR,
	formats: []vk.SurfaceFormatKHR,
	presentModes: []vk.PresentModeKHR,
	pipelineLayout: vk.PipelineLayout,
	renderPass: vk.RenderPass,
	commandPool: vk.CommandPool,
	commandBuffers: []vk.CommandBuffer,
	graphicsPipeline: vk.Pipeline,
	imageAvailableSemaphores: []vk.Semaphore,
	renderFinishedSemaphores: []vk.Semaphore,
	inFlightFences: []vk.Fence,
	imagesInFlight: []vk.Fence,
	vertexBuffer: vk.Buffer,
	vertexBufferMemory: vk.DeviceMemory,
	indexBuffer: vk.Buffer,
	indexBufferMemory: vk.DeviceMemory,
	descriptorSetLayout: vk.DescriptorSetLayout,
	uniformBuffers: []vk.Buffer,
	uniformBuffersMemory: []vk.DeviceMemory,
	descriptorPool: vk.DescriptorPool,
	descriptorSets: []vk.DescriptorSet,
	currentFrame: int,
	window: ^sdl.Window,
	framebufferResized: bool,
	startTime: time.Time,
	textureImage: vk.Image,
	textureImageMemory: vk.DeviceMemory,
	textureImageView: vk.ImageView,
	textureSampler: vk.Sampler,
	width: u32,
	height: u32,
}

Vertex :: struct {
	pos: lin.vec2,
	color: lin.vec3,
	texCoord: lin.vec2,
}

vuklan_proc_address_loader: vk.ProcGetInstanceProcAddr

vertices :: []Vertex {
	{{-0.5, -0.5}, {1.0, 0.0, 0.0}, {1.0, 0.0}},
	{{0.5, -0.5}, {0.0, 1.0, 0.0}, {0.0, 0.0}},
	{{0.5, 0.5}, {0.0, 0.0, 1.0}, {0.0, 1.0}},
	{{-0.5, 0.5}, {1.0, 1.0, 1.0}, {1.0, 1.0}},
}

indices :: []u16 {0,1,2,2,3,0}

extensions :: []cstring {
	vk.KHR_SURFACE_EXTENSION_NAME,
	vkx11.KHR_XLIB_SURFACE_EXTENSION_NAME,
	vkx11.KHR_XCB_SURFACE_EXTENSION_NAME,
	vk.KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME,
	vk.KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME,
}

validation_layers :: []cstring {
	"VK_LAYER_KHRONOS_validation",
}

device_extensions :: []cstring {
	vk.KHR_SWAPCHAIN_EXTENSION_NAME,
}

check_validation_layer_support :: proc() -> bool {
	layerCount: u32
	vk.EnumerateInstanceLayerProperties(&layerCount, nil)

	availableLayers := make([]vk.LayerProperties,layerCount)
	vk.EnumerateInstanceLayerProperties(&layerCount, mem.raw_slice_data(availableLayers))

	for layerName, _ in validation_layers {
		layerFound := false

		for _, i in availableLayers {
			layerProperties := availableLayers[i]

			if layerName == transmute(cstring)(&layerProperties.layerName) {
				layerFound = true
				break
			}
		}

		if !layerFound {
			return false
		}
	}

	return true
}

get_binding_description :: proc() -> vk.VertexInputBindingDescription {
	bindingDescription := vk.VertexInputBindingDescription{
		binding = 0,
		stride = size_of(Vertex),
		inputRate = vk.VertexInputRate.VERTEX,
	}

	return bindingDescription
}

get_attribute_descriptions :: proc() -> []vk.VertexInputAttributeDescription {
	attributeDescriptions := []vk.VertexInputAttributeDescription{
		{
			binding = 0,
			location = 0,
			format = vk.Format.R32G32_SFLOAT,
			offset = u32(offset_of(Vertex,pos)),
		},
		{
			binding = 0,
			location = 1,
			format = vk.Format.R32G32B32_SFLOAT,
			offset = u32(offset_of(Vertex,color)),
		},
		{
			binding = 0,
			location = 2,
			format = vk.Format.R32G32_SFLOAT,
			offset = u32(offset_of(Vertex, texCoord)),
		},
	}
	result := make([]vk.VertexInputAttributeDescription, len(attributeDescriptions))
	copy(result, attributeDescriptions)
	return result
}

find_memory_type :: proc(vkc:^VulkanContext, typeFilter:u32, properties: vk.MemoryPropertyFlags) -> (u32, bool) {
	memProperties := vk.PhysicalDeviceMemoryProperties{}
	vk.GetPhysicalDeviceMemoryProperties(vkc.physicalDevice, &memProperties)

	for i : u32 = 0; i < memProperties.memoryTypeCount; i += 1 {
		if (typeFilter & (1 << i)) != 0 && (memProperties.memoryTypes[i].propertyFlags & properties) == properties {
			return i, true
		}
	}

	return 0, false
}

create_buffer :: proc(vkc: ^VulkanContext, size: vk.DeviceSize, usage: vk.BufferUsageFlags, properties: vk.MemoryPropertyFlags, buffer: ^vk.Buffer, bufferMemory: ^vk.DeviceMemory) -> bool {
	bufferInfo := vk.BufferCreateInfo {
		sType = vk.StructureType.BUFFER_CREATE_INFO,
		size = size,
		usage = usage,
		sharingMode = vk.SharingMode.EXCLUSIVE,
	}

	if (vk.CreateBuffer(vkc.device, &bufferInfo, nil, buffer) != vk.Result.SUCCESS) {
		return false
	}

	memRequirements: vk.MemoryRequirements
	vk.GetBufferMemoryRequirements(vkc.device, buffer^, &memRequirements)

	memoryTypeIndex, ok := find_memory_type(vkc, memRequirements.memoryTypeBits, properties)

	if !ok {
		return false
	}

	allocInfo := vk.MemoryAllocateInfo{
		sType = vk.StructureType.MEMORY_ALLOCATE_INFO,
		allocationSize = memRequirements.size,
		memoryTypeIndex = memoryTypeIndex,
	}

	if vk.AllocateMemory(vkc.device, &allocInfo, nil, bufferMemory) != vk.Result.SUCCESS {
		return false
	}

	vk.BindBufferMemory(vkc.device, buffer^, bufferMemory^, 0)
	return true
}

create_index_buffer :: proc(vkc: ^VulkanContext) -> bool {
	bufferSize : vk.DeviceSize = vk.DeviceSize(size_of(indices[0]) * len(indices))

	stagingBuffer : vk.Buffer
	stagingBufferMemory : vk.DeviceMemory
	create_buffer(vkc, bufferSize, vk.BufferUsageFlags{.TRANSFER_SRC}, vk.MemoryPropertyFlags{.HOST_VISIBLE, .HOST_COHERENT}, &stagingBuffer, &stagingBufferMemory)

	data : rawptr
	vk.MapMemory(vkc.device, stagingBufferMemory, 0, bufferSize, vk.MemoryMapFlags{}, &data)
	rt.mem_copy_non_overlapping(data, mem.raw_slice_data(indices), int(bufferSize))
	vk.UnmapMemory(vkc.device, stagingBufferMemory)

	create_buffer(vkc,bufferSize, vk.BufferUsageFlags{.TRANSFER_DST, .INDEX_BUFFER}, vk.MemoryPropertyFlags{.DEVICE_LOCAL}, &vkc.indexBuffer, &vkc.indexBufferMemory)

	copy_buffer(vkc,stagingBuffer, vkc.indexBuffer, bufferSize)

	vk.DestroyBuffer(vkc.device, stagingBuffer, nil)
	vk.FreeMemory(vkc.device, stagingBufferMemory, nil)

	return true
}

create_vertex_buffer :: proc(vkc: ^VulkanContext) -> bool {
	bufferSize : vk.DeviceSize = vk.DeviceSize(size_of(vertices[0]) * len(vertices))

	stagingBuffer: vk.Buffer
	stagingBufferMemory: vk.DeviceMemory
	if !create_buffer(vkc,bufferSize,vk.BufferUsageFlags{.TRANSFER_SRC},vk.MemoryPropertyFlags{.HOST_VISIBLE, .HOST_COHERENT},&stagingBuffer,&stagingBufferMemory) {
		return false
	}

	data: rawptr
	vk.MapMemory(vkc.device, stagingBufferMemory, 0, bufferSize, vk.MemoryMapFlags{}, &data)
	rt.mem_copy_non_overlapping(data, mem.raw_slice_data(vertices), int(bufferSize))
	vk.UnmapMemory(vkc.device, stagingBufferMemory)

	if !create_buffer(vkc,bufferSize,vk.BufferUsageFlags{.TRANSFER_DST, .VERTEX_BUFFER}, vk.MemoryPropertyFlags{.DEVICE_LOCAL},&vkc.vertexBuffer,&vkc.vertexBufferMemory) {
		return false
	}

	copy_buffer(vkc,stagingBuffer,vkc.vertexBuffer,bufferSize)

	vk.DestroyBuffer(vkc.device,stagingBuffer,nil)
	vk.FreeMemory(vkc.device,stagingBufferMemory,nil)

	return true
}

copy_buffer :: proc(vkc: ^VulkanContext, srcBuffer: vk.Buffer, dstBuffer: vk.Buffer, size: vk.DeviceSize) {
	allocInfo := vk.CommandBufferAllocateInfo{
		sType = vk.StructureType.COMMAND_BUFFER_ALLOCATE_INFO,
		level = vk.CommandBufferLevel.PRIMARY,
		commandPool = vkc.commandPool,
		commandBufferCount = 1,
	}

	commandBuffer: vk.CommandBuffer
	vk.AllocateCommandBuffers(vkc.device, &allocInfo, &commandBuffer)

	beginInfo := vk.CommandBufferBeginInfo{
		sType = vk.StructureType.COMMAND_BUFFER_BEGIN_INFO,
		flags = vk.CommandBufferUsageFlags{.ONE_TIME_SUBMIT},
	}

	vk.BeginCommandBuffer(commandBuffer, &beginInfo)

	copyRegion := vk.BufferCopy{
		size = size,
	}
	vk.CmdCopyBuffer(commandBuffer, srcBuffer, dstBuffer, 1, &copyRegion)

	vk.EndCommandBuffer(commandBuffer)

	submitInfo := vk.SubmitInfo{
		sType = vk.StructureType.SUBMIT_INFO,
		commandBufferCount = 1,
		pCommandBuffers = &commandBuffer,
	}

	vk.QueueSubmit(vkc.graphicsQueue, 1, &submitInfo, 0)
	vk.QueueWaitIdle(vkc.graphicsQueue)

	vk.FreeCommandBuffers(vkc.device, vkc.commandPool, 1, &commandBuffer)
}

create_instance :: proc(vkc : ^VulkanContext) -> bool {
	// @todo Enable validation layers?
	if vkc.enableValidationLayers && !check_validation_layer_support() {
		fmt.println("Could not find validation layer support")
		return false
	}


	// Application info
	applicationInfo := vk.ApplicationInfo {
		sType = vk.StructureType.APPLICATION_INFO,
		pApplicationName = "vulkan-test",
		pEngineName = "odin-binding-generator",
		apiVersion = vk.API_VERSION_1_0,
	}

	// Instance info
	instanceCreateInfo := vk.InstanceCreateInfo {
		sType = vk.StructureType.INSTANCE_CREATE_INFO,
		pApplicationInfo = &applicationInfo,
		enabledExtensionCount = u32(len(extensions)),
		ppEnabledExtensionNames = mem.raw_slice_data(extensions),
	}

	if vkc.enableValidationLayers {
		instanceCreateInfo.enabledLayerCount = u32(len(validation_layers))
		instanceCreateInfo.ppEnabledLayerNames = mem.raw_slice_data(validation_layers)
	} else {
		instanceCreateInfo.enabledLayerCount = 0
	}

	result := vk.CreateInstance(&instanceCreateInfo, nil, &vkc.instance)
	if result == vk.Result.SUCCESS {
		fmt.println("Successfully created instance!")
	} else {
		fmt.println("Unable to create instance!")
		return false
	}

	return true
}

is_device_suitable :: proc(physicalDevice: vk.PhysicalDevice) -> bool {
	deviceProperties : vk.PhysicalDeviceProperties
	vk.GetPhysicalDeviceProperties(physicalDevice, &deviceProperties)
	deviceFeatures : vk.PhysicalDeviceFeatures
	vk.GetPhysicalDeviceFeatures(physicalDevice, &deviceFeatures)
	if deviceProperties.deviceType == vk.PhysicalDeviceType.DISCRETE_GPU && deviceFeatures.geometryShader != false && deviceFeatures.samplerAnisotropy != false {
		return true
	}
	if deviceFeatures.geometryShader != false && deviceFeatures.samplerAnisotropy != false {
		return true
	}
	return false
}

pick_physical_device :: proc(vkc: ^VulkanContext) -> bool {
	// Find physical devices
	physicalDevicesCount : u32
	vk.EnumeratePhysicalDevices(vkc.instance, &physicalDevicesCount, nil)
	if physicalDevicesCount == 0 {
		return false
	}
	physicalDevices := make([]vk.PhysicalDevice, physicalDevicesCount)
	vk.EnumeratePhysicalDevices(vkc.instance, &physicalDevicesCount, mem.raw_slice_data(physicalDevices))
	fmt.println("Found", physicalDevicesCount, "physical devices.")
	for pd, _ in physicalDevices {
		if is_device_suitable(pd) {
			fmt.println("** picked a physical device")
			vkc.physicalDevice = pd
			return true
		}
	}
	return false
}

find_queue_families :: proc(vkc: ^VulkanContext) -> bool {
	remaining := 2
	queueFamilyCount : u32
	vk.GetPhysicalDeviceQueueFamilyProperties(vkc.physicalDevice, &queueFamilyCount, nil)
	queueFamilies := make([]vk.QueueFamilyProperties,queueFamilyCount)
	defer delete(queueFamilies)
	vk.GetPhysicalDeviceQueueFamilyProperties(vkc.physicalDevice, &queueFamilyCount, mem.raw_slice_data(queueFamilies))

	for qf, i in queueFamilies {
		if vk.QueueFlags.GRAPHICS in qf.queueFlags {
			vkc.graphicsFamily = u32(i)
			remaining -= 1
		}

		presentSupport := b32(false)
		vk.GetPhysicalDeviceSurfaceSupportKHR(vkc.physicalDevice, u32(i), vkc.surface, &presentSupport)
		if presentSupport {
			vkc.presentFamily = u32(i)
			remaining -= 1
		}

		if remaining == 0 {
			return true
		}
	}

	return false
}


create_logical_device :: proc(vkc: ^VulkanContext) -> bool {
	queueCreateInfos: []vk.DeviceQueueCreateInfo
	uniqueQueueFamilies: []u32
	if vkc.graphicsFamily ==  vkc.presentFamily {
		uniqueQueueFamilies = []u32{vkc.graphicsFamily}
		queueCreateInfos = []vk.DeviceQueueCreateInfo{---}
	} else {
		uniqueQueueFamilies = []u32{vkc.graphicsFamily, vkc.presentFamily}
		queueCreateInfos = []vk.DeviceQueueCreateInfo{---,---}
	}

	queuePriority : f32 = 1.0
	for qf, i in uniqueQueueFamilies {
		queueCreateInfo := vk.DeviceQueueCreateInfo{
			sType = vk.StructureType.DEVICE_QUEUE_CREATE_INFO,
			queueFamilyIndex = qf,
			queueCount = 1,
			pQueuePriorities = &queuePriority,
		}
		queueCreateInfos[i] = queueCreateInfo
	}

	deviceFeatures := vk.PhysicalDeviceFeatures {
		samplerAnisotropy = true,
	}

	createInfo := vk.DeviceCreateInfo {
		sType = vk.StructureType.DEVICE_CREATE_INFO,
		pQueueCreateInfos = mem.raw_slice_data(queueCreateInfos),
		queueCreateInfoCount = u32(len(queueCreateInfos)),
		pEnabledFeatures = &deviceFeatures,
		enabledExtensionCount = u32(len(device_extensions)),
		ppEnabledExtensionNames = mem.raw_slice_data(device_extensions),
		enabledLayerCount = 0,
	}

	if vkc.enableValidationLayers {
		createInfo.enabledLayerCount = u32(len(validation_layers))
		createInfo.ppEnabledLayerNames = mem.raw_slice_data(validation_layers)
	}

	if vk.CreateDevice(vkc.physicalDevice, &createInfo, nil, &vkc.device) != vk.Result.SUCCESS {
		return false
	}

	vk.GetDeviceQueue(vkc.device, vkc.graphicsFamily, 0, &vkc.graphicsQueue)
	vk.GetDeviceQueue(vkc.device, vkc.presentFamily, 0, &vkc.presentQueue)

	return true
}


create_surface :: proc(vkc: ^VulkanContext, sdlWindow: ^sdl.Window) -> bool {
	surface: vk.SurfaceKHR
	createInfo : vkx11.XlibSurfaceCreateInfoKHR
	createInfo.sType = vk.StructureType.XLIB_SURFACE_CREATE_INFO_KHR
	info : sdl.SysWMinfo
	sdl.GetVersion(&info.version)
	if sdl.GetWindowWMInfo(sdlWindow, &info) == false {
		fmt.println("Could not get window info.")
		return false
	}
	fmt.println("WOOT!  Got Window info: ", info)
	createInfo.dpy = (^xlib.Display)(info.info.x11.display)
	createInfo.window = xlib.Window(info.info.x11.window)
	result := vkx11.CreateXlibSurfaceKHR(vkc.instance, &createInfo, nil, &surface)
	if result != vk.Result.SUCCESS {
		fmt.println("Failed to create surface: ", result)
		return false
	}
	vkc.surface = surface
	return true
}

check_device_extension_support :: proc(vkc: ^VulkanContext) -> bool {
	context.allocator = context.temp_allocator
	extension_count: u32
	vk.EnumerateDeviceExtensionProperties(vkc.physicalDevice, nil, &extension_count, nil)

	available_extensions := make([]vk.ExtensionProperties,extension_count)
	vk.EnumerateDeviceExtensionProperties(vkc.physicalDevice, nil, &extension_count, mem.raw_slice_data(available_extensions))

	expected := make(map[string]bool)
	defer delete(expected)
	for x, _ in device_extensions {
		expected[string(x)] = false
	}

	for _, i in available_extensions {
		x := available_extensions[i]
		en := string(transmute(cstring)(&x.extensionName))
		delete_key(&expected, en)
	}

	return len(expected) == 0
}

query_swap_chain_support :: proc(vkc: ^VulkanContext) -> bool {
	fmt.println("get_physical_device_surface_capabilities_khr")
	fmt.printf("vkc.physicalDevice: %v\n", vkc.physicalDevice)
	if vk.GetPhysicalDeviceSurfaceCapabilitiesKHR(vkc.physicalDevice, vkc.surface, &vkc.capabilities) != vk.Result.SUCCESS {
		return false
	}

	formatCount:u32
	fmt.println("get_physical_device_surface_formats_khr")
	vk.GetPhysicalDeviceSurfaceFormatsKHR(vkc.physicalDevice, vkc.surface, &formatCount, nil)
	if formatCount == 0 {
		return false
	}
	vkc.formats = make([]vk.SurfaceFormatKHR,formatCount)
	fmt.println("get_physical_device_surface_formats_khr")
	vk.GetPhysicalDeviceSurfaceFormatsKHR(vkc.physicalDevice, vkc.surface, &formatCount, mem.raw_slice_data(vkc.formats))

	presentModeCount:u32
	fmt.println("get_physical_device_surface_present_modes_khr")
	vk.GetPhysicalDeviceSurfacePresentModesKHR(vkc.physicalDevice, vkc.surface, &presentModeCount, nil)
	if presentModeCount == 0 {
		return false
	}
	vkc.presentModes = make([]vk.PresentModeKHR,presentModeCount)
	fmt.println("get_physical_device_surface_present_modes_khr")
	vk.GetPhysicalDeviceSurfacePresentModesKHR(vkc.physicalDevice, vkc.surface, &presentModeCount, mem.raw_slice_data(vkc.presentModes))
	return true
}

choose_swap_surface_format :: proc(availableFormats: []vk.SurfaceFormatKHR) -> vk.SurfaceFormatKHR {
	for af, _ in availableFormats {
		if af.format == vk.Format.B8G8R8A8_SRGB && af.colorSpace == vk.ColorSpaceKHR.SRGB_NONLINEAR {
			return af
		}
	}

	return availableFormats[0]
}

choose_swap_present_mode :: proc(availablePresentModes: []vk.PresentModeKHR) -> vk.PresentModeKHR {
	for apm, _ in availablePresentModes {
		if apm == vk.PresentModeKHR.MAILBOX {
			return apm
		}
	}

	return vk.PresentModeKHR.FIFO
}

choose_swap_extent :: proc(capabilities: ^vk.SurfaceCapabilitiesKHR, window:^sdl.Window, width, height: u32) -> vk.Extent2D {
	if capabilities.currentExtent.width != bits.U32_MAX {
	    return capabilities.currentExtent
	} else {
		actualExtent := vk.Extent2D{width, height}

		actualExtent.width = max(capabilities.minImageExtent.width, min(capabilities.maxImageExtent.width, actualExtent.width))
		actualExtent.height = max(capabilities.minImageExtent.height, min(capabilities.maxImageExtent.height, actualExtent.height))

		return actualExtent
	}
}

create_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
	surfaceFormat := choose_swap_surface_format(vkc.formats)
	presentMode := choose_swap_present_mode(vkc.presentModes)
	if vk.GetPhysicalDeviceSurfaceCapabilitiesKHR(vkc.physicalDevice, vkc.surface, &vkc.capabilities) != vk.Result.SUCCESS {
		return false
	}
	extent := choose_swap_extent(&vkc.capabilities, vkc.window, vkc.width, vkc.height)

	fmt.println("extent: ",extent)

	imageCount := vkc.capabilities.minImageCount + 1
	if vkc.capabilities.maxImageCount > 0 && imageCount > vkc.capabilities.maxImageCount {
		imageCount = vkc.capabilities.maxImageCount
	}

	createInfo := vk.SwapchainCreateInfoKHR {
		sType = vk.StructureType.SWAPCHAIN_CREATE_INFO_KHR,
		surface = vkc.surface,
		minImageCount = imageCount,
		imageFormat = surfaceFormat.format,
		imageColorSpace = surfaceFormat.colorSpace,
		imageExtent = extent,
		imageArrayLayers = 1,
		imageUsage = vk.ImageUsageFlags{.COLOR_ATTACHMENT},
	}

	ok := find_queue_families(vkc)
	if !ok {
		return false
	}
	queueFamilyIndices := []u32{vkc.graphicsFamily, vkc.presentFamily}

	if vkc.graphicsFamily != vkc.presentFamily {
		createInfo.imageSharingMode = vk.SharingMode.CONCURRENT
		createInfo.queueFamilyIndexCount = 2
		createInfo.pQueueFamilyIndices = mem.raw_slice_data(queueFamilyIndices)
	} else {
		createInfo.imageSharingMode = vk.SharingMode.EXCLUSIVE
	}

	createInfo.preTransform = vkc.capabilities.currentTransform
	createInfo.compositeAlpha = vk.CompositeAlphaFlagsKHR{.OPAQUE}
	createInfo.presentMode = presentMode
	createInfo.clipped = true

	if vk.CreateSwapchainKHR(vkc.device, &createInfo, nil, &vkc.swapChain) != vk.Result.SUCCESS {
		return false
	}

	vk.GetSwapchainImagesKHR(vkc.device, vkc.swapChain, &imageCount, nil)
	vkc.swapChainImages = make([]vk.Image,imageCount)
	vk.GetSwapchainImagesKHR(vkc.device, vkc.swapChain, &imageCount, mem.raw_slice_data(vkc.swapChainImages))

	vkc.swapChainImageFormat = surfaceFormat.format
	vkc.swapChainExtent = extent

	return true
}

create_graphics_pipeline :: proc(vkc: ^VulkanContext) -> bool {
	vertShaderCode, ok := read_file("shaders/shader-vert.spv")
	if !ok {
		return false
	}
	defer delete(vertShaderCode)
	fragShaderCode: []byte
	fragShaderCode, ok = read_file("shaders/shader-frag.spv")
	defer delete(fragShaderCode)
	if !ok {
		return false
	}

	vertShaderModule: vk.ShaderModule
	vertShaderModule, ok = create_shader_module(vkc, vertShaderCode)
	if !ok {
		return false
	}
	defer vk.DestroyShaderModule(vkc.device, vertShaderModule, nil)
	fragShaderModule: vk.ShaderModule
	fragShaderModule, ok = create_shader_module(vkc, fragShaderCode)
	if !ok {
		return false
	}
	defer vk.DestroyShaderModule(vkc.device, fragShaderModule, nil)

	vertShaderStageInfo := vk.PipelineShaderStageCreateInfo{
		sType = vk.StructureType.PIPELINE_SHADER_STAGE_CREATE_INFO,
		stage = vk.ShaderStageFlags{.VERTEX},
		module = vertShaderModule,
		pName = "main",
	}

	fragShaderStageInfo := vk.PipelineShaderStageCreateInfo{
		sType = vk.StructureType.PIPELINE_SHADER_STAGE_CREATE_INFO,
		stage = vk.ShaderStageFlags{.FRAGMENT},
		module = fragShaderModule,
		pName = "main",
	}

	shaderStages := []vk.PipelineShaderStageCreateInfo{vertShaderStageInfo, fragShaderStageInfo}

	bindingDescription := get_binding_description()
	attributeDescriptions := get_attribute_descriptions()
	defer delete(attributeDescriptions)

	vertexInputInfo := vk.PipelineVertexInputStateCreateInfo{
		sType = vk.StructureType.PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
		vertexBindingDescriptionCount = 1,
		vertexAttributeDescriptionCount = u32(len(attributeDescriptions)),
		pVertexBindingDescriptions = &bindingDescription,
		pVertexAttributeDescriptions = mem.raw_slice_data(attributeDescriptions),
	}

	inputAssembly := vk.PipelineInputAssemblyStateCreateInfo{
		sType = vk.StructureType.PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
		topology = vk.PrimitiveTopology.TRIANGLE_LIST,
		primitiveRestartEnable = false,
	}

	viewport := vk.Viewport{
		x = 0.0,
		y = 0.0,
		width = f32(vkc.swapChainExtent.width),
		height = f32(vkc.swapChainExtent.height),
		minDepth = 0.0,
		maxDepth = 1.0,
	}

	scissor := vk.Rect2D{
		offset = {0, 0},
		extent = vkc.swapChainExtent,
	}

	viewportState := vk.PipelineViewportStateCreateInfo{
		sType = vk.StructureType.PIPELINE_VIEWPORT_STATE_CREATE_INFO,
		viewportCount = 1,
		pViewports = &viewport,
		scissorCount = 1,
		pScissors = &scissor,
	}

	rasterizer := vk.PipelineRasterizationStateCreateInfo{
		sType = vk.StructureType.PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
		depthClampEnable = false,
		rasterizerDiscardEnable = false,
		polygonMode = vk.PolygonMode.FILL,
		lineWidth = 1.0,
		cullMode = vk.CullModeFlags{.BACK},
		frontFace = vk.FrontFace.COUNTER_CLOCKWISE,
		depthBiasEnable = false,
	}

	multisampling := vk.PipelineMultisampleStateCreateInfo{
		sType = vk.StructureType.PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
		sampleShadingEnable = false,
		rasterizationSamples = vk.SampleCountFlags{._1},
	}

	colorBlendAttachment := vk.PipelineColorBlendAttachmentState{
		colorWriteMask = vk.ColorComponentFlags{.R,.G,.B,.A},
		blendEnable = false,
	}

	colorBlending := vk.PipelineColorBlendStateCreateInfo{
		sType = vk.StructureType.PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
		logicOpEnable = false,
		logicOp = vk.LogicOp.COPY,
		attachmentCount = 1,
		pAttachments = &colorBlendAttachment,
		blendConstants = {0.0, 0.0, 0.0, 0.0},
	}

	pipelineLayoutInfo := vk.PipelineLayoutCreateInfo{
		sType = vk.StructureType.PIPELINE_LAYOUT_CREATE_INFO,
		setLayoutCount = 1,
		pSetLayouts = &vkc.descriptorSetLayout,
	}

	if (vk.CreatePipelineLayout(vkc.device, &pipelineLayoutInfo, nil, &vkc.pipelineLayout) != vk.Result.SUCCESS) {
		return false
	}

	pipelineInfo := vk.GraphicsPipelineCreateInfo{
		sType = vk.StructureType.GRAPHICS_PIPELINE_CREATE_INFO,
		stageCount = 2,
		pStages = mem.raw_slice_data(shaderStages),
		pVertexInputState = &vertexInputInfo,
		pInputAssemblyState = &inputAssembly,
		pViewportState = &viewportState,
		pRasterizationState = &rasterizer,
		pMultisampleState = &multisampling,
		pColorBlendState = &colorBlending,
		layout = vkc.pipelineLayout,
		renderPass = vkc.renderPass,
		subpass = 0,
		basePipelineHandle = 0,
	}

	if vk.CreateGraphicsPipelines(vkc.device, 0, 1, &pipelineInfo, nil, &vkc.graphicsPipeline) != vk.Result.SUCCESS {
		return false
	}

	return true
}

cleanup :: proc(vkc: ^VulkanContext) {
	vk.DeviceWaitIdle(vkc.device)

	cleanup_swap_chain(vkc)

	vk.DestroySampler(vkc.device, vkc.textureSampler, nil)
	vk.DestroyImageView(vkc.device, vkc.textureImageView, nil)
	vk.DestroyImage(vkc.device, vkc.textureImage, nil)
	vk.FreeMemory(vkc.device, vkc.textureImageMemory, nil)

	vk.DestroyDescriptorSetLayout(vkc.device, vkc.descriptorSetLayout, nil)
	vk.DestroyBuffer(vkc.device,vkc.indexBuffer,nil)
	vk.FreeMemory(vkc.device, vkc.indexBufferMemory, nil)
	vk.DestroyBuffer(vkc.device,vkc.vertexBuffer,nil)
	vk.FreeMemory(vkc.device, vkc.vertexBufferMemory, nil)

	for i := 0; i < max_frames_in_flight; i += 1 {
		vk.DestroySemaphore(vkc.device, vkc.renderFinishedSemaphores[i], nil)
		vk.DestroySemaphore(vkc.device, vkc.imageAvailableSemaphores[i], nil)
		vk.DestroyFence(vkc.device, vkc.inFlightFences[i], nil)
	}

	vk.DestroyCommandPool(vkc.device, vkc.commandPool, nil)

	vk.DestroyDevice(vkc.device, nil)

	vk.DestroySurfaceKHR(vkc.instance, vkc.surface, nil)
	vk.DestroyInstance(vkc.instance, nil)
}

create_render_pass :: proc(vkc: ^VulkanContext) -> bool {
	colorAttachment := vk.AttachmentDescription{
		format = vkc.swapChainImageFormat,
		samples = vk.SampleCountFlags{._1},
		loadOp = vk.AttachmentLoadOp.CLEAR,
		storeOp = vk.AttachmentStoreOp.STORE,
		stencilLoadOp = vk.AttachmentLoadOp.DONT_CARE,
		stencilStoreOp = vk.AttachmentStoreOp.DONT_CARE,
		initialLayout = vk.ImageLayout.UNDEFINED,
		finalLayout = vk.ImageLayout.PRESENT_SRC_KHR,
	}

	colorAttachmentRef := vk.AttachmentReference{
		attachment = 0,
		layout = vk.ImageLayout.COLOR_ATTACHMENT_OPTIMAL,
	}

	subpass := vk.SubpassDescription{
		pipelineBindPoint = vk.PipelineBindPoint.GRAPHICS,
		colorAttachmentCount = 1,
		pColorAttachments = &colorAttachmentRef,
	}

    dependency := vk.SubpassDependency {
        srcSubpass = vk.SUBPASS_EXTERNAL,
        dstSubpass = 0,
        srcStageMask = vk.PipelineStageFlags{.COLOR_ATTACHMENT_OUTPUT},
        srcAccessMask = vk.AccessFlags{},
        dstStageMask = vk.PipelineStageFlags{.COLOR_ATTACHMENT_OUTPUT},
        dstAccessMask = vk.AccessFlags{.COLOR_ATTACHMENT_WRITE},
	}

	renderPassInfo := vk.RenderPassCreateInfo{
		sType = vk.StructureType.RENDER_PASS_CREATE_INFO,
		attachmentCount = 1,
		pAttachments = &colorAttachment,
		subpassCount = 1,
		pSubpasses = &subpass,
        dependencyCount = 1,
        pDependencies = &dependency,
	}

	if (vk.CreateRenderPass(vkc.device, &renderPassInfo, nil, &vkc.renderPass) != vk.Result.SUCCESS) {
		return false
	}
	return true
}

create_shader_module :: proc(vkc: ^VulkanContext, code: []byte) -> (vk.ShaderModule, bool) {
	createInfo := vk.ShaderModuleCreateInfo{}
	createInfo.sType = vk.StructureType.SHADER_MODULE_CREATE_INFO
	createInfo.codeSize = len(code)
	createInfo.pCode = transmute(^u32)mem.raw_slice_data(code)

	shaderModule: vk.ShaderModule
	if vk.CreateShaderModule(vkc.device, &createInfo, nil, &shaderModule) != vk.Result.SUCCESS {
		return 0, false
	}

	return shaderModule, true
}

create_framebuffers :: proc(vkc: ^VulkanContext) -> bool {
	vkc.swapChainFramebuffers = make([]vk.Framebuffer, len(vkc.swapChainImageViews))

	for sciv, i in vkc.swapChainImageViews {
		attachments := []vk.ImageView{sciv}

		framebufferInfo := vk.FramebufferCreateInfo{
			sType = vk.StructureType.FRAMEBUFFER_CREATE_INFO,
			renderPass = vkc.renderPass,
			attachmentCount = 1,
			pAttachments = mem.raw_slice_data(attachments),
			width = vkc.swapChainExtent.width,
			height = vkc.swapChainExtent.height,
			layers = 1,
		}

		if vk.CreateFramebuffer(vkc.device, &framebufferInfo, nil, &vkc.swapChainFramebuffers[i]) != vk.Result.SUCCESS {
			return false
		}
	}
	return true
}

read_file :: proc(filename: string) -> ([]byte, bool) {
		fd, errno := os.open(filename)
		if errno != 0 {
			fmt.println("Failed to read:", filename, " error:", errno)
			return nil, false
		}
		defer os.close(fd)
		size: i64
		size, errno = os.file_size(fd)
		if errno != 0 {
			fmt.println("Failed to get file size:", filename, " error:", errno)
			return nil, false
		}
		result := make([]byte,size)
		_, errno = os.read(fd,result)
		if errno != 0 {
			delete(result)
			fmt.println("Failed to read file:", filename, " error:", errno)
			return nil, false
		}

		return result, true
	}


create_image_views :: proc(vkc: ^VulkanContext) -> bool {
	vkc.swapChainImageViews = make([]vk.ImageView,len(vkc.swapChainImages))
	for _, i in vkc.swapChainImageViews {
		view, result := create_image_view(vkc, vkc.swapChainImages[i], vkc.swapChainImageFormat)
		if !result {
			return false
		}
		vkc.swapChainImageViews[i] = view
	}
	return true
}

create_command_pool :: proc(vkc: ^VulkanContext) -> bool {
	poolInfo := vk.CommandPoolCreateInfo{
		sType = vk.StructureType.COMMAND_POOL_CREATE_INFO,
		queueFamilyIndex = vkc.graphicsFamily,
	}
	if vk.CreateCommandPool(vkc.device, &poolInfo, nil, &vkc.commandPool) != vk.Result.SUCCESS {
		return false
	}
	return true
}

create_command_buffers :: proc(vkc: ^VulkanContext) -> bool {
	vkc.commandBuffers = make([]vk.CommandBuffer,len(vkc.swapChainFramebuffers))

	allocInfo := vk.CommandBufferAllocateInfo{
		sType = vk.StructureType.COMMAND_BUFFER_ALLOCATE_INFO,
		commandPool = vkc.commandPool,
		level = vk.CommandBufferLevel.PRIMARY,
		commandBufferCount = u32(len(vkc.commandBuffers)),
	}

	if vk.AllocateCommandBuffers(vkc.device, &allocInfo, mem.raw_slice_data(vkc.commandBuffers)) != vk.Result.SUCCESS {
		return false
	}

	for cb, i in vkc.commandBuffers {
		beginInfo := vk.CommandBufferBeginInfo{sType = vk.StructureType.COMMAND_BUFFER_BEGIN_INFO}

		if vk.BeginCommandBuffer(cb, &beginInfo) != vk.Result.SUCCESS {
			return false
		}

		renderPassInfo := vk.RenderPassBeginInfo{
			sType = vk.StructureType.RENDER_PASS_BEGIN_INFO,
			renderPass = vkc.renderPass,
			framebuffer = vkc.swapChainFramebuffers[i],
			renderArea = {
				offset = {0, 0},
				extent = vkc.swapChainExtent,
			},
		}

		clearColor := vk.ClearValue{}
		clearColor.color.float32 = {0.0, 0.0, 0.0, 1.0}

		renderPassInfo.clearValueCount = 1
		renderPassInfo.pClearValues = &clearColor

		vk.CmdBeginRenderPass(cb, &renderPassInfo, vk.SubpassContents.INLINE)

		vk.CmdBindPipeline(cb, vk.PipelineBindPoint.GRAPHICS, vkc.graphicsPipeline)

		vertexBuffers := []vk.Buffer{vkc.vertexBuffer}
		offsets := []vk.DeviceSize{0}
		vk.CmdBindVertexBuffers(vkc.commandBuffers[i], 0, 1, mem.raw_slice_data(vertexBuffers), mem.raw_slice_data(offsets))
		vk.CmdBindIndexBuffer(vkc.commandBuffers[i],vkc.indexBuffer,0,vk.IndexType.UINT16)
		vk.CmdBindDescriptorSets(vkc.commandBuffers[i], vk.PipelineBindPoint.GRAPHICS, vkc.pipelineLayout, 0, 1, &vkc.descriptorSets[i], 0, nil)
		vk.CmdDrawIndexed(vkc.commandBuffers[i], u32(len(indices)), 1, 0, 0, 0)

		// vk.CmdDraw(cb, 3, 1, 0, 0)

		vk.CmdEndRenderPass(cb)

		if vk.EndCommandBuffer(cb) != vk.Result.SUCCESS {
			return false
		}
	}
	return true
}

create_descriptor_layout :: proc(vkc: ^VulkanContext) -> bool {
	uboLayoutBinding := vk.DescriptorSetLayoutBinding{
		binding = 0,
		descriptorCount = 1,
		descriptorType = vk.DescriptorType.UNIFORM_BUFFER,
		pImmutableSamplers = nil,
		stageFlags = vk.ShaderStageFlags{.VERTEX},
	}

	samplerLayoutBinding := vk.DescriptorSetLayoutBinding {
		binding = 1,
		descriptorCount = 1,
		descriptorType = vk.DescriptorType.COMBINED_IMAGE_SAMPLER,
		pImmutableSamplers = nil,
		stageFlags = vk.ShaderStageFlags{.FRAGMENT},
	}

	bindings := []vk.DescriptorSetLayoutBinding{uboLayoutBinding, samplerLayoutBinding}
	layoutInfo := vk.DescriptorSetLayoutCreateInfo {
		sType = vk.StructureType.DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
		bindingCount = u32(len(bindings)),
		pBindings = mem.raw_slice_data(bindings),
	}

	if vk.CreateDescriptorSetLayout(vkc.device, &layoutInfo, nil, &vkc.descriptorSetLayout) != vk.Result.SUCCESS {
		return false
	}

	return true
}

create_uniform_buffers :: proc(vkc: ^VulkanContext) -> bool {
	bufferSize := vk.DeviceSize(size_of(UniformBufferObject))

	vkc.uniformBuffers = make([]vk.Buffer,len(vkc.swapChainImages))
	vkc.uniformBuffersMemory = make([]vk.DeviceMemory,len(vkc.swapChainImages))

	for _, i in vkc.swapChainImages {
		create_buffer(vkc, bufferSize, vk.BufferUsageFlags{.UNIFORM_BUFFER}, vk.MemoryPropertyFlags{.HOST_VISIBLE, .HOST_COHERENT}, &vkc.uniformBuffers[i], &vkc.uniformBuffersMemory[i])
	}
	return true
}


create_descriptor_pool :: proc(vkc: ^VulkanContext) -> bool {
	poolSize := []vk.DescriptorPoolSize {
		{
			type = vk.DescriptorType.UNIFORM_BUFFER,
			descriptorCount = u32(len(vkc.swapChainImages)),
		},
		{
			type = vk.DescriptorType.COMBINED_IMAGE_SAMPLER,
			descriptorCount = u32(len(vkc.swapChainImages)),
		},
	}

	poolInfo := vk.DescriptorPoolCreateInfo {
		sType = vk.StructureType.DESCRIPTOR_POOL_CREATE_INFO,
		poolSizeCount = u32(len(poolSize)),
		pPoolSizes = mem.raw_slice_data(poolSize),
		maxSets = u32(len(vkc.swapChainImages)),
	}

	if vk.CreateDescriptorPool(vkc.device, &poolInfo, nil, &vkc.descriptorPool) != vk.Result.SUCCESS {
		return false
	}

	return true
}

create_descriptor_sets :: proc(vkc: ^VulkanContext) -> bool {
	layouts := make([]vk.DescriptorSetLayout,len(vkc.swapChainImages))
	for _, i in layouts {
		layouts[i] = vkc.descriptorSetLayout
	}
	allocInfo := vk.DescriptorSetAllocateInfo{
		sType = vk.StructureType.DESCRIPTOR_SET_ALLOCATE_INFO,
		descriptorPool = vkc.descriptorPool,
		descriptorSetCount = u32(len(vkc.swapChainImages)),
		pSetLayouts = mem.raw_slice_data(layouts),
	}

	vkc.descriptorSets = make([]vk.DescriptorSet,len(vkc.swapChainImages))

	if vk.AllocateDescriptorSets(vkc.device,&allocInfo,mem.raw_slice_data(vkc.descriptorSets)) != vk.Result.SUCCESS {
		return false
	}

	for _, i in vkc.swapChainImages {
		bufferInfo := vk.DescriptorBufferInfo{
			buffer = vkc.uniformBuffers[i],
			offset = 0,
			range = size_of(UniformBufferObject),
		}

		imageInfo := vk.DescriptorImageInfo {
			imageLayout = vk.ImageLayout.SHADER_READ_ONLY_OPTIMAL,
			imageView = vkc.textureImageView,
			sampler = vkc.textureSampler,
		}

		descriptorWrite := []vk.WriteDescriptorSet {
			{
				sType = vk.StructureType.WRITE_DESCRIPTOR_SET,
				dstSet = vkc.descriptorSets[i],
				dstBinding = 0,
				dstArrayElement = 0,
				descriptorType = vk.DescriptorType.UNIFORM_BUFFER,
				descriptorCount = 1,
				pBufferInfo = &bufferInfo,
			},
			{
				sType = vk.StructureType.WRITE_DESCRIPTOR_SET,
				dstSet = vkc.descriptorSets[i],
				dstBinding = 1,
				dstArrayElement = 0,
				descriptorType = vk.DescriptorType.COMBINED_IMAGE_SAMPLER,
				descriptorCount = 1,
				pImageInfo = &imageInfo,
			},
		}
		vk.UpdateDescriptorSets(vkc.device, u32(len(descriptorWrite)), mem.raw_slice_data(descriptorWrite), 0, nil)
	}

	return true
}

sdl_pixelformat_rgba8888 := sdl.DEFINE_PIXELFORMAT(sdl.PIXELTYPE_PACKED32, sdl.PACKEDORDER_ABGR, sdl.PACKEDLAYOUT_8888, 32, 4)

create_image_view :: proc(vkc: ^VulkanContext, image: vk.Image, format: vk.Format) -> (vk.ImageView, bool) {
 viewInfo := vk.ImageViewCreateInfo {
		sType = vk.StructureType.IMAGE_VIEW_CREATE_INFO,
		image = image,
		viewType = vk.ImageViewType.D2,
		format = format,
		subresourceRange = {
			aspectMask = vk.ImageAspectFlags{.COLOR},
			baseMipLevel = 0,
			levelCount = 1,
			baseArrayLayer = 0,
			layerCount = 1,
		},
	}


	imageView: vk.ImageView
	if vk.CreateImageView(vkc.device, &viewInfo, nil, &imageView) == vk.Result.SUCCESS {
		return imageView, true
	}

	return 0, false
}

create_texture_sampler :: proc(vkc: ^VulkanContext) -> bool {
		properties: vk.PhysicalDeviceProperties
		vk.GetPhysicalDeviceProperties(vkc.physicalDevice, &properties)

		samplerInfo := vk.SamplerCreateInfo{
			sType = vk.StructureType.SAMPLER_CREATE_INFO,
			magFilter = vk.Filter.LINEAR,
			minFilter = vk.Filter.LINEAR,
			addressModeU = vk.SamplerAddressMode.REPEAT,
			addressModeV = vk.SamplerAddressMode.REPEAT,
			addressModeW = vk.SamplerAddressMode.REPEAT,
			anisotropyEnable = true,
			maxAnisotropy = properties.limits.maxSamplerAnisotropy,
			borderColor = vk.BorderColor.INT_OPAQUE_BLACK,
			unnormalizedCoordinates = false,
			compareEnable = false,
			compareOp = vk.CompareOp.ALWAYS,
			mipmapMode = vk.SamplerMipmapMode.LINEAR,
			mipLodBias = 0.0,
			minLod = 0.0,
			maxLod = 0.0,
		}

		if vk.CreateSampler(vkc.device, &samplerInfo, nil, &vkc.textureSampler) != vk.Result.SUCCESS {
			fmt.println("failed to create texture sampler!")
			return false
		}
		return true
}

create_texture_image_view :: proc(vkc: ^VulkanContext) -> bool {
	textureImageView, result := create_image_view(vkc, vkc.textureImage, vk.Format.R8G8B8A8_SRGB)
	vkc.textureImageView = textureImageView
	return result
}

render_image :: proc(surface: ^sdl.Surface) {
	window := sdl.CreateWindow("SDL2 Displaying Image",
		sdl.WINDOWPOS_UNDEFINED, sdl.WINDOWPOS_UNDEFINED, surface.w, surface.h, sdl.WindowFlags{})
	defer sdl.DestroyWindow(window)

	renderer := sdl.CreateRenderer(window, -1, sdl.RendererFlags{})
	defer sdl.DestroyRenderer(renderer)

	texture := sdl.CreateTextureFromSurface(renderer, surface)
	defer sdl.DestroyTexture(texture)

	sdl.RenderCopy(renderer, texture, nil, nil)
	sdl.RenderPresent(renderer)

	event: sdl.Event
	stop:
	for {
		for sdl.WaitEvent(&event) != 0 {
			#partial switch event.type {
			case sdl.EventType.QUIT:
				break stop
			case sdl.EventType.WINDOWEVENT:
				#partial switch event.window.event {
					case sdl.WindowEventID.CLOSE:
						break stop
					case:
				}
			}
		}
	}
}

create_texture_image :: proc(vkc: ^VulkanContext) -> bool {
	origImageSurface := img.Load("textures/texture.jpg")
	if origImageSurface == nil {
		fmt.println("Error loading texture image")
		return false
	}
	defer sdl.FreeSurface(origImageSurface)
	texWidth := origImageSurface.w
	texHeight := origImageSurface.h
	targetSurface := sdl.CreateRGBSurfaceWithFormat(0, origImageSurface.w, origImageSurface.h, 32, sdl_pixelformat_rgba8888)
	defer sdl.FreeSurface(targetSurface)
	rect := sdl.Rect {
		x = 0,
		y = 0,
		w = origImageSurface.w,
		h = origImageSurface.h,
	}
	err := sdl.UpperBlit(origImageSurface,&rect,targetSurface,&rect)
	if err != 0 {
		fmt.printf("Error blitting texture image to target surface: %d\n", err)
		return false
	}
	// render_image(targetSurface)
	imageSize : vk.DeviceSize = vk.DeviceSize(texWidth * texHeight * 4)
	stagingBuffer : vk.Buffer
	stagingBufferMemory : vk.DeviceMemory

	if !create_buffer(vkc, imageSize, vk.BufferUsageFlags{.TRANSFER_SRC}, vk.MemoryPropertyFlags{.HOST_VISIBLE,.HOST_COHERENT}, &stagingBuffer, &stagingBufferMemory) {
		return false
	}
	defer vk.DestroyBuffer(vkc.device, stagingBuffer, nil)
	defer vk.FreeMemory(vkc.device, stagingBufferMemory, nil)

	data: rawptr
	vk.MapMemory(vkc.device, stagingBufferMemory, 0, imageSize, vk.MemoryMapFlags{}, &data)
	sdl.LockSurface(targetSurface)
	rt.mem_copy_non_overlapping(data, targetSurface.pixels, int(imageSize))
	sdl.UnlockSurface(targetSurface)
	vk.UnmapMemory(vkc.device, stagingBufferMemory)

	if !create_image(vkc, u32(texWidth), u32(texHeight), vk.Format.R8G8B8A8_SRGB,vk.ImageTiling.OPTIMAL, vk.ImageUsageFlags{.TRANSFER_DST, .SAMPLED}, vk.MemoryPropertyFlags{.DEVICE_LOCAL}, &vkc.textureImage, &vkc.textureImageMemory) {
		fmt.println("Error: could not create image")
		return false
	}

	if !transition_image_layout(vkc, vkc.textureImage, vk.Format.R8G8B8A8_SRGB, vk.ImageLayout.UNDEFINED, vk.ImageLayout.TRANSFER_DST_OPTIMAL) {
		return false
	}
	copy_buffer_to_image(vkc, stagingBuffer, vkc.textureImage, u32(texWidth), u32(texHeight))
	if !transition_image_layout(vkc, vkc.textureImage, vk.Format.R8G8B8A8_SRGB, vk.ImageLayout.TRANSFER_DST_OPTIMAL, vk.ImageLayout.SHADER_READ_ONLY_OPTIMAL) {
		return false
	}

	return true
}

copy_buffer_to_image :: proc(vkc: ^VulkanContext, buffer: vk.Buffer, image: vk.Image, width, height: u32) {
	commandBuffer := begin_single_time_commands(vkc)

	region := vk.BufferImageCopy{
		bufferOffset = 0,
		bufferRowLength = 0,
		bufferImageHeight = 0,
		imageSubresource = {
			aspectMask = vk.ImageAspectFlags{.COLOR},
			mipLevel = 0,
			baseArrayLayer = 0,
			layerCount = 1,
		},
		imageOffset = {0, 0, 0},
		imageExtent = {width, height, 1},
	}

	vk.CmdCopyBufferToImage(commandBuffer, buffer, image, vk.ImageLayout.TRANSFER_DST_OPTIMAL, 1, &region)

	end_single_time_commands(vkc, &commandBuffer)
}

begin_single_time_commands :: proc(vkc: ^VulkanContext) -> vk.CommandBuffer {
	allocInfo := vk.CommandBufferAllocateInfo{
		sType = vk.StructureType.COMMAND_BUFFER_ALLOCATE_INFO,
		level = vk.CommandBufferLevel.PRIMARY,
		commandPool = vkc.commandPool,
		commandBufferCount = 1,
	}

	commandBuffer := vk.CommandBuffer{}
	vk.AllocateCommandBuffers(vkc.device, &allocInfo, &commandBuffer)

	beginInfo := vk.CommandBufferBeginInfo{
		sType = vk.StructureType.COMMAND_BUFFER_BEGIN_INFO,
		flags = vk.CommandBufferUsageFlags{.ONE_TIME_SUBMIT},
	}

	vk.BeginCommandBuffer(commandBuffer, &beginInfo)

	return commandBuffer
}

end_single_time_commands :: proc(vkc: ^VulkanContext, commandBuffer: ^vk.CommandBuffer) {
	vk.EndCommandBuffer(commandBuffer^)

	submitInfo := vk.SubmitInfo{
		sType = vk.StructureType.SUBMIT_INFO,
		commandBufferCount = 1,
		pCommandBuffers = commandBuffer,
	}

	vk.QueueSubmit(vkc.graphicsQueue, 1, &submitInfo, 0)
	vk.QueueWaitIdle(vkc.graphicsQueue)

	vk.FreeCommandBuffers(vkc.device, vkc.commandPool, 1, commandBuffer)
}

transition_image_layout :: proc(vkc: ^VulkanContext, image: vk.Image, format: vk.Format, oldLayout: vk.ImageLayout, newLayout: vk.ImageLayout) -> bool {
	commandBuffer := begin_single_time_commands(vkc)

	barrier := vk.ImageMemoryBarrier {
		sType = vk.StructureType.IMAGE_MEMORY_BARRIER,
		oldLayout = oldLayout,
		newLayout = newLayout,
		srcQueueFamilyIndex = vk.QUEUE_FAMILY_IGNORED,
		dstQueueFamilyIndex = vk.QUEUE_FAMILY_IGNORED,
		image = image,
		subresourceRange = vk.ImageSubresourceRange{
			aspectMask = vk.ImageAspectFlags{.COLOR},
			baseMipLevel = 0,
			levelCount = 1,
			baseArrayLayer = 0,
			layerCount = 1,
		},
	}

	sourceStage: vk.PipelineStageFlags
	destinationStage: vk.PipelineStageFlags

	if oldLayout == vk.ImageLayout.UNDEFINED && newLayout == vk.ImageLayout.TRANSFER_DST_OPTIMAL {
		barrier.srcAccessMask = vk.AccessFlags{}
		barrier.dstAccessMask = vk.AccessFlags{.TRANSFER_WRITE}
		sourceStage = vk.PipelineStageFlags{.TOP_OF_PIPE}
		destinationStage = vk.PipelineStageFlags{.TRANSFER}
	} else if oldLayout == vk.ImageLayout.TRANSFER_DST_OPTIMAL && newLayout == vk.ImageLayout.SHADER_READ_ONLY_OPTIMAL {
		barrier.srcAccessMask = vk.AccessFlags{.TRANSFER_WRITE}
		barrier.dstAccessMask = vk.AccessFlags{.SHADER_READ}

		sourceStage = vk.PipelineStageFlags{.TRANSFER}
		destinationStage = vk.PipelineStageFlags{.FRAGMENT_SHADER}
	} else {
		fmt.println("unsupported layout transition!")
		return false
	}

	vk.CmdPipelineBarrier(
		commandBuffer,
		sourceStage, destinationStage,
		vk.DependencyFlags{},
		0, nil,
		0, nil,
		1, &barrier,
	)

	end_single_time_commands(vkc, &commandBuffer)

	return true
}

create_image :: proc(vkc: ^VulkanContext, width, height: u32, format: vk.Format, tiling: vk.ImageTiling, usage: vk.ImageUsageFlags, properties: vk.MemoryPropertyFlags, image: ^vk.Image, imageMemory: ^vk.DeviceMemory) -> bool {
   imageInfo := vk.ImageCreateInfo{
		sType = vk.StructureType.IMAGE_CREATE_INFO,
		imageType = vk.ImageType.D2,
		extent = {
				width = width,
				height = height,
				depth = 1,
			},
		mipLevels = 1,
		arrayLayers = 1,
		format = format,
		tiling = tiling,
		initialLayout = vk.ImageLayout.UNDEFINED,
		usage = usage,
		sharingMode = vk.SharingMode.EXCLUSIVE,
		samples = vk.SampleCountFlags{._1},
		flags = vk.ImageCreateFlags{},
	}

	if vk.CreateImage(vkc.device, &imageInfo, nil, image) != vk.Result.SUCCESS {
		fmt.println("Failed to create image for the texture map")
		return false
	}

	memRequirements: vk.MemoryRequirements
	vk.GetImageMemoryRequirements(vkc.device,image^,&memRequirements)

	mt, ok := find_memory_type(vkc, memRequirements.memoryTypeBits, properties)
	if !ok {
		fmt.println("Error: failed to find memory")
		return false
	}

	allocInfo := vk.MemoryAllocateInfo {
		sType = vk.StructureType.MEMORY_ALLOCATE_INFO,
		allocationSize = memRequirements.size,
		memoryTypeIndex = mt,
	}

	if vk.AllocateMemory(vkc.device, &allocInfo, nil, imageMemory) != vk.Result.SUCCESS {
		fmt.println("Error: failed to allocate memory in device")
		return false
	}

	vk.BindImageMemory(vkc.device, image^, imageMemory^, 0)

	return true
}

create_sync_objects :: proc(vkc: ^VulkanContext) -> bool {
	vkc.imageAvailableSemaphores = make([]vk.Semaphore,max_frames_in_flight)
	vkc.renderFinishedSemaphores = make([]vk.Semaphore,max_frames_in_flight)
	vkc.inFlightFences = make([]vk.Fence,max_frames_in_flight)
	vkc.imagesInFlight = make([]vk.Fence,len(vkc.swapChainImages))

	semaphoreInfo := vk.SemaphoreCreateInfo{}
	semaphoreInfo.sType = vk.StructureType.SEMAPHORE_CREATE_INFO

	fenceInfo := vk.FenceCreateInfo{}
	fenceInfo.sType = vk.StructureType.FENCE_CREATE_INFO
	fenceInfo.flags = vk.FenceCreateFlags{.SIGNALED}


	for i := 0; i < max_frames_in_flight; i += 1 {
		if (vk.CreateSemaphore(vkc.device, &semaphoreInfo, nil, &vkc.imageAvailableSemaphores[i]) != vk.Result.SUCCESS ||
			vk.CreateSemaphore(vkc.device, &semaphoreInfo, nil, &vkc.renderFinishedSemaphores[i]) != vk.Result.SUCCESS ||
			vk.CreateFence(vkc.device, &fenceInfo, nil, &vkc.inFlightFences[i]) != vk.Result.SUCCESS) {
			return false
		}
	}
	return true
}

VEC3_Z_AXIS :: lin.vec3{0, 0, 1}

update_uniform_buffer :: proc(vkc: ^VulkanContext, currentImage: u32) {
	now := time.now()
	diff := time.duration_seconds(time.diff(vkc.startTime,now))

	ubo := UniformBufferObject {
		model = lin.mat4Rotate(VEC3_Z_AXIS, f32(diff)*lin.radians(f32(90))),
		view = lin.mat4LookAt(lin.vec3{2,2,2},lin.vec3{0,0,0}, VEC3_Z_AXIS),
		proj = lin.mat4Perspective(lin.radians(f32(45)),f32(vkc.swapChainExtent.width)/f32(vkc.swapChainExtent.height),0.1,10),
	}

	ubo.proj[1][1] *= -1

	data: rawptr
	vk.MapMemory(vkc.device,vkc.uniformBuffersMemory[currentImage],0,size_of(ubo),vk.MemoryMapFlags{},&data)
	fmt.println("size_of(ubo) = ", size_of(ubo))
	rt.mem_copy_non_overlapping(data,&ubo,size_of(ubo))
	vk.UnmapMemory(vkc.device,vkc.uniformBuffersMemory[currentImage])
}

draw_frame :: proc(vkc: ^VulkanContext, window: ^sdl.Window) -> bool {
	vk.WaitForFences(vkc.device, 1, &vkc.inFlightFences[vkc.currentFrame], true, bits.U64_MAX)

	imageIndex: u32
	#partial switch vk.AcquireNextImageKHR(vkc.device, vkc.swapChain, bits.U64_MAX, vkc.imageAvailableSemaphores[vkc.currentFrame], 0, &imageIndex) {
		case vk.Result.ERROR_OUT_OF_DATE_KHR:
			return recreate_swap_chain(vkc)
		case vk.Result.SUCCESS, vk.Result.SUBOPTIMAL_KHR:
		// nothing
		case:
			return false
	}

	fmt.println("about to call update_uniform_buffer")
	update_uniform_buffer(vkc, imageIndex)

	if vkc.imagesInFlight[imageIndex] != 0 {
		vk.WaitForFences(vkc.device, 1, &vkc.imagesInFlight[imageIndex], true, bits.U64_MAX)
	}
	vkc.imagesInFlight[imageIndex] = vkc.inFlightFences[vkc.currentFrame]

	waitSemaphores := []vk.Semaphore{vkc.imageAvailableSemaphores[vkc.currentFrame]}
	waitStages := []vk.PipelineStageFlags{vk.PipelineStageFlags{.COLOR_ATTACHMENT_OUTPUT}}
	signalSemaphores := []vk.Semaphore{vkc.renderFinishedSemaphores[vkc.currentFrame]}


	submitInfo := vk.SubmitInfo{
		sType = vk.StructureType.SUBMIT_INFO,
		waitSemaphoreCount = 1,
		pWaitSemaphores = mem.raw_slice_data(waitSemaphores),
		pWaitDstStageMask = mem.raw_slice_data(waitStages),
		commandBufferCount = 1,
		pCommandBuffers = &vkc.commandBuffers[imageIndex],
		signalSemaphoreCount = 1,
		pSignalSemaphores = mem.raw_slice_data(signalSemaphores),
	}

	vk.ResetFences(vkc.device, 1, &vkc.inFlightFences[vkc.currentFrame])

	if (vk.QueueSubmit(vkc.graphicsQueue, 1, &submitInfo, vkc.inFlightFences[vkc.currentFrame]) != vk.Result.SUCCESS) {
		return false
	}

	swapChains := []vk.SwapchainKHR{vkc.swapChain}
	presentInfo := vk.PresentInfoKHR{
		sType = vk.StructureType.PRESENT_INFO_KHR,
		waitSemaphoreCount = 1,
		pWaitSemaphores = mem.raw_slice_data(signalSemaphores),
		swapchainCount = 1,
		pSwapchains = mem.raw_slice_data(swapChains),
		pImageIndices = &imageIndex,
	}

	result := vk.QueuePresentKHR(vkc.presentQueue, &presentInfo)

	if result == vk.Result.ERROR_OUT_OF_DATE_KHR || result == vk.Result.SUBOPTIMAL_KHR || vkc.framebufferResized {
		vkc.framebufferResized = false
		if !recreate_swap_chain(vkc) {
			fmt.println("failed to recreate swap chain")
			return false
		}
		return true
	} else if result != vk.Result.SUCCESS {
		return false
	}

	vkc.currentFrame = (vkc.currentFrame + 1) % max_frames_in_flight
	return true
}

cleanup_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
	for framebuffer, _ in vkc.swapChainFramebuffers {
		vk.DestroyFramebuffer(vkc.device, framebuffer, nil)
	}
	delete(vkc.swapChainFramebuffers)
	vkc.swapChainFramebuffers = nil

	vk.FreeCommandBuffers(vkc.device, vkc.commandPool, u32(len(vkc.commandBuffers)), mem.raw_slice_data(vkc.commandBuffers))
	delete(vkc.commandBuffers)
	vkc.commandBuffers = nil

	vk.DestroyPipeline(vkc.device, vkc.graphicsPipeline, nil)
	vk.DestroyPipelineLayout(vkc.device, vkc.pipelineLayout, nil)
	vk.DestroyRenderPass(vkc.device, vkc.renderPass, nil)

	for imageView, _ in vkc.swapChainImageViews {
		vk.DestroyImageView(vkc.device, imageView, nil)
	}
	delete(vkc.swapChainImageViews)
	vkc.swapChainImageViews = nil

	vk.DestroySwapchainKHR(vkc.device, vkc.swapChain, nil)

	for i := 0; i < len(vkc.swapChainImages); i += 1 {
		vk.DestroyBuffer(vkc.device, vkc.uniformBuffers[i], nil)
		vk.FreeMemory(vkc.device, vkc.uniformBuffersMemory[i], nil)
	}
	delete(vkc.uniformBuffers)
	delete(vkc.uniformBuffersMemory)
	vkc.uniformBuffers = nil
	vkc.uniformBuffersMemory = nil

	vk.DestroyDescriptorPool(vkc.device, vkc.descriptorPool, nil)

	return true
}

recreate_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
	fmt.print("recreating the swap chain...")

	if vkc.width == 0 || vkc.height == 0 do return true

	vk.DeviceWaitIdle(vkc.device)

	if !cleanup_swap_chain(vkc) {
		fmt.println("Failed to clean up swap chain")
		return false
	}

	if !create_swap_chain(vkc) {
		fmt.println("failed create_swap_chain")
		return false
	}
	if !create_image_views(vkc) {
		fmt.println("failed create_image_views")
		return false
	}
	if !create_render_pass(vkc) {
		fmt.println("failed create_render_pass")
		return false
	}
	if !create_graphics_pipeline(vkc) {
		fmt.println("failed create_graphics_pipeline")
		return false
	}
	if !create_framebuffers(vkc) {
		fmt.println("failed create_framebuffers")
		return false
	}
	if !create_uniform_buffers(vkc) {
		fmt.println("failed create_uniform_buffers")
		return false
	}
	if !create_descriptor_pool(vkc) {
		fmt.println("failed create_descriptor_pool")
		return false
	}
	if !create_descriptor_sets(vkc) {
		fmt.println("failed create_descriptor_sets")
		return false
	}
	if !create_command_buffers(vkc) {
		fmt.println("failed create_command_buffers")
		return false
	}
	fmt.println("done")
	return true
}

loader_instance : vk.Instance = nil

load_vulkan_proc :: proc(p: rawptr, name: cstring) {
	ptr := vuklan_proc_address_loader(loader_instance, name)
	(^vk.ProcVoidFunction)(p)^ = ptr
}


Thread_Data :: struct {
	ctx: ^VulkanContext,
	window: ^sdl.Window,
}

draw_thread :: proc(t: ^thread.Thread) {
	data := (^Thread_Data)(t.data)
	ctx := data.ctx
	window := data.window

	for {
		if !draw_frame(ctx, window) {
			fmt.println("Could not draw frame")
			return
		}
		sdl.UpdateWindowSurface(window)
		time.sleep(10 * time.Millisecond)
	}
}

start_draw_thread :: proc(vkc: ^VulkanContext, window: ^sdl.Window) -> ^thread.Thread {
	data := new(Thread_Data)
	data.ctx = vkc
	data.window = window
	t := thread.create(draw_thread)
	t.id = 1
	t.data = data
	thread.start(t)
	return t
}

main :: proc() {
	vkc : VulkanContext
	if sdl.Init(sdl.INIT_EVERYTHING) < 0 {
		fmt.printf("failed to initialize sdl", sdl.GetError())
		return
	}
	defer sdl.Quit()
	if sdl.Vulkan_LoadLibrary(nil) < 0 {
		fmt.printf("failed to load Vulkan", sdl.GetError())
		return
	}
	defer sdl.Vulkan_UnloadLibrary()

	vuklan_proc_address_loader = vk.ProcGetInstanceProcAddr(sdl.Vulkan_GetVkGetInstanceProcAddr())

	vk.load_proc_addresses(load_vulkan_proc)

	vkc.startTime = time.now()
	vkc.enableValidationLayers = true
	create_instance(&vkc)
	loader_instance = vkc.instance

	vk.load_proc_addresses(load_vulkan_proc)

	fmt.println(" pick_physical_device(&vkc);")
	ok := pick_physical_device(&vkc)
	if !ok {
		fmt.println("No suitable physical devices found.")
		return
	}

	if !check_device_extension_support(&vkc) {
		fmt.println("Device does not support needed extensions")
		return
	}

	window := sdl.CreateWindow(
		"hello_sdl2",
		cast(i32)sdl.WINDOWPOS_UNDEFINED, cast(i32)sdl.WINDOWPOS_UNDEFINED,
		screen_width, screen_height,
		sdl.WindowFlags{.SHOWN, .VULKAN,.RESIZABLE})
	if window == nil {
		fmt.printf("could not create window: {}\n", sdl.GetError())
		return
	}
	vkc.window = window
	width, height: i32
	sdl.GetWindowSize(vkc.window,&width,&height)
	vkc.width = u32(width)
	vkc.height = u32(height)
	defer sdl.DestroyWindow(window)

	fmt.println("create_surface(&vkc, window);")
	ok = create_surface(&vkc, window)
	if !ok {
		fmt.println("Could not create Vulkan surface.")
		return
	}

	fmt.println("find_queue_families(&vkc);")
	ok = find_queue_families(&vkc)
	if !ok {
		fmt.println("Could not retrieve queue families.")
		return
	}

	fmt.println("create_logical_device(&vkc);")
	ok = create_logical_device(&vkc)
	if !ok {
		fmt.println("Could not create logical device.")
		return
	}

	fmt.println("query_swap_chain_support(&vkc);")
	ok = query_swap_chain_support(&vkc)
	if !ok {
		fmt.println("Couldn't get swap chain support data.")
		return
	}

	fmt.println("create_swap_chain(&vkc);")
	ok = create_swap_chain(&vkc)
	if !ok {
		fmt.println("Could not get swap chain")
		return
	}

	if !create_image_views(&vkc) {
		fmt.println("Could not initialize swap chaing images")
		return
	}

	if !create_render_pass(&vkc) {
		fmt.println("Could not create render pass")
		return
	}

	if !create_descriptor_layout(&vkc) {
		fmt.println("Could not create descriptor layout")
		return
	}

	if !create_graphics_pipeline(&vkc) {
		fmt.println("Could not create graphics pipeline")
		return
	}

	if !create_framebuffers(&vkc) {
		fmt.println("Could not create frame buffers")
		return
	}

	if !create_command_pool(&vkc) {
		fmt.println("Could not create command pool")
		return
	}

	if !create_texture_image(&vkc) {
		fmt.println("Could not create texture image")
		return
	}

	if !create_texture_image_view(&vkc) {
		fmt.println("Could not create texture image view")
		return
	}

	if !create_texture_sampler(&vkc) {
		fmt.println("Could not create texture sampler")
		return
	}

	if !create_vertex_buffer(&vkc) {
		fmt.println("Could not create vertex buffers")
		return
	}

	if !create_index_buffer(&vkc) {
		fmt.println("Could not create index buffers")
		return
	}

	if !create_uniform_buffers(&vkc) {
		fmt.println("Could not create uniform buffers")
		return
	}

	if !create_descriptor_pool(&vkc) {
		fmt.println("Could not create descriptor pool")
		return
	}

	if !create_descriptor_sets(&vkc) {
		fmt.println("Could not create descriptor sets")
		return
	}

	if !create_command_buffers(&vkc) {
		fmt.println("Could not create command buffers")
		return
	}

	if !create_sync_objects(&vkc) {
		fmt.println("Could not create sync objects")
		return
	}

	defer cleanup(&vkc)

	dthread := start_draw_thread(&vkc, window)

	// if !draw_frame(&vkc, window) {
	// 	fmt.println("Could not draw frame")
	// 	return
	// }
	// sdl.UpdateWindowSurface(window)

	event: sdl.Event
	stop:
	for {
		for sdl.PollEvent(&event) != 0 {
			#partial switch event.type {
			case sdl.EventType.QUIT:
				break stop
			case sdl.EventType.WINDOWEVENT:
				#partial switch event.window.event {
				case sdl.WindowEventID.RESIZED:
					// fmt.println("RESIZED!!")
					// vkc.framebufferResized = true
					// fmt.printf("new size: %d %d\n",event.window.data1,event.window.data2)
					// vkc.width = u32(event.window.data1)
					// vkc.height = u32(event.window.data2)
					// if !draw_frame(&vkc, window) {
					// 	fmt.println("Could not draw frame")
					// 	return
					// }
					// sdl.UpdateWindowSurface(window)
				case sdl.WindowEventID.EXPOSED:
					// fmt.println("EXPOSED!!")
					// if !draw_frame(&vkc, window) {
					// 	fmt.println("Could not draw frame")
					// 	return
					// }
					// sdl.UpdateWindowSurface(window)
				case sdl.WindowEventID.SHOWN:
					// fmt.println("SHOWN!!")
					// if !draw_frame(&vkc, window) {
					// 	fmt.println("Could not draw frame")
					// 	return
					// }
					// sdl.UpdateWindowSurface(window)
				}
			case:
				// fmt.printf("event.type: %d\n",event.type)
				// do nothing
			}
			// if !draw_frame(&vkc, window) {
			//     fmt.println("Could not draw frame")
			//     return
			// }
			// sdl.UpdateWindowSurface(window)
		}
		// sdl.UpdateWindowSurface(window)
	}

	thread.join(dthread)
	// file := sdl.RwFromFile("Tree.jpg", "r")
	// if file == nil {
	//     fmt.printf("could not create reference to Tree.jpg: {}\n", sdl.GetError())
	//     return
	// }
	// defer sdl.FreeRw(file)
	// image := img.load_jpg_rw(file)
	// if image == nil {
	//     fmt.printf("could not load image: {}\n", sdl.GetError())
	//     return
	// }
	// defer sdl.FreeSurface(image)
	// screenSurface := sdl.GetWindowSurface(window)
	// sdl.UpperBlitScaled( image, nil, screenSurface, nil)
	// // sdl.FillRect(screenSurface, nil, sdl.MapRgb(screenSurface.format, 0xFF, 0xFF, 0xFF))
	// sdl.UpdateWindowSurface(window)

}
