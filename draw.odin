package main

import "core:mem"
import rt "core:runtime"
import "core:math/bits"
import "core:os"
import img "vendor:stb/image"
import vk "vendor:vulkan"
import vkxcb "x11/vulkan"
import xcb "x11/xcb"
import lin "core:math/linalg/glsl"
import time "core:time"
import "core:thread"
import "core:intrinsics"
import "core:c"
import "core:c/libc"
import "core:log"
import "core:strings"

screen_width :: 640
screen_height :: 480
max_frames_in_flight :: 2
API_VERSION_1_1 :: (1<<22) | (1<<12) | (0)

VERTEX_BUFFER_BIND_ID :: 0
INSTANCE_BUFFER_BIND_ID :: 1

vulkan_lib: rawptr = nil

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
	instanceBuffer: vk.Buffer,
	instanceBufferMemory: vk.DeviceMemory,
    depthImage: vk.Image,
    depthImageMemory: vk.DeviceMemory,
    depthImageView: vk.ImageView,
	descriptorSetLayout: vk.DescriptorSetLayout,
	uniformBuffers: []vk.Buffer,
	uniformBuffersMemory: []vk.DeviceMemory,
	descriptorPool: vk.DescriptorPool,
	descriptorSets: []vk.DescriptorSet,
	currentFrame: int,
	connection: ^xcb.Connection,
	screen: ^xcb.Screen,
	window: xcb.Window,
	atom_wm_delete_window: ^xcb.InternAtomReply,
	framebufferResized: bool,
	startTime: time.Time,
	textureImage: vk.Image,
	textureImageMemory: vk.DeviceMemory,
	textureImageView: vk.ImageView,
	textureSampler: vk.Sampler,
	library_handle: rawptr,
	width: u32,
	height: u32,
	exit: bool,
}

Vertex :: struct {
	pos: lin.vec3,
	color: lin.vec3,
	texCoord: lin.vec2,
}

InstanceData :: struct {
	pos: lin.vec3,
	rot: lin.vec3,
}

vuklan_proc_address_loader: vk.ProcGetInstanceProcAddr

vertices :: []Vertex {
	{{-0.5, -0.5, 0.0}, {1.0, 0.0, 0.0}, {1.0, 0.0}},
	{{0.5, -0.5, 0.0}, {0.0, 1.0, 0.0}, {0.0, 0.0}},
	{{0.5, 0.5, 0.0}, {0.0, 0.0, 1.0}, {0.0, 1.0}},
	{{-0.5, 0.5, 0.0}, {1.0, 1.0, 1.0}, {1.0, 1.0}},
}

indices :: []u16 {0,1,2,2,3,0}

extensions :: []cstring {
	vk.KHR_SURFACE_EXTENSION_NAME,
	vkxcb.KHR_XCB_SURFACE_EXTENSION_NAME,
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

	availableLayers := make([]vk.LayerProperties,layerCount, context.temp_allocator)
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

get_binding_descriptions :: proc() -> []vk.VertexInputBindingDescription {
	bindingDescription := []vk.VertexInputBindingDescription{
		{
			binding = VERTEX_BUFFER_BIND_ID,
			stride = size_of(Vertex),
			inputRate = vk.VertexInputRate.VERTEX,
		},
		{
			binding = INSTANCE_BUFFER_BIND_ID,
			stride = size_of(InstanceData),
			inputRate = vk.VertexInputRate.INSTANCE,
		},
	}
	result := make([]vk.VertexInputBindingDescription, len(bindingDescription))
	copy(result, bindingDescription)
	return result
}

get_attribute_descriptions :: proc() -> []vk.VertexInputAttributeDescription {
	attributeDescriptions := []vk.VertexInputAttributeDescription{
		{
			binding = VERTEX_BUFFER_BIND_ID,
			location = 0,
			format = vk.Format.R32G32B32_SFLOAT,
			offset = u32(offset_of(Vertex,pos)),
		},
		{
			binding = VERTEX_BUFFER_BIND_ID,
			location = 1,
			format = vk.Format.R32G32B32_SFLOAT,
			offset = u32(offset_of(Vertex,color)),
		},
		{
			binding = VERTEX_BUFFER_BIND_ID,
			location = 2,
			format = vk.Format.R32G32_SFLOAT,
			offset = u32(offset_of(Vertex, texCoord)),
		},
		{
			binding = INSTANCE_BUFFER_BIND_ID,
			location = 3,
			format = vk.Format.R32G32B32_SFLOAT,
			offset = u32(offset_of(InstanceData, pos)),
		},
		{
			binding = INSTANCE_BUFFER_BIND_ID,
			location = 4,
			format = vk.Format.R32G32B32_SFLOAT,
			offset = u32(offset_of(InstanceData, rot)),
		},
	}
	result := make([]vk.VertexInputAttributeDescription, len(attributeDescriptions))
	copy(result, attributeDescriptions)
	return result
}

create_depth_resources :: proc(vkc: ^VulkanContext) -> bool {
    depth_format := find_depth_format(vkc)

	result := create_image(vkc, vkc.swapChainExtent.width, vkc.swapChainExtent.height, depth_format, vk.ImageTiling.OPTIMAL, vk.ImageUsageFlags{.DEPTH_STENCIL_ATTACHMENT}, vk.MemoryPropertyFlags{.DEVICE_LOCAL}, &vkc.depthImage, &vkc.depthImageMemory)
	if (!result) {
		return result
	}
	vkc.depthImageView, result = create_image_view(vkc, vkc.depthImage, depth_format, vk.ImageAspectFlags{.DEPTH})
	return result
}

find_supported_format :: proc(vkc: ^VulkanContext, candidates: []vk.Format, tiling: vk.ImageTiling, features: vk.FormatFeatureFlags) -> vk.Format {
	for format, _ in candidates {
		props: vk.FormatProperties
		vk.GetPhysicalDeviceFormatProperties(vkc.physicalDevice, format, &props)
		if (tiling == vk.ImageTiling.LINEAR && (props.linearTilingFeatures & features) == features) {
			return format
		} else if (tiling == vk.ImageTiling.OPTIMAL && (props.optimalTilingFeatures & features) == features) {
			return format
		}
	}

	panic("failed to find supported format!")
}

find_depth_format :: proc(vkc: ^VulkanContext) -> vk.Format {
    return find_supported_format(vkc,
    {vk.Format.D32_SFLOAT, vk.Format.D32_SFLOAT_S8_UINT, vk.Format.D24_UNORM_S8_UINT},
        vk.ImageTiling.OPTIMAL,
        vk.FormatFeatureFlags{.DEPTH_STENCIL_ATTACHMENT})
}

has_stencil_component :: proc(format: vk.Format) -> bool {
    return format == vk.Format.D32_SFLOAT_S8_UINT || format == vk.Format.D24_UNORM_S8_UINT
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

prepare_instance_data :: proc(vkc:^VulkanContext) -> bool {
	instance_data := []InstanceData {
		{
			pos = {0.0, 0.0, 0.0},
			rot = {0.0, lin.radians(f32(90)), 0.0},
		},
		{
			pos = {0.1, 0.1, 0.1},
			rot = {0.0, 0.0, 0.0},
		},
	}

	bufferSize := vk.DeviceSize(size_of(InstanceData) * len(instance_data))

	stagingBuffer : vk.Buffer
	stagingBufferMemory: vk.DeviceMemory
	if (!create_buffer(vkc, bufferSize, vk.BufferUsageFlags{.TRANSFER_SRC}, vk.MemoryPropertyFlags{.HOST_VISIBLE, .HOST_COHERENT}, &stagingBuffer, &stagingBufferMemory)) {
		return false
	}

	if (!create_buffer(vkc, bufferSize, vk.BufferUsageFlags{.TRANSFER_DST, .VERTEX_BUFFER}, vk.MemoryPropertyFlags{.DEVICE_LOCAL}, &vkc.instanceBuffer, &vkc.instanceBufferMemory)) {
		return false
	}

	data : rawptr
	vk.MapMemory(vkc.device, stagingBufferMemory, 0, bufferSize, vk.MemoryMapFlags{}, &data)
	rt.mem_copy_non_overlapping(data, mem.raw_slice_data(instance_data), int(bufferSize))
	vk.UnmapMemory(vkc.device, stagingBufferMemory)

	copy_buffer(vkc,stagingBuffer, vkc.instanceBuffer, bufferSize)

	vk.DestroyBuffer(vkc.device, stagingBuffer, nil)
	vk.FreeMemory(vkc.device, stagingBufferMemory, nil)

	return true
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
		log.debug("Could not find validation layer support")
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
		log.debug("Successfully created instance!")
	} else {
		log.debug("Unable to create instance!")
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
	physicalDevices := make([]vk.PhysicalDevice, physicalDevicesCount, context.temp_allocator)
	vk.EnumeratePhysicalDevices(vkc.instance, &physicalDevicesCount, mem.raw_slice_data(physicalDevices))
	log.debug("Found", physicalDevicesCount, "physical devices.")
	for pd, _ in physicalDevices {
		if is_device_suitable(pd) {
			log.debug("** picked a physical device")
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
	queueFamilies := make([]vk.QueueFamilyProperties,queueFamilyCount, context.temp_allocator)
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


create_surface :: proc(vkc: ^VulkanContext) -> bool {
 	surface: vk.SurfaceKHR

	// Create the os-specific surface
	 surfaceCreateInfo := vkxcb.XcbSurfaceCreateInfoKHR{
	 	sType = vk.StructureType.XCB_SURFACE_CREATE_INFO_KHR,
		connection = vkc.connection,
		window = vkc.window,
	 }

	if vkxcb.create_xcb_surface_khr(vkc.instance, &surfaceCreateInfo, nil, &surface) != vk.Result.SUCCESS {
		panic("Could not create XCB surface!")
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
	log.debug("get_physical_device_surface_capabilities_khr")
	log.debugf("vkc.physicalDevice: %v", vkc.physicalDevice)
	if vk.GetPhysicalDeviceSurfaceCapabilitiesKHR(vkc.physicalDevice, vkc.surface, &vkc.capabilities) != vk.Result.SUCCESS {
		return false
	}

	formatCount:u32
	log.debug("get_physical_device_surface_formats_khr")
	vk.GetPhysicalDeviceSurfaceFormatsKHR(vkc.physicalDevice, vkc.surface, &formatCount, nil)
	if formatCount == 0 {
		return false
	}
	vkc.formats = make([]vk.SurfaceFormatKHR,formatCount)
	log.debug("get_physical_device_surface_formats_khr")
	vk.GetPhysicalDeviceSurfaceFormatsKHR(vkc.physicalDevice, vkc.surface, &formatCount, mem.raw_slice_data(vkc.formats))

	presentModeCount:u32
	log.debug("get_physical_device_surface_present_modes_khr")
	vk.GetPhysicalDeviceSurfacePresentModesKHR(vkc.physicalDevice, vkc.surface, &presentModeCount, nil)
	if presentModeCount == 0 {
		return false
	}
	vkc.presentModes = make([]vk.PresentModeKHR,presentModeCount)
	log.debug("get_physical_device_surface_present_modes_khr")
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

choose_swap_extent :: proc(capabilities: ^vk.SurfaceCapabilitiesKHR, width, height: u32) -> vk.Extent2D {
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
	extent := choose_swap_extent(&vkc.capabilities, vkc.width, vkc.height)

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
	if vkc.swapChainImages == nil {
		vkc.swapChainImages = make([]vk.Image,imageCount)
	} else if len(vkc.swapChainImages) != int(imageCount) {
		delete(vkc.swapChainImages)
		vkc.swapChainImages = make([]vk.Image,imageCount)
	}
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

	bindingDescriptions : []vk.VertexInputBindingDescription
	{
		context.allocator = context.temp_allocator
		bindingDescriptions = get_binding_descriptions()
	}
	attributeDescriptions : []vk.VertexInputAttributeDescription
	{
		context.allocator = context.temp_allocator
		attributeDescriptions = get_attribute_descriptions()
	}

	vertexInputInfo := vk.PipelineVertexInputStateCreateInfo{
		sType = vk.StructureType.PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
		vertexBindingDescriptionCount = u32(len(bindingDescriptions)),
		vertexAttributeDescriptionCount = u32(len(attributeDescriptions)),
		pVertexBindingDescriptions = mem.raw_slice_data(bindingDescriptions),
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
		// cullMode = vk.CullModeFlags{.BACK},
		cullMode = vk.CullModeFlags{},
		frontFace = vk.FrontFace.COUNTER_CLOCKWISE,
		depthBiasEnable = false,
	}

	depthStencil := vk.PipelineDepthStencilStateCreateInfo {
		sType = vk.StructureType.PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO,
		depthTestEnable = true,
		depthWriteEnable = true,
		depthCompareOp = vk.CompareOp.LESS_OR_EQUAL,
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
		stageCount = auto_cast len(shaderStages),
		pStages = mem.raw_slice_data(shaderStages),
		pVertexInputState = &vertexInputInfo,
		pInputAssemblyState = &inputAssembly,
		pViewportState = &viewportState,
		pRasterizationState = &rasterizer,
		pDepthStencilState = &depthStencil,
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
	delete(vkc.swapChainFramebuffers)
	vkc.swapChainFramebuffers = nil
	delete(vkc.commandBuffers)
	vkc.commandBuffers = nil
	delete(vkc.swapChainImageViews)
	vkc.swapChainImageViews = nil
	delete(vkc.uniformBuffers)
	delete(vkc.uniformBuffersMemory)
	vkc.uniformBuffers = nil
	vkc.uniformBuffersMemory = nil

	vk.DestroySampler(vkc.device, vkc.textureSampler, nil)
	vk.DestroyImageView(vkc.device, vkc.textureImageView, nil)
	vk.DestroyImage(vkc.device, vkc.textureImage, nil)
	vk.FreeMemory(vkc.device, vkc.textureImageMemory, nil)

	vk.DestroyDescriptorSetLayout(vkc.device, vkc.descriptorSetLayout, nil)
	vk.DestroyBuffer(vkc.device,vkc.indexBuffer,nil)
	vk.FreeMemory(vkc.device, vkc.indexBufferMemory, nil)
	vk.DestroyBuffer(vkc.device,vkc.vertexBuffer,nil)
	vk.FreeMemory(vkc.device, vkc.vertexBufferMemory, nil)
	vk.DestroyBuffer(vkc.device,vkc.instanceBuffer,nil)
	vk.FreeMemory(vkc.device, vkc.instanceBufferMemory, nil)

	for i := 0; i < max_frames_in_flight; i += 1 {
		vk.DestroySemaphore(vkc.device, vkc.renderFinishedSemaphores[i], nil)
		vk.DestroySemaphore(vkc.device, vkc.imageAvailableSemaphores[i], nil)
		vk.DestroyFence(vkc.device, vkc.inFlightFences[i], nil)
	}
	delete(vkc.renderFinishedSemaphores)
	vkc.renderFinishedSemaphores = nil
	delete(vkc.imageAvailableSemaphores)
	vkc.imageAvailableSemaphores = nil
	delete(vkc.inFlightFences)
	vkc.inFlightFences = nil

	vk.DestroyCommandPool(vkc.device, vkc.commandPool, nil)

	vk.DestroyDevice(vkc.device, nil)

	vk.DestroySurfaceKHR(vkc.instance, vkc.surface, nil)
	vk.DestroyInstance(vkc.instance, nil)

	delete(vkc.formats)
	vkc.formats = nil
	delete(vkc.presentModes)
	vkc.presentModes = nil
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

	depthAttachment := vk.AttachmentDescription{
		format = find_depth_format(vkc),
		samples = vk.SampleCountFlags{._1},
		loadOp = vk.AttachmentLoadOp.CLEAR,
		storeOp = vk.AttachmentStoreOp.DONT_CARE,
		stencilLoadOp = vk.AttachmentLoadOp.DONT_CARE,
		stencilStoreOp = vk.AttachmentStoreOp.DONT_CARE,
		initialLayout = vk.ImageLayout.UNDEFINED,
		finalLayout = vk.ImageLayout.DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
	}

	colorAttachmentRef := vk.AttachmentReference{
		attachment = 0,
		layout = vk.ImageLayout.COLOR_ATTACHMENT_OPTIMAL,
	}

	depthAttachmentRef := vk.AttachmentReference {
		attachment = 1,
		layout = vk.ImageLayout.DEPTH_STENCIL_ATTACHMENT_OPTIMAL,
	}

	subpass := vk.SubpassDescription{
		pipelineBindPoint = vk.PipelineBindPoint.GRAPHICS,
		colorAttachmentCount = 1,
		pColorAttachments = &colorAttachmentRef,
		pDepthStencilAttachment = &depthAttachmentRef,
	}

    dependency := vk.SubpassDependency {
        srcSubpass = vk.SUBPASS_EXTERNAL,
        dstSubpass = 0,
        srcStageMask = vk.PipelineStageFlags{.COLOR_ATTACHMENT_OUTPUT,.EARLY_FRAGMENT_TESTS},
        srcAccessMask = vk.AccessFlags{},
        dstStageMask = vk.PipelineStageFlags{.COLOR_ATTACHMENT_OUTPUT,.EARLY_FRAGMENT_TESTS},
        dstAccessMask = vk.AccessFlags{.COLOR_ATTACHMENT_WRITE,.DEPTH_STENCIL_ATTACHMENT_WRITE},
	}

	attachments := []vk.AttachmentDescription{colorAttachment, depthAttachment}
	renderPassInfo := vk.RenderPassCreateInfo{
		sType = vk.StructureType.RENDER_PASS_CREATE_INFO,
		attachmentCount = auto_cast len(attachments),
		pAttachments = mem.raw_slice_data(attachments),
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
	if vkc.swapChainFramebuffers == nil {
		vkc.swapChainFramebuffers = make([]vk.Framebuffer, len(vkc.swapChainImageViews))
	} else if len(vkc.swapChainFramebuffers) != len(vkc.swapChainImageViews) {
		delete(vkc.swapChainFramebuffers)
		vkc.swapChainFramebuffers = make([]vk.Framebuffer, len(vkc.swapChainImageViews))
	}

	for sciv, i in vkc.swapChainImageViews {
		attachments := []vk.ImageView{sciv, vkc.depthImageView}

		framebufferInfo := vk.FramebufferCreateInfo{
			sType = vk.StructureType.FRAMEBUFFER_CREATE_INFO,
			renderPass = vkc.renderPass,
			attachmentCount = auto_cast len(attachments),
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
			log.debug("Failed to read:", filename, " error:", errno)
			return nil, false
		}
		defer os.close(fd)
		size: i64
		size, errno = os.file_size(fd)
		if errno != 0 {
			log.debug("Failed to get file size:", filename, " error:", errno)
			return nil, false
		}
		result := make([]byte,size)
		_, errno = os.read(fd,result)
		if errno != 0 {
			delete(result)
			log.debug("Failed to read file:", filename, " error:", errno)
			return nil, false
		}

		return result, true
	}


create_image_views :: proc(vkc: ^VulkanContext) -> bool {
	if vkc.swapChainImageViews == nil {
		vkc.swapChainImageViews = make([]vk.ImageView,len(vkc.swapChainImages))
	} else if len(vkc.swapChainImageViews) != len(vkc.swapChainImages) {
		delete(vkc.swapChainImageViews)
		vkc.swapChainImageViews = make([]vk.ImageView,len(vkc.swapChainImages))
	}

	for _, i in vkc.swapChainImageViews {
		view, result := create_image_view(vkc, vkc.swapChainImages[i], vkc.swapChainImageFormat, vk.ImageAspectFlags{.COLOR})
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
	if vkc.commandBuffers == nil {
		vkc.commandBuffers = make([]vk.CommandBuffer,len(vkc.swapChainFramebuffers))
	} else if len(vkc.commandBuffers) != len(vkc.swapChainFramebuffers) {
		delete(vkc.commandBuffers)
		vkc.commandBuffers = make([]vk.CommandBuffer,len(vkc.swapChainFramebuffers))
	}

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

		clearValues := []vk.ClearValue{
			{
				color = {
					float32 = {0.0, 0.0, 0.0, 1.0},
				},
			},
			{
				depthStencil = {
					depth = 1.0,
					stencil = 0,
				},
			},
		}

		renderPassInfo := vk.RenderPassBeginInfo {
			sType = vk.StructureType.RENDER_PASS_BEGIN_INFO,
			renderPass = vkc.renderPass,
			framebuffer = vkc.swapChainFramebuffers[i],
			renderArea = {
				offset = {0, 0},
				extent = vkc.swapChainExtent,
			},
			clearValueCount = u32(len(clearValues)),
			pClearValues = mem.raw_slice_data(clearValues),
		}

		vk.CmdBeginRenderPass(cb, &renderPassInfo, vk.SubpassContents.INLINE)
		vk.CmdBindPipeline(cb, vk.PipelineBindPoint.GRAPHICS, vkc.graphicsPipeline)

		offsets := []vk.DeviceSize{0}
		vk.CmdBindVertexBuffers(vkc.commandBuffers[i], VERTEX_BUFFER_BIND_ID, 1, &vkc.vertexBuffer, mem.raw_slice_data(offsets))
		vk.CmdBindVertexBuffers(vkc.commandBuffers[i], INSTANCE_BUFFER_BIND_ID, 1, &vkc.instanceBuffer, mem.raw_slice_data(offsets))
		vk.CmdBindIndexBuffer(vkc.commandBuffers[i],vkc.indexBuffer,0,vk.IndexType.UINT16)
		vk.CmdBindDescriptorSets(vkc.commandBuffers[i], vk.PipelineBindPoint.GRAPHICS, vkc.pipelineLayout, 0, 1, &vkc.descriptorSets[i], 0, nil)
		vk.CmdDrawIndexed(vkc.commandBuffers[i], u32(len(indices)), 2, 0, 0, 0)

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

	if vkc.uniformBuffers == nil {
		vkc.uniformBuffers = make([]vk.Buffer,len(vkc.swapChainImages))
	} else if len(vkc.uniformBuffers) != len(vkc.swapChainImages) {
		delete(vkc.uniformBuffers)
		vkc.uniformBuffers = make([]vk.Buffer,len(vkc.swapChainImages))
	}

	if vkc.uniformBuffersMemory == nil {
		vkc.uniformBuffersMemory = make([]vk.DeviceMemory,len(vkc.swapChainImages))
	} else if len(vkc.uniformBuffersMemory) != len(vkc.swapChainImages) {
		delete(vkc.uniformBuffersMemory)
		vkc.uniformBuffersMemory = make([]vk.DeviceMemory,len(vkc.swapChainImages))
	}

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
	layouts := make([]vk.DescriptorSetLayout,len(vkc.swapChainImages), context.temp_allocator)
	for _, i in layouts {
		layouts[i] = vkc.descriptorSetLayout
	}
	allocInfo := vk.DescriptorSetAllocateInfo{
		sType = vk.StructureType.DESCRIPTOR_SET_ALLOCATE_INFO,
		descriptorPool = vkc.descriptorPool,
		descriptorSetCount = u32(len(vkc.swapChainImages)),
		pSetLayouts = mem.raw_slice_data(layouts),
	}

	if vkc.descriptorSets == nil {
		vkc.descriptorSets = make([]vk.DescriptorSet,len(vkc.swapChainImages))
	} else if len(vkc.descriptorSets) != len(vkc.swapChainImages) {
		delete(vkc.descriptorSets)
		vkc.descriptorSets = make([]vk.DescriptorSet,len(vkc.swapChainImages))
	}

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

// sdl_pixelformat_rgba8888 := sdl.DEFINE_PIXELFORMAT(sdl.PIXELTYPE_PACKED32, sdl.PACKEDORDER_ABGR, sdl.PACKEDLAYOUT_8888, 32, 4)

create_image_view :: proc(vkc: ^VulkanContext, image: vk.Image, format: vk.Format, aspect_flags: vk.ImageAspectFlags) -> (vk.ImageView, bool) {
 viewInfo := vk.ImageViewCreateInfo {
		sType = vk.StructureType.IMAGE_VIEW_CREATE_INFO,
		image = image,
		viewType = vk.ImageViewType.D2,
		format = format,
		subresourceRange = {
			aspectMask = aspect_flags, //vk.ImageAspectFlags{.COLOR},
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
			log.debug("failed to create texture sampler!")
			return false
		}
		return true
}

create_texture_image_view :: proc(vkc: ^VulkanContext) -> bool {
	textureImageView, result := create_image_view(vkc, vkc.textureImage, vk.Format.R8G8B8A8_SRGB, vk.ImageAspectFlags{.COLOR})
	vkc.textureImageView = textureImageView
	return result
}

create_texture_image :: proc(vkc: ^VulkanContext) -> bool {
	w, h, channels: c.int
	origImageSurface := img.load("textures/texture.jpg", &w, &h, &channels, 4)
	if origImageSurface == nil {
		log.debug("Error loading texture image")
		return false
	}

	defer img.image_free(origImageSurface)
	imageSize : vk.DeviceSize = vk.DeviceSize(w * h * 4)
	stagingBuffer : vk.Buffer
	stagingBufferMemory : vk.DeviceMemory

	if !create_buffer(vkc, imageSize, vk.BufferUsageFlags{.TRANSFER_SRC}, vk.MemoryPropertyFlags{.HOST_VISIBLE,.HOST_COHERENT}, &stagingBuffer, &stagingBufferMemory) {
		return false
	}
	defer vk.DestroyBuffer(vkc.device, stagingBuffer, nil)
	defer vk.FreeMemory(vkc.device, stagingBufferMemory, nil)

	data: rawptr
	vk.MapMemory(vkc.device, stagingBufferMemory, 0, imageSize, vk.MemoryMapFlags{}, &data)
	rt.mem_copy_non_overlapping(data, origImageSurface, int(imageSize))
	vk.UnmapMemory(vkc.device, stagingBufferMemory)

	if !create_image(vkc, u32(w), u32(h), vk.Format.R8G8B8A8_SRGB,vk.ImageTiling.OPTIMAL, vk.ImageUsageFlags{.TRANSFER_DST, .SAMPLED}, vk.MemoryPropertyFlags{.DEVICE_LOCAL}, &vkc.textureImage, &vkc.textureImageMemory) {
		log.debug("Error: could not create image")
		return false
	}

	if !transition_image_layout(vkc, vkc.textureImage, vk.Format.R8G8B8A8_SRGB, vk.ImageLayout.UNDEFINED, vk.ImageLayout.TRANSFER_DST_OPTIMAL) {
		return false
	}
	copy_buffer_to_image(vkc, stagingBuffer, vkc.textureImage, u32(w), u32(h))
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
		log.debug("unsupported layout transition!")
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
		log.debug("Failed to create image for the texture map")
		return false
	}

	memRequirements: vk.MemoryRequirements
	vk.GetImageMemoryRequirements(vkc.device,image^,&memRequirements)

	mt, ok := find_memory_type(vkc, memRequirements.memoryTypeBits, properties)
	if !ok {
		log.debug("Error: failed to find memory")
		return false
	}

	allocInfo := vk.MemoryAllocateInfo {
		sType = vk.StructureType.MEMORY_ALLOCATE_INFO,
		allocationSize = memRequirements.size,
		memoryTypeIndex = mt,
	}

	if vk.AllocateMemory(vkc.device, &allocInfo, nil, imageMemory) != vk.Result.SUCCESS {
		log.debug("Error: failed to allocate memory in device")
		return false
	}

	vk.BindImageMemory(vkc.device, image^, imageMemory^, 0)

	return true
}

create_sync_objects :: proc(vkc: ^VulkanContext) -> bool {
	if vkc.imageAvailableSemaphores == nil {
		vkc.imageAvailableSemaphores = make([]vk.Semaphore,max_frames_in_flight)
	} else if len(vkc.imageAvailableSemaphores) != max_frames_in_flight {
		delete(vkc.imageAvailableSemaphores)
		vkc.imageAvailableSemaphores = make([]vk.Semaphore,max_frames_in_flight)
	}
	if vkc.renderFinishedSemaphores == nil {
		vkc.renderFinishedSemaphores = make([]vk.Semaphore,max_frames_in_flight)
	} else if len(vkc.renderFinishedSemaphores) != max_frames_in_flight {
		delete(vkc.renderFinishedSemaphores)
		vkc.renderFinishedSemaphores = make([]vk.Semaphore,max_frames_in_flight)
	}
	if vkc.inFlightFences == nil {
		vkc.inFlightFences = make([]vk.Fence,max_frames_in_flight)
	} else if len(vkc.inFlightFences) != max_frames_in_flight {
		delete(vkc.inFlightFences)
		vkc.inFlightFences = make([]vk.Fence,max_frames_in_flight)
	}
	if vkc.imagesInFlight == nil {
		vkc.imagesInFlight = make([]vk.Fence,len(vkc.swapChainImages))
	} else if len(vkc.imagesInFlight) != len(vkc.swapChainImages) {
		delete(vkc.imagesInFlight)
		vkc.imagesInFlight = make([]vk.Fence,len(vkc.swapChainImages))
	}

	semaphoreInfo := vk.SemaphoreCreateInfo{
		sType = vk.StructureType.SEMAPHORE_CREATE_INFO,
	}

	fenceInfo := vk.FenceCreateInfo{
		sType = vk.StructureType.FENCE_CREATE_INFO,
		flags = vk.FenceCreateFlags{.SIGNALED},
	}

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

update_uniform_buffer :: proc(vkc: ^VulkanContext, currentImage: u32, scale: f32) {
	ubo := UniformBufferObject {
		model = lin.mat4Rotate(VEC3_Z_AXIS, scale*lin.radians(f32(360))),
		view = lin.mat4LookAt(lin.vec3{2,2,2},lin.vec3{0,0,0}, VEC3_Z_AXIS),
		proj = lin.mat4Perspective(lin.radians(f32(45)),f32(vkc.swapChainExtent.width)/f32(vkc.swapChainExtent.height),0.1,10),
	}

	ubo.proj[1][1] *= -1

	data: rawptr
	vk.MapMemory(vkc.device,vkc.uniformBuffersMemory[currentImage],0,size_of(ubo),vk.MemoryMapFlags{},&data)
	rt.mem_copy_non_overlapping(data,&ubo,size_of(ubo))
	vk.UnmapMemory(vkc.device,vkc.uniformBuffersMemory[currentImage])
}

draw_frame :: proc(vkc: ^VulkanContext) -> bool {
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

	err: ^xcb.GenericError
	pointer := xcb.query_pointer_reply(vkc.connection,xcb.query_pointer(vkc.connection, vkc.window), &err)
	if err != nil {
		libc.free(err)
		log.error("Could not get pointer location")
		return false
	}
	defer libc.free(pointer)
	geometry := xcb.get_geometry_reply(vkc.connection, xcb.get_geometry(vkc.connection, pointer.root), &err)
	if err != nil {
		libc.free(err)
		log.error("Could not get the geometry of the root window")
		return false
	}
	defer libc.free(geometry)
	scale := f32(pointer.rootX)/f32(geometry.width)

	update_uniform_buffer(vkc, imageIndex, scale)

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
			log.debug("failed to recreate swap chain")
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
    vk.DestroyImageView(vkc.device, vkc.depthImageView, nil)
    vk.DestroyImage(vkc.device, vkc.depthImage, nil)
    vk.FreeMemory(vkc.device, vkc.depthImageMemory, nil)

	for framebuffer, _ in vkc.swapChainFramebuffers {
		vk.DestroyFramebuffer(vkc.device, framebuffer, nil)
	}

	vk.FreeCommandBuffers(vkc.device, vkc.commandPool, u32(len(vkc.commandBuffers)), mem.raw_slice_data(vkc.commandBuffers))

	vk.DestroyPipeline(vkc.device, vkc.graphicsPipeline, nil)
	vk.DestroyPipelineLayout(vkc.device, vkc.pipelineLayout, nil)
	vk.DestroyRenderPass(vkc.device, vkc.renderPass, nil)

	for imageView, _ in vkc.swapChainImageViews {
		vk.DestroyImageView(vkc.device, imageView, nil)
	}

	vk.DestroySwapchainKHR(vkc.device, vkc.swapChain, nil)

	for i := 0; i < len(vkc.swapChainImages); i += 1 {
		vk.DestroyBuffer(vkc.device, vkc.uniformBuffers[i], nil)
		vk.FreeMemory(vkc.device, vkc.uniformBuffersMemory[i], nil)
	}

	vk.DestroyDescriptorPool(vkc.device, vkc.descriptorPool, nil)

	return true
}

recreate_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
	if vkc.width == 0 || vkc.height == 0 do return true

	vk.DeviceWaitIdle(vkc.device)

	if !cleanup_swap_chain(vkc) {
		log.debug("Failed to clean up swap chain")
		return false
	}

	if !create_swap_chain(vkc) {
		log.debug("failed create_swap_chain")
		return false
	}
	if !create_image_views(vkc) {
		log.debug("failed create_image_views")
		return false
	}
	if !create_render_pass(vkc) {
		log.debug("failed create_render_pass")
		return false
	}
	if !create_graphics_pipeline(vkc) {
		log.debug("failed create_graphics_pipeline")
		return false
	}
	if !create_depth_resources(vkc) {
		log.debug("failed create_depth_resources")
		return false
	}
	if !create_framebuffers(vkc) {
		log.debug("failed create_framebuffers")
		return false
	}
	if !create_uniform_buffers(vkc) {
		log.debug("failed create_uniform_buffers")
		return false
	}
	if !create_descriptor_pool(vkc) {
		log.debug("failed create_descriptor_pool")
		return false
	}
	if !create_descriptor_sets(vkc) {
		log.debug("failed create_descriptor_sets")
		return false
	}
	if !create_command_buffers(vkc) {
		log.debug("failed create_command_buffers")
		return false
	}
	return true
}

loader_instance : vk.Instance = nil

load_vulkan_proc :: proc(p: rawptr, name: cstring) {
	ptr := vuklan_proc_address_loader(loader_instance, name)
	(^vk.ProcVoidFunction)(p)^ = ptr
}


Thread_Data :: struct {
	ctx: ^VulkanContext,
}

draw_thread :: proc(t: ^thread.Thread) {
	data := (^Thread_Data)(t.data)
	ctx := data.ctx
	// window := ctx.window

	exit := intrinsics.atomic_load(&ctx.exit)
	for !exit {
		if !draw_frame(ctx) {
			log.debug("Could not draw frame")
			return
		}
		// sdl.UpdateWindowSurface(window)
		time.sleep(16 * time.Millisecond)
		exit = intrinsics.atomic_load(&ctx.exit)
	}
}

start_draw_thread :: proc(vkc: ^VulkanContext) -> ^thread.Thread {
	data := new(Thread_Data)
	data.ctx = vkc
	t := thread.create(draw_thread)
	t.id = 1
	t.data = data
	thread.start(t)
	return t
}

setup_connection :: proc(vkc: ^VulkanContext) {
	scr: c.int

	// xcb_connect always returns a non-NULL pointer to a xcb_connection_t,
	// even on failure. Callers need to use xcb_connection_has_error() to
	// check for failure. When finished, use xcb_disconnect() to close the
	// connection and free the structure.
	vkc.connection = xcb.connect(nil, &scr)
	assert(vkc.connection != nil)
	if xcb.connection_has_error(vkc.connection) != 0 {
		panic("Could not find a compatible Vulkan ICD!")
	}

	setup := xcb.get_setup(vkc.connection)
	iter := xcb.setup_roots_iterator(setup)
	// for ;scr > 0; scr -= 1 {
	// 	xcb.screen_next(&iter)
	// }
	vkc.screen = iter.data
}

intern_atom_helper :: proc(conn: ^xcb.Connection, only_if_exists: bool, str: string) -> ^xcb.InternAtomReply {
	cstr := strings.clone_to_cstring(str)
	defer delete(cstr)
	cookie := xcb.intern_atom(conn, u8(only_if_exists), auto_cast len(str), cstr)
	err: ^xcb.GenericError
	r := xcb.intern_atom_reply(conn, cookie, &err)
	if err != nil {
		log.panicf("Error interning symbol: %v", err)
	}
	return r
}


setup_window :: proc(vkc: ^VulkanContext, title: string, name: string) {
	// value_mask := xcb.CwFlags{.BackPixel, .EventMask}
	value_mask := xcb.CwFlags{.EventMask}
	value_list: [32]u32

	vkc.window = xcb.generate_id(vkc.connection)

	log.debugf("vkc.window: %v", vkc.window)

	eventFlags := xcb.EventMaskFlags{.KeyRelease, .KeyPress, .Exposure, .StructureNotify, .PointerMotion, .ButtonPress, .ButtonRelease}
	// value_list[0] = vkc.screen.blackPixel
	value_list[0] = transmute(u32)(eventFlags)

	log.debugf("value_list: %v", value_list)

	xcb.create_window(vkc.connection,
		xcb.COPY_FROM_PARENT,
		vkc.window,
		vkc.screen.root,
		0,
		0,
		640,
		480,
		0,
		xcb.WindowClass.InputOutput,
		vkc.screen.rootVisual,
		value_mask,
		mem.raw_slice_data(value_list[:]))

	/* Magic code that will send notification when window is destroyed */
	reply := intern_atom_helper(vkc.connection, true, "WM_PROTOCOLS")
	vkc.atom_wm_delete_window = intern_atom_helper(vkc.connection, false, "WM_DELETE_WINDOW")

	xcb.change_property(vkc.connection,
		auto_cast xcb.PropMode.Replace,
		vkc.window,
		reply.atom,
		4,
		32,
		1,
		&vkc.atom_wm_delete_window.atom)

	window_title := strings.clone_to_cstring(title)
	defer delete(window_title)
	xcb.change_property(vkc.connection,
		auto_cast xcb.PropMode.Replace,
		vkc.window,
		auto_cast xcb.AtomEnum.AtomWmName,
		auto_cast xcb.AtomEnum.AtomString,
		8,
		auto_cast len(title),
		auto_cast window_title)

	libc.free(reply)


	cname := strings.clone_to_cstring(name)
	defer delete(cname)
	/**
	 * Set the WM_CLASS property to display
	 * title in dash tooltip and application menu
	 * on GNOME and other desktop environments
	 */
	wm_class: strings.Builder
	strings.init_builder(&wm_class, len(name) + len(title) + 2)
	defer strings.destroy_builder(&wm_class)
	strings.write_string(&wm_class, name)
	strings.write_byte(&wm_class, 0)
	strings.write_string(&wm_class, title)
	strings.write_byte(&wm_class, 0)
	cwm_class := strings.unsafe_string_to_cstring(strings.to_string(wm_class))
	xcb.change_property(vkc.connection,
		auto_cast xcb.PropMode.Replace,
		vkc.window,
		auto_cast xcb.AtomEnum.AtomWmClass,
		auto_cast xcb.AtomEnum.AtomString,
		8,
		u32(strings.builder_len(wm_class)),
		auto_cast cwm_class)

	vkc.width = 640
	vkc.height = 480

	xcb.map_window(vkc.connection, vkc.window)
	xcb.flush(vkc.connection)
}

set_proc_address :: proc(p: rawptr, name: cstring) {
	(^rawptr)(p)^ = os._unix_dlsym(vulkan_lib, name)
}

load_vulkan :: proc() {
	vulkan_lib = os.dlopen("libvulkan.so", os.RTLD_LAZY)
	if vulkan_lib == nil {
		log.panicf("Could not load libvulkan: %s", os.dlerror())
	}

	vk.load_proc_addresses(set_proc_address)
}

unload_vulkan :: proc() {
	os.dlclose(vulkan_lib)
}

main :: proc() {
	context.logger = log.create_console_logger()
	vkc : VulkanContext
	setup_connection(&vkc)

	load_vulkan()
	defer unload_vulkan()

	vkc.startTime = time.now()
	vkc.enableValidationLayers = true
	create_instance(&vkc)
	loader_instance = vkc.instance

	log.debug(" pick_physical_device(&vkc);")
	ok := pick_physical_device(&vkc)
	if !ok {
		log.debug("No suitable physical devices found.")
		return
	}

	if !check_device_extension_support(&vkc) {
		log.debug("Device does not support needed extensions")
		return
	}

	setup_window(&vkc, "title", "name")

	log.debug("create_surface(&vkc, window);")
	ok = create_surface(&vkc)
	if !ok {
		log.debug("Could not create Vulkan surface.")
		return
	}

	log.debug("find_queue_families(&vkc);")
	ok = find_queue_families(&vkc)
	if !ok {
		log.debug("Could not retrieve queue families.")
		return
	}

	log.debug("create_logical_device(&vkc);")
	ok = create_logical_device(&vkc)
	if !ok {
		log.debug("Could not create logical device.")
		return
	}

	log.debug("query_swap_chain_support(&vkc);")
	ok = query_swap_chain_support(&vkc)
	if !ok {
		log.debug("Couldn't get swap chain support data.")
		return
	}

	log.debug("create_swap_chain(&vkc);")
	ok = create_swap_chain(&vkc)
	if !ok {
		log.debug("Could not get swap chain")
		return
	}

	if !create_image_views(&vkc) {
		log.debug("Could not initialize swap chaing images")
		return
	}

	if !create_command_pool(&vkc) {
		log.debug("Could not create command pool")
		return
	}

	if !prepare_instance_data(&vkc) {
		log.debug("Could not prepare instance data")
	}

	if !create_render_pass(&vkc) {
		log.debug("Could not create render pass")
		return
	}

	if !create_descriptor_layout(&vkc) {
		log.debug("Could not create descriptor layout")
		return
	}

	if !create_graphics_pipeline(&vkc) {
		log.debug("Could not create graphics pipeline")
		return
	}

	if !create_depth_resources(&vkc) {
		log.debug("Could not create depth resources")
		return
	}

	if !create_framebuffers(&vkc) {
		log.debug("Could not create frame buffers")
		return
	}

	if !create_texture_image(&vkc) {
		log.debug("Could not create texture image")
		return
	}

	if !create_texture_image_view(&vkc) {
		log.debug("Could not create texture image view")
		return
	}

	if !create_texture_sampler(&vkc) {
		log.debug("Could not create texture sampler")
		return
	}

	if !create_vertex_buffer(&vkc) {
		log.debug("Could not create vertex buffers")
		return
	}

	if !create_index_buffer(&vkc) {
		log.debug("Could not create index buffers")
		return
	}

	if !create_uniform_buffers(&vkc) {
		log.debug("Could not create uniform buffers")
		return
	}

	if !create_descriptor_pool(&vkc) {
		log.debug("Could not create descriptor pool")
		return
	}

	if !create_descriptor_sets(&vkc) {
		log.debug("Could not create descriptor sets")
		return
	}

	if !create_command_buffers(&vkc) {
		log.debug("Could not create command buffers")
		return
	}

	if !create_sync_objects(&vkc) {
		log.debug("Could not create sync objects")
		return
	}

	defer cleanup(&vkc)

	dthread := start_draw_thread(&vkc)

	event: ^xcb.GenericEvent = nil
	quit := false

	for event = xcb.poll_for_event(vkc.connection);!quit;event = xcb.poll_for_event(vkc.connection) {
		if event != nil {
			switch (event.responseType & 0x7f) {
			case xcb.CLIENT_MESSAGE:
				if (^xcb.ClientMessageEvent)(event).data.data32[0] == vkc.atom_wm_delete_window.atom {
					intrinsics.atomic_store(&vkc.exit, true)
					quit = true
				}
			case xcb.DESTROY_NOTIFY:
				quit = true
				intrinsics.atomic_store(&vkc.exit, true)
			case:
				// nothing
			}
			libc.free(event)
		}
	}
	log.debug("Quit, waiting...")
	thread.join(dthread)
	log.debug("Done")
}
