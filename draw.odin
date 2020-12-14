package main

import "core:fmt"
import "core:mem"
import rt "core:runtime"
import "core:math/bits"
import "core:os"
import sdl "shared:sdl2"
import img "shared:sdl2/image"
import vk "shared:vulkan"
import lin "core:math/linalg"
import time "core:time"

screen_width :: 640;
screen_height :: 480;
max_frames_in_flight :: 2;

UniformBufferObject :: struct {
    model: lin.Matrix4,
    view: lin.Matrix4,
    proj: lin.Matrix4,
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
    pos: lin.Vector2,
    color: lin.Vector3,
    texCoord: lin.Vector2,
};

vertices :: []Vertex {
    {{-0.5, -0.5}, {1.0, 0.0, 0.0}, {1.0, 0.0}},
    {{0.5, -0.5}, {0.0, 1.0, 0.0}, {0.0, 0.0}},
    {{0.5, 0.5}, {0.0, 0.0, 1.0}, {0.0, 1.0}},
    {{-0.5, 0.5}, {1.0, 1.0, 1.0}, {1.0, 1.0}},
};

indices :: []u16 {0,1,2,2,3,0};

extensions :: []cstring {
    vk.KHR_SURFACE_EXTENSION_NAME,
    vk.KHR_XLIB_SURFACE_EXTENSION_NAME,
    vk.KHR_XCB_SURFACE_EXTENSION_NAME,
    vk.KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME,
    vk.KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME,
};

validation_layers :: []cstring {
    "VK_LAYER_KHRONOS_validation",
};

device_extensions :: []cstring {
    vk.KHR_SWAPCHAIN_EXTENSION_NAME,
};

check_validation_layer_support :: proc() -> bool {
    layerCount: u32;
    vk.enumerate_instance_layer_properties(&layerCount, nil);

    availableLayers := make([]vk.LayerProperties,layerCount);
    vk.enumerate_instance_layer_properties(&layerCount, mem.raw_slice_data(availableLayers));

    for layerName, _ in validation_layers {
        layerFound := false;

        for _, i in availableLayers {
            layerProperties := availableLayers[i];

            if layerName == transmute(cstring)(&layerProperties.layerName) {
                layerFound = true;
                break;
            }
        }

        if !layerFound {
            return false;
        }
    }

    return true;
}

get_binding_description :: proc() -> vk.VertexInputBindingDescription {
    bindingDescription := vk.VertexInputBindingDescription{
        binding = 0,
        stride = size_of(Vertex),
        inputRate = vk.VertexInputRate.Vertex,
    };

    return bindingDescription;
}

get_attribute_descriptions :: proc() -> []vk.VertexInputAttributeDescription {
    attributeDescriptions := []vk.VertexInputAttributeDescription{
        {
            binding = 0,
            location = 0,
            format = vk.Format.R32G32Sfloat,
            offset = u32(offset_of(Vertex,pos)),
        },
        {
            binding = 0,
            location = 1,
            format = vk.Format.R32G32B32Sfloat,
            offset = u32(offset_of(Vertex,color)),
        },
        {
            binding = 0,
            location = 2,
            format = vk.Format.R32G32Sfloat,
            offset = u32(offset_of(Vertex, texCoord)),
        },
    };

    return attributeDescriptions;
}

find_memory_type :: proc(vkc:^VulkanContext, typeFilter:u32, properties: vk.MemoryPropertyFlags) -> (u32, bool) {
    memProperties := vk.PhysicalDeviceMemoryProperties{};
    vk.get_physical_device_memory_properties(vkc.physicalDevice, &memProperties);

    for i : u32 = 0; i < memProperties.memoryTypeCount; i += 1 {
        if (typeFilter & (1 << i)) != 0 && (memProperties.memoryTypes[i].propertyFlags & properties) == properties {
            return i, true;
        }
    }

    return 0, false;
}

create_buffer :: proc(vkc: ^VulkanContext, size: vk.DeviceSize, usage: vk.BufferUsageFlagBits, properties: vk.MemoryPropertyFlagBits, buffer: ^vk.Buffer, bufferMemory: ^vk.DeviceMemory) -> bool {
    bufferInfo := vk.BufferCreateInfo {
        sType = vk.StructureType.BufferCreateInfo,
        size = u64(size),
        usage = u32(usage),
        sharingMode = vk.SharingMode.Exclusive,
    };

    if (vk.create_buffer(vkc.device, &bufferInfo, nil, buffer) != vk.Result.Success) {
        return false;
    }

    memRequirements: vk.MemoryRequirements;
    vk.get_buffer_memory_requirements(vkc.device, buffer^, &memRequirements);

    memoryTypeIndex, ok := find_memory_type(vkc, memRequirements.memoryTypeBits, u32(properties));

    if !ok {
        return false;
    }

    allocInfo := vk.MemoryAllocateInfo{
        sType = vk.StructureType.MemoryAllocateInfo,
        allocationSize = memRequirements.size,
        memoryTypeIndex = memoryTypeIndex,
    };

    if vk.allocate_memory(vkc.device, &allocInfo, nil, bufferMemory) != vk.Result.Success {
        return false;
    }

    vk.bind_buffer_memory(vkc.device, buffer^, bufferMemory^, 0);
    return true;
}

create_index_buffer :: proc(vkc: ^VulkanContext) -> bool {
    bufferSize : vk.DeviceSize = u64(size_of(indices[0]) * len(indices));

    stagingBuffer : vk.Buffer;
    stagingBufferMemory : vk.DeviceMemory;
    create_buffer(vkc, bufferSize, vk.BufferUsageFlagBits.TransferSrc, vk.MemoryPropertyFlagBits.HostVisible | vk.MemoryPropertyFlagBits.HostCoherent, &stagingBuffer, &stagingBufferMemory);

    data : rawptr;
    vk.map_memory(vkc.device, stagingBufferMemory, 0, bufferSize, 0, &data);
    rt.mem_copy_non_overlapping(data, mem.raw_slice_data(indices), int(bufferSize));
    vk.unmap_memory(vkc.device, stagingBufferMemory);

    create_buffer(vkc,bufferSize, vk.BufferUsageFlagBits.TransferDst | vk.BufferUsageFlagBits.IndexBuffer, vk.MemoryPropertyFlagBits.DeviceLocal, &vkc.indexBuffer, &vkc.indexBufferMemory);

    copy_buffer(vkc,stagingBuffer, vkc.indexBuffer, bufferSize);

    vk.destroy_buffer(vkc.device, stagingBuffer, nil);
    vk.free_memory(vkc.device, stagingBufferMemory, nil);

    return true;
}

create_vertex_buffer :: proc(vkc: ^VulkanContext) -> bool {
    bufferSize : vk.DeviceSize = u64(size_of(vertices[0]) * len(vertices));

    stagingBuffer: vk.Buffer;
    stagingBufferMemory: vk.DeviceMemory;
    if !create_buffer(vkc,bufferSize,vk.BufferUsageFlagBits.TransferSrc,vk.MemoryPropertyFlagBits.HostVisible | vk.MemoryPropertyFlagBits.HostCoherent,&stagingBuffer,&stagingBufferMemory) {
        return false;
    }

    data: rawptr;
    vk.map_memory(vkc.device, stagingBufferMemory, 0, bufferSize, 0, &data);
    rt.mem_copy_non_overlapping(data, mem.raw_slice_data(vertices), int(bufferSize));
    vk.unmap_memory(vkc.device, stagingBufferMemory);

    if !create_buffer(vkc,bufferSize,vk.BufferUsageFlagBits.TransferDst | vk.BufferUsageFlagBits.VertexBuffer, vk.MemoryPropertyFlagBits.DeviceLocal,&vkc.vertexBuffer,&vkc.vertexBufferMemory) {
        return false;
    }

    copy_buffer(vkc,stagingBuffer,vkc.vertexBuffer,bufferSize);

    vk.destroy_buffer(vkc.device,stagingBuffer,nil);
    vk.free_memory(vkc.device,stagingBufferMemory,nil);

    return true;
}

copy_buffer :: proc(vkc: ^VulkanContext, srcBuffer: vk.Buffer, dstBuffer: vk.Buffer, size: vk.DeviceSize) {
    allocInfo := vk.CommandBufferAllocateInfo{
        sType = vk.StructureType.CommandBufferAllocateInfo,
        level = vk.CommandBufferLevel.Primary,
        commandPool = vkc.commandPool,
        commandBufferCount = 1,
    };

    commandBuffer: vk.CommandBuffer;
    vk.allocate_command_buffers(vkc.device, &allocInfo, &commandBuffer);

    beginInfo := vk.CommandBufferBeginInfo{
        sType = vk.StructureType.CommandBufferBeginInfo,
        flags = u32(vk.CommandBufferUsageFlagBits.OneTimeSubmit),
    };

    vk.begin_command_buffer(commandBuffer, &beginInfo);

    copyRegion := vk.BufferCopy{
        size = size,
    };
    vk.cmd_copy_buffer(commandBuffer, srcBuffer, dstBuffer, 1, &copyRegion);

    vk.end_command_buffer(commandBuffer);

    submitInfo := vk.SubmitInfo{
        sType = vk.StructureType.SubmitInfo,
        commandBufferCount = 1,
        pCommandBuffers = &commandBuffer,
    };

    vk.queue_submit(vkc.graphicsQueue, 1, &submitInfo, nil);
    vk.queue_wait_idle(vkc.graphicsQueue);

    vk.free_command_buffers(vkc.device, vkc.commandPool, 1, &commandBuffer);
}

create_instance :: proc(vkc : ^VulkanContext) -> bool {
    // @todo Enable validation layers?
    if vkc.enableValidationLayers && !check_validation_layer_support() {
        fmt.println("Could not find validation layer support");
        return false;
    }


    // Application info
    applicationInfo : vk.ApplicationInfo;
    applicationInfo.sType = vk.StructureType.ApplicationInfo;
    applicationInfo.pApplicationName = "vulkan-test";
    applicationInfo.pEngineName = "odin-binding-generator";
    applicationInfo.apiVersion = vk.API_VERSION_1_1;

    // Instance info
    instanceCreateInfo := vk.InstanceCreateInfo{
        sType = vk.StructureType.InstanceCreateInfo,
        pApplicationInfo = &applicationInfo,
        enabledExtensionCount = u32(len(extensions)),
        ppEnabledExtensionNames = mem.raw_slice_data(extensions),
    };

    if vkc.enableValidationLayers {
        instanceCreateInfo.enabledLayerCount = u32(len(validation_layers));
        instanceCreateInfo.ppEnabledLayerNames = mem.raw_slice_data(validation_layers);
    } else {
        instanceCreateInfo.enabledLayerCount = 0;
    }

    result := vk.create_instance(&instanceCreateInfo, nil, &vkc.instance);
    if result == vk.Result.Success {
        fmt.println("Successfully created instance!");
    }
    else {
        fmt.println("Unable to create instance!");
        return false;
    }

    return true;
}

is_device_suitable :: proc(physicalDevice: vk.PhysicalDevice) -> bool {
    deviceProperties : vk.PhysicalDeviceProperties;
    vk.get_physical_device_properties(physicalDevice, &deviceProperties);
    deviceFeatures : vk.PhysicalDeviceFeatures;
    vk.get_physical_device_features(physicalDevice, &deviceFeatures);
    if deviceProperties.deviceType == vk.PhysicalDeviceType.DiscreteGpu && deviceFeatures.geometryShader != 0 && deviceFeatures.samplerAnisotropy != 0 {
        return true;
    }
    if deviceFeatures.geometryShader != 0 && deviceFeatures.samplerAnisotropy != 0 {
        return true;
    }
    return false;
}

pick_physical_device :: proc(vkc: ^VulkanContext) -> bool {
    // Find physical devices
    physicalDevicesCount : u32;
    vk.enumerate_physical_devices(vkc.instance, &physicalDevicesCount, nil);
    if physicalDevicesCount == 0 {
        return false;
    }
    physicalDevices := make([]vk.PhysicalDevice, physicalDevicesCount);
    vk.enumerate_physical_devices(vkc.instance, &physicalDevicesCount, mem.raw_slice_data(physicalDevices));
    fmt.println("Found", physicalDevicesCount, "physical devices.");
    for pd, _ in physicalDevices {
        if is_device_suitable(pd) {
            fmt.println("** picked a physical device");
            vkc.physicalDevice = pd;
            return true;
        }
    }
    return false;
}

find_queue_families :: proc(vkc: ^VulkanContext) -> bool {
    remaining := 2;
    queueFamilyCount : u32;
    vk.get_physical_device_queue_family_properties(vkc.physicalDevice, &queueFamilyCount, nil);
    queueFamilies := make([]vk.QueueFamilyProperties,queueFamilyCount);
    defer delete(queueFamilies);
    vk.get_physical_device_queue_family_properties(vkc.physicalDevice, &queueFamilyCount, mem.raw_slice_data(queueFamilies));

    for qf, i in queueFamilies {
        if qf.queueFlags & u32(vk.QueueFlagBits.Graphics) != 0 {
            vkc.graphicsFamily = u32(i);
            remaining -= 1;
        }

        presentSupport := vk.Bool32(0);
        vk.get_physical_device_surface_support_khr(vkc.physicalDevice, u32(i), vkc.surface, &presentSupport);
        if presentSupport != 0 {
            vkc.presentFamily = u32(i);
            remaining -= 1;
        }

        if remaining == 0 {
            return true;
        }
    }

    return false;
}


create_logical_device :: proc(vkc: ^VulkanContext) -> bool {
    queueCreateInfos: []vk.DeviceQueueCreateInfo;
    uniqueQueueFamilies: []u32;
    if vkc.graphicsFamily ==  vkc.presentFamily {
        uniqueQueueFamilies = []u32{vkc.graphicsFamily};
        queueCreateInfos = []vk.DeviceQueueCreateInfo{---};
    } else {
        uniqueQueueFamilies = []u32{vkc.graphicsFamily, vkc.presentFamily};
        queueCreateInfos = []vk.DeviceQueueCreateInfo{---,---};
    }

    queuePriority : f32 = 1.0;
    for qf, i in uniqueQueueFamilies {
        queueCreateInfo := vk.DeviceQueueCreateInfo{};
        queueCreateInfo.sType = vk.StructureType.DeviceQueueCreateInfo;
        queueCreateInfo.queueFamilyIndex = qf;
        queueCreateInfo.queueCount = 1;
        queueCreateInfo.pQueuePriorities = &queuePriority;
        queueCreateInfos[i] = queueCreateInfo;
    }

    deviceFeatures := vk.PhysicalDeviceFeatures {
        samplerAnisotropy = vk.TRUE,
    };

    createInfo : vk.DeviceCreateInfo;
    createInfo.sType = vk.StructureType.DeviceCreateInfo;
    createInfo.pQueueCreateInfos = mem.raw_slice_data(queueCreateInfos);
    createInfo.queueCreateInfoCount = u32(len(queueCreateInfos));
    createInfo.pEnabledFeatures = &deviceFeatures;
    createInfo.enabledExtensionCount = u32(len(device_extensions));
    createInfo.ppEnabledExtensionNames = mem.raw_slice_data(device_extensions);
    createInfo.enabledLayerCount = 0;

    if vk.create_device(vkc.physicalDevice, &createInfo, nil, &vkc.device) != vk.Result.Success {
        return false;
    }


    vk.get_device_queue(vkc.device, vkc.graphicsFamily, 0, &vkc.graphicsQueue);
    vk.get_device_queue(vkc.device, vkc.presentFamily, 0, &vkc.presentQueue);

    return true;
}


create_surface :: proc(vkc: ^VulkanContext, sdlWindow: ^sdl.Window) -> bool {
    surface: vk.SurfaceKHR;
    createInfo : vk.XlibSurfaceCreateInfoKHR;
    createInfo.sType = vk.StructureType.XlibSurfaceCreateInfoKhr;
    info : sdl.Sys_Wm_Info;
    sdl.get_version(&info.version);
    if sdl.get_window_wm_info(sdlWindow, &info) == sdl.Bool.False {
        fmt.println("Could not get window info.");
        return false;
    }
    fmt.println("WOOT!  Got Window info: ", info);
    createInfo.dpy = info.info.x11.display;
    createInfo.window = info.info.x11.window;
    result := vk.create_xlib_surface_khr(vkc.instance, &createInfo, nil, &surface);
    if result != vk.Result.Success {
        fmt.println("Failed to create surface: ", result);
        return false;
    }
    vkc.surface = surface;
    return true;
}

check_device_extension_support :: proc(vkc: ^VulkanContext) -> bool {
    context.allocator = context.temp_allocator;
    extension_count: u32;
    vk.enumerate_device_extension_properties(vkc.physicalDevice, nil, &extension_count, nil);

    available_extensions := make([]vk.ExtensionProperties,extension_count);
    vk.enumerate_device_extension_properties(vkc.physicalDevice, nil, &extension_count, mem.raw_slice_data(available_extensions));

    expected := make(map[string]bool);
    defer delete(expected);
    for x, _ in device_extensions {
        expected[string(x)] = false;
    }

    for _, i in available_extensions {
        x := available_extensions[i];
        en := string(transmute(cstring)(&x.extensionName));
        delete_key(&expected, en);
    }

    return len(expected) == 0;
}

query_swap_chain_support :: proc(vkc: ^VulkanContext) -> bool {
    fmt.println("get_physical_device_surface_capabilities_khr");
    fmt.printf("vkc.physicalDevice: %v\n", vkc.physicalDevice);
    if vk.get_physical_device_surface_capabilities_khr(vkc.physicalDevice, vkc.surface, &vkc.capabilities) != vk.Result.Success {
        return false;
    }

    formatCount:u32;
    fmt.println("get_physical_device_surface_formats_khr");
    vk.get_physical_device_surface_formats_khr(vkc.physicalDevice, vkc.surface, &formatCount, nil);
    if formatCount == 0 {
        return false;
    }
    vkc.formats = make([]vk.SurfaceFormatKHR,formatCount);
    fmt.println("get_physical_device_surface_formats_khr");
    vk.get_physical_device_surface_formats_khr(vkc.physicalDevice, vkc.surface, &formatCount, mem.raw_slice_data(vkc.formats));

    presentModeCount:u32;
    fmt.println("get_physical_device_surface_present_modes_khr");
    vk.get_physical_device_surface_present_modes_khr(vkc.physicalDevice, vkc.surface, &presentModeCount, nil);
    if presentModeCount == 0 {
        return false;
    }
    vkc.presentModes = make([]vk.PresentModeKHR,presentModeCount);
    fmt.println("get_physical_device_surface_present_modes_khr");
    vk.get_physical_device_surface_present_modes_khr(vkc.physicalDevice, vkc.surface, &presentModeCount, mem.raw_slice_data(vkc.presentModes));
    return true;
}

choose_swap_surface_format :: proc(availableFormats: []vk.SurfaceFormatKHR) -> vk.SurfaceFormatKHR {
    for af, _ in availableFormats {
        if af.format == vk.Format.B8G8R8A8Srgb && af.colorSpace == vk.ColorSpaceKHR.ColorspaceSrgbNonlinear {
            return af;
        }
    }

    return availableFormats[0];
}

choose_swap_present_mode :: proc(availablePresentModes: []vk.PresentModeKHR) -> vk.PresentModeKHR {
    for apm, _ in availablePresentModes {
        if apm == vk.PresentModeKHR.Mailbox {
            return apm;
        }
    }

    return vk.PresentModeKHR.Fifo;
}

choose_swap_extent :: proc(capabilities: ^vk.SurfaceCapabilitiesKHR, window:^sdl.Window, width, height: u32) -> vk.Extent2D {
    // if capabilities.currentExtent.width != bits.U32_MAX {
    //     return capabilities.currentExtent;
    // } else {
        actualExtent := vk.Extent2D{width, height};

        // actualExtent.width = max(capabilities.minImageExtent.width, min(capabilities.maxImageExtent.width, actualExtent.width));
        // actualExtent.height = max(capabilities.minImageExtent.height, min(capabilities.maxImageExtent.height, actualExtent.height));

        return actualExtent;
    // }
}

create_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
    surfaceFormat := choose_swap_surface_format(vkc.formats);
    presentMode := choose_swap_present_mode(vkc.presentModes);
    extent := choose_swap_extent(&vkc.capabilities,vkc.window, vkc.width, vkc.height);

    fmt.println("extent: ",extent);

    imageCount := vkc.capabilities.minImageCount + 1;
    if vkc.capabilities.maxImageCount > 0 && imageCount > vkc.capabilities.maxImageCount {
        imageCount = vkc.capabilities.maxImageCount;
    }

    createInfo := vk.SwapchainCreateInfoKHR{};
    createInfo.sType = vk.StructureType.SwapchainCreateInfoKhr;
    createInfo.surface = vkc.surface;

    createInfo.minImageCount = imageCount;
    createInfo.imageFormat = surfaceFormat.format;
    createInfo.imageColorSpace = surfaceFormat.colorSpace;
    createInfo.imageExtent = extent;
    createInfo.imageArrayLayers = 1;
    createInfo.imageUsage = u32(vk.ImageUsageFlagBits.ColorAttachment);

    ok := find_queue_families(vkc);
    if !ok {
        return false;
    }
    queueFamilyIndices := []u32{vkc.graphicsFamily, vkc.presentFamily};

    if vkc.graphicsFamily != vkc.presentFamily {
        createInfo.imageSharingMode = vk.SharingMode.Concurrent;
        createInfo.queueFamilyIndexCount = 2;
        createInfo.pQueueFamilyIndices = mem.raw_slice_data(queueFamilyIndices);
    } else {
        createInfo.imageSharingMode = vk.SharingMode.Exclusive;
    }

    createInfo.preTransform = vkc.capabilities.currentTransform;
    createInfo.compositeAlpha = vk.CompositeAlphaFlagBitsKHR.Opaque;
    createInfo.presentMode = presentMode;
    createInfo.clipped = vk.TRUE;

    createInfo.oldSwapchain = nil;

    if vk.create_swapchain_khr(vkc.device, &createInfo, nil, &vkc.swapChain) != vk.Result.Success {
        return false;
    }

    vk.get_swapchain_images_khr(vkc.device, vkc.swapChain, &imageCount, nil);
    vkc.swapChainImages = make([]vk.Image,imageCount);
    vk.get_swapchain_images_khr(vkc.device, vkc.swapChain, &imageCount, mem.raw_slice_data(vkc.swapChainImages));

    vkc.swapChainImageFormat = surfaceFormat.format;
    vkc.swapChainExtent = extent;

    return true;
}

create_graphics_pipeline :: proc(vkc: ^VulkanContext) -> bool {
    vertShaderCode, ok := read_file("shaders/vert.spv");
    if !ok {
        return false;
    }
    defer delete(vertShaderCode);
    fragShaderCode: []byte;
    fragShaderCode, ok = read_file("shaders/frag.spv");
    defer delete(fragShaderCode);
    if !ok {
        return false;
    }

    vertShaderModule: vk.ShaderModule;
    vertShaderModule, ok = create_shader_module(vkc, vertShaderCode);
    if !ok {
        return false;
    }
    defer vk.destroy_shader_module(vkc.device, vertShaderModule, nil);
    fragShaderModule: vk.ShaderModule;
    fragShaderModule, ok = create_shader_module(vkc, fragShaderCode);
    if !ok {
        return false;
    }
    defer vk.destroy_shader_module(vkc.device, fragShaderModule, nil);

    vertShaderStageInfo := vk.PipelineShaderStageCreateInfo{
        sType = vk.StructureType.PipelineShaderStageCreateInfo,
        stage = vk.ShaderStageFlagBits.Vertex,
        module = vertShaderModule,
        pName = "main",
    };

    fragShaderStageInfo := vk.PipelineShaderStageCreateInfo{
        sType = vk.StructureType.PipelineShaderStageCreateInfo,
        stage = vk.ShaderStageFlagBits.Fragment,
        module = fragShaderModule,
        pName = "main",
    };

    shaderStages := []vk.PipelineShaderStageCreateInfo{vertShaderStageInfo, fragShaderStageInfo};

    bindingDescription := get_binding_description();
    attributeDescriptions := get_attribute_descriptions();


    vertexInputInfo := vk.PipelineVertexInputStateCreateInfo{
        sType = vk.StructureType.PipelineVertexInputStateCreateInfo,
        vertexBindingDescriptionCount = 1,
        vertexAttributeDescriptionCount = u32(len(attributeDescriptions)),
        pVertexBindingDescriptions = &bindingDescription,
        pVertexAttributeDescriptions = mem.raw_slice_data(attributeDescriptions),
    };

    inputAssembly := vk.PipelineInputAssemblyStateCreateInfo{
        sType = vk.StructureType.PipelineInputAssemblyStateCreateInfo,
        topology = vk.PrimitiveTopology.TriangleList,
        primitiveRestartEnable = vk.FALSE,
    };

    viewport := vk.Viewport{
        x = 0.0,
        y = 0.0,
        width = f32(vkc.swapChainExtent.width),
        height = f32(vkc.swapChainExtent.height),
        minDepth = 0.0,
        maxDepth = 1.0,
    };

    scissor := vk.Rect2D{};
    scissor.offset = {0, 0};
    scissor.extent = vkc.swapChainExtent;

    viewportState := vk.PipelineViewportStateCreateInfo{};
    viewportState.sType = vk.StructureType.PipelineViewportStateCreateInfo;
    viewportState.viewportCount = 1;
    viewportState.pViewports = &viewport;
    viewportState.scissorCount = 1;
    viewportState.pScissors = &scissor;

    rasterizer := vk.PipelineRasterizationStateCreateInfo{};
    rasterizer.sType = vk.StructureType.PipelineRasterizationStateCreateInfo;
    rasterizer.depthClampEnable = vk.FALSE;
    rasterizer.rasterizerDiscardEnable = vk.FALSE;
    rasterizer.polygonMode = vk.PolygonMode.Fill;
    rasterizer.lineWidth = 1.0;
    rasterizer.cullMode = u32(vk.CullModeFlagBits.Back);
    rasterizer.frontFace = vk.FrontFace.CounterClockwise;
    rasterizer.depthBiasEnable = vk.FALSE;

    multisampling := vk.PipelineMultisampleStateCreateInfo{};
    multisampling.sType = vk.StructureType.PipelineMultisampleStateCreateInfo;
    multisampling.sampleShadingEnable = vk.FALSE;
    multisampling.rasterizationSamples = vk.SampleCountFlagBits._1;

    colorBlendAttachment := vk.PipelineColorBlendAttachmentState{};
    colorBlendAttachment.colorWriteMask = u32(vk.ColorComponentFlagBits.R | vk.ColorComponentFlagBits.G | vk.ColorComponentFlagBits.B | vk.ColorComponentFlagBits.A);
    colorBlendAttachment.blendEnable = vk.FALSE;

    colorBlending := vk.PipelineColorBlendStateCreateInfo{};
    colorBlending.sType = vk.StructureType.PipelineColorBlendStateCreateInfo;
    colorBlending.logicOpEnable = vk.FALSE;
    colorBlending.logicOp = vk.LogicOp.Copy;
    colorBlending.attachmentCount = 1;
    colorBlending.pAttachments = &colorBlendAttachment;
    colorBlending.blendConstants[0] = 0.0;
    colorBlending.blendConstants[1] = 0.0;
    colorBlending.blendConstants[2] = 0.0;
    colorBlending.blendConstants[3] = 0.0;

    pipelineLayoutInfo := vk.PipelineLayoutCreateInfo{
        sType = vk.StructureType.PipelineLayoutCreateInfo,
        setLayoutCount = 1,
        pSetLayouts = &vkc.descriptorSetLayout,
    };

    if (vk.create_pipeline_layout(vkc.device, &pipelineLayoutInfo, nil, &vkc.pipelineLayout) != vk.Result.Success) {
        return false;
    }

    pipelineInfo := vk.GraphicsPipelineCreateInfo{};
    pipelineInfo.sType = vk.StructureType.GraphicsPipelineCreateInfo;
    pipelineInfo.stageCount = 2;
    pipelineInfo.pStages = mem.raw_slice_data(shaderStages);
    pipelineInfo.pVertexInputState = &vertexInputInfo;
    pipelineInfo.pInputAssemblyState = &inputAssembly;
    pipelineInfo.pViewportState = &viewportState;
    pipelineInfo.pRasterizationState = &rasterizer;
    pipelineInfo.pMultisampleState = &multisampling;
    pipelineInfo.pColorBlendState = &colorBlending;
    pipelineInfo.layout = vkc.pipelineLayout;
    pipelineInfo.renderPass = vkc.renderPass;
    pipelineInfo.subpass = 0;
    pipelineInfo.basePipelineHandle = nil;

    if vk.create_graphics_pipelines(vkc.device, nil, 1, &pipelineInfo, nil, &vkc.graphicsPipeline) != vk.Result.Success {
        return false;
    }

    return true;
}

cleanup :: proc(vkc: ^VulkanContext) {
    cleanup_swap_chain(vkc);

    vk.destroy_sampler(vkc.device, vkc.textureSampler, nil);
    vk.destroy_image_view(vkc.device, vkc.textureImageView, nil);
    vk.destroy_image(vkc.device, vkc.textureImage, nil);
    vk.free_memory(vkc.device, vkc.textureImageMemory, nil);

    vk.destroy_descriptor_set_layout(vkc.device, vkc.descriptorSetLayout, nil);
    vk.destroy_buffer(vkc.device,vkc.indexBuffer,nil);
    vk.free_memory(vkc.device, vkc.indexBufferMemory, nil);
    vk.destroy_buffer(vkc.device,vkc.vertexBuffer,nil);
    vk.free_memory(vkc.device, vkc.vertexBufferMemory, nil);

    for i := 0; i < max_frames_in_flight; i += 1 {
        vk.destroy_semaphore(vkc.device, vkc.renderFinishedSemaphores[i], nil);
        vk.destroy_semaphore(vkc.device, vkc.imageAvailableSemaphores[i], nil);
        vk.destroy_fence(vkc.device, vkc.inFlightFences[i], nil);
    }

    vk.destroy_command_pool(vkc.device, vkc.commandPool, nil);

    vk.destroy_device(vkc.device, nil);

    vk.destroy_surface_khr(vkc.instance, vkc.surface, nil);
    vk.destroy_instance(vkc.instance, nil);
}

create_render_pass :: proc(vkc: ^VulkanContext) -> bool {
    colorAttachment := vk.AttachmentDescription{
        format = vkc.swapChainImageFormat,
        samples = vk.SampleCountFlagBits._1,
        loadOp = vk.AttachmentLoadOp.Clear,
        storeOp = vk.AttachmentStoreOp.Store,
        stencilLoadOp = vk.AttachmentLoadOp.DontCare,
        stencilStoreOp = vk.AttachmentStoreOp.DontCare,
        initialLayout = vk.ImageLayout.Undefined,
        finalLayout = vk.ImageLayout.PresentSrcKhr,
    };

    colorAttachmentRef := vk.AttachmentReference{};
    colorAttachmentRef.attachment = 0;
    colorAttachmentRef.layout = vk.ImageLayout.ColorAttachmentOptimal;

    subpass := vk.SubpassDescription{};
    subpass.pipelineBindPoint = vk.PipelineBindPoint.Graphics;
    subpass.colorAttachmentCount = 1;
    subpass.pColorAttachments = &colorAttachmentRef;

    renderPassInfo := vk.RenderPassCreateInfo{};
    renderPassInfo.sType = vk.StructureType.RenderPassCreateInfo;
    renderPassInfo.attachmentCount = 1;
    renderPassInfo.pAttachments = &colorAttachment;
    renderPassInfo.subpassCount = 1;
    renderPassInfo.pSubpasses = &subpass;

    if (vk.create_render_pass(vkc.device, &renderPassInfo, nil, &vkc.renderPass) != vk.Result.Success) {
        return false;
    }
    return true;
}

create_shader_module :: proc(vkc: ^VulkanContext, code: []byte) -> (vk.ShaderModule, bool) {
    createInfo := vk.ShaderModuleCreateInfo{};
    createInfo.sType = vk.StructureType.ShaderModuleCreateInfo;
    createInfo.codeSize = uint(len(code));
    createInfo.pCode = transmute(^u32)mem.raw_slice_data(code);

    shaderModule: vk.ShaderModule;
    if vk.create_shader_module(vkc.device, &createInfo, nil, &shaderModule) != vk.Result.Success {
        return nil, false;
    }

    return shaderModule, true;
}

create_framebuffers :: proc(vkc: ^VulkanContext) -> bool {
    vkc.swapChainFramebuffers = make([]vk.Framebuffer, len(vkc.swapChainImageViews));

    for sciv, i in vkc.swapChainImageViews {
        attachments := []vk.ImageView{sciv};

        framebufferInfo := vk.FramebufferCreateInfo{};
        framebufferInfo.sType = vk.StructureType.FramebufferCreateInfo;
        framebufferInfo.renderPass = vkc.renderPass;
        framebufferInfo.attachmentCount = 1;
        framebufferInfo.pAttachments = mem.raw_slice_data(attachments);
        framebufferInfo.width = vkc.swapChainExtent.width;
        framebufferInfo.height = vkc.swapChainExtent.height;
        framebufferInfo.layers = 1;

        if vk.create_framebuffer(vkc.device, &framebufferInfo, nil, &vkc.swapChainFramebuffers[i]) != vk.Result.Success {
            return false;
        }
    }
    return true;
}

read_file :: proc(filename: string) -> ([]byte, bool) {
        fd, errno := os.open(filename);
        if errno != 0 {
            fmt.println("Failed to read:", filename, " error:", errno);
            return nil, false;
        }
        defer os.close(fd);
        size: i64;
        size, errno = os.file_size(fd);
        if errno != 0 {
            fmt.println("Failed to get file size:", filename, " error:", errno);
            return nil, false;
        }
        result := make([]byte,size);
        _, errno = os.read(fd,result);
        if errno != 0 {
            delete(result);
            fmt.println("Failed to read file:", filename, " error:", errno);
            return nil, false;
        }

        return result, true;
    }


create_image_views :: proc(vkc: ^VulkanContext) -> bool {
    vkc.swapChainImageViews = make([]vk.ImageView,len(vkc.swapChainImages));
    for _, i in vkc.swapChainImageViews {
        view, result := create_image_view(vkc, vkc.swapChainImages[i], vkc.swapChainImageFormat);
        if !result {
            return false;
        }
        vkc.swapChainImageViews[i] = view;
    }
    return true;
}

create_command_pool :: proc(vkc: ^VulkanContext) -> bool {
    poolInfo := vk.CommandPoolCreateInfo{};
    poolInfo.sType = vk.StructureType.CommandPoolCreateInfo;
    poolInfo.queueFamilyIndex = vkc.graphicsFamily;

    if vk.create_command_pool(vkc.device, &poolInfo, nil, &vkc.commandPool) != vk.Result.Success {
        return false;
    }
    return true;
}

create_command_buffers :: proc(vkc: ^VulkanContext) -> bool {
    vkc.commandBuffers = make([]vk.CommandBuffer,len(vkc.swapChainFramebuffers));

    allocInfo := vk.CommandBufferAllocateInfo{
        sType = vk.StructureType.CommandBufferAllocateInfo,
        commandPool = vkc.commandPool,
        level = vk.CommandBufferLevel.Primary,
        commandBufferCount = u32(len(vkc.commandBuffers)),
    };

    if vk.allocate_command_buffers(vkc.device, &allocInfo, mem.raw_slice_data(vkc.commandBuffers)) != vk.Result.Success {
        return false;
    }

    for cb, i in vkc.commandBuffers {
        beginInfo := vk.CommandBufferBeginInfo{sType = vk.StructureType.CommandBufferBeginInfo};

        if vk.begin_command_buffer(cb, &beginInfo) != vk.Result.Success {
            return false;
        }

        renderPassInfo := vk.RenderPassBeginInfo{
            sType = vk.StructureType.RenderPassBeginInfo,
            renderPass = vkc.renderPass,
            framebuffer = vkc.swapChainFramebuffers[i],
            renderArea = {
                offset = {0, 0},
                extent = vkc.swapChainExtent,
            },
        };

        clearColor := vk.ClearValue{};
        clearColor.color.float32 = {0.0, 0.0, 0.0, 1.0};

        renderPassInfo.clearValueCount = 1;
        renderPassInfo.pClearValues = &clearColor;

        vk.cmd_begin_render_pass(cb, &renderPassInfo, vk.SubpassContents.Inline);

        vk.cmd_bind_pipeline(cb, vk.PipelineBindPoint.Graphics, vkc.graphicsPipeline);

        vertexBuffers := []vk.Buffer{vkc.vertexBuffer};
        offsets := []vk.DeviceSize{0};
        vk.cmd_bind_vertex_buffers(vkc.commandBuffers[i], 0, 1, mem.raw_slice_data(vertexBuffers), mem.raw_slice_data(offsets));
        vk.cmd_bind_index_buffer(vkc.commandBuffers[i],vkc.indexBuffer,0,vk.IndexType.Uint16);
        vk.cmd_bind_descriptor_sets(vkc.commandBuffers[i], vk.PipelineBindPoint.Graphics, vkc.pipelineLayout, 0, 1, &vkc.descriptorSets[i], 0, nil);
        vk.cmd_draw_indexed(vkc.commandBuffers[i], u32(len(indices)), 1, 0, 0, 0);

        // vk.cmd_draw(cb, 3, 1, 0, 0);

        vk.cmd_end_render_pass(cb);

        if vk.end_command_buffer(cb) != vk.Result.Success {
            return false;
        }
    }
    return true;
}

create_descriptor_layout :: proc(vkc: ^VulkanContext) -> bool {
    uboLayoutBinding := vk.DescriptorSetLayoutBinding{
        binding = 0,
        descriptorCount = 1,
        descriptorType = vk.DescriptorType.UniformBuffer,
        pImmutableSamplers = nil,
        stageFlags = u32(vk.ShaderStageFlagBits.Vertex),
    };

    samplerLayoutBinding := vk.DescriptorSetLayoutBinding {
        binding = 1,
        descriptorCount = 1,
        descriptorType = vk.DescriptorType.CombinedImageSampler,
        pImmutableSamplers = nil,
        stageFlags = u32(vk.ShaderStageFlagBits.Fragment),
    };

    bindings := []vk.DescriptorSetLayoutBinding{uboLayoutBinding, samplerLayoutBinding};
    layoutInfo := vk.DescriptorSetLayoutCreateInfo {
        sType = vk.StructureType.DescriptorSetLayoutCreateInfo,
        bindingCount = u32(len(bindings)),
        pBindings = mem.raw_slice_data(bindings),
    };

    if vk.create_descriptor_set_layout(vkc.device, &layoutInfo, nil, &vkc.descriptorSetLayout) != vk.Result.Success {
        return false;
    }

    return true;
}

create_uniform_buffers :: proc(vkc: ^VulkanContext) -> bool {
    bufferSize := vk.DeviceSize(size_of(UniformBufferObject));

    vkc.uniformBuffers = make([]vk.Buffer,len(vkc.swapChainImages));
    vkc.uniformBuffersMemory = make([]vk.DeviceMemory,len(vkc.swapChainImages));

    for _, i in vkc.swapChainImages {
        create_buffer(vkc, bufferSize, vk.BufferUsageFlagBits.UniformBuffer, vk.MemoryPropertyFlagBits.HostVisible | vk.MemoryPropertyFlagBits.HostCoherent, &vkc.uniformBuffers[i], &vkc.uniformBuffersMemory[i]);
    }
    return true;
}


create_descriptor_pool :: proc(vkc: ^VulkanContext) -> bool {
    poolSize := []vk.DescriptorPoolSize {
        {
            type = vk.DescriptorType.UniformBuffer,
            descriptorCount = u32(len(vkc.swapChainImages)),
        },
        {
            type = vk.DescriptorType.CombinedImageSampler,
            descriptorCount = u32(len(vkc.swapChainImages)),
        },
    };

    poolInfo := vk.DescriptorPoolCreateInfo {
        sType = vk.StructureType.DescriptorPoolCreateInfo,
        poolSizeCount = u32(len(poolSize)),
        pPoolSizes = mem.raw_slice_data(poolSize),
        maxSets = u32(len(vkc.swapChainImages)),
    };

    if vk.create_descriptor_pool(vkc.device, &poolInfo, nil, &vkc.descriptorPool) != vk.Result.Success {
        return false;
    }

    return true;
}

create_descriptor_sets :: proc(vkc: ^VulkanContext) -> bool {
    layouts := make([]vk.DescriptorSetLayout,len(vkc.swapChainImages));
    for _, i in layouts {
        layouts[i] = vkc.descriptorSetLayout;
    }
    allocInfo := vk.DescriptorSetAllocateInfo{
        sType = vk.StructureType.DescriptorSetAllocateInfo,
        descriptorPool = vkc.descriptorPool,
        descriptorSetCount = u32(len(vkc.swapChainImages)),
        pSetLayouts = mem.raw_slice_data(layouts),
    };

    vkc.descriptorSets = make([]vk.DescriptorSet,len(vkc.swapChainImages));

    if vk.allocate_descriptor_sets(vkc.device,&allocInfo,mem.raw_slice_data(vkc.descriptorSets)) != vk.Result.Success {
        return false;
    }

    for _, i in vkc.swapChainImages {
        bufferInfo := vk.DescriptorBufferInfo{
            buffer = vkc.uniformBuffers[i],
            offset = 0,
            range = size_of(UniformBufferObject),
        };

        imageInfo := vk.DescriptorImageInfo {
            imageLayout = vk.ImageLayout.ShaderReadOnlyOptimal,
            imageView = vkc.textureImageView,
            sampler = vkc.textureSampler,
        };

        descriptorWrite := []vk.WriteDescriptorSet {
            {
                sType = vk.StructureType.WriteDescriptorSet,
                dstSet = vkc.descriptorSets[i],
                dstBinding = 0,
                dstArrayElement = 0,
                descriptorType = vk.DescriptorType.UniformBuffer,
                descriptorCount = 1,
                pBufferInfo = &bufferInfo,
            },
            {
                sType = vk.StructureType.WriteDescriptorSet,
                dstSet = vkc.descriptorSets[i],
                dstBinding = 1,
                dstArrayElement = 0,
                descriptorType = vk.DescriptorType.CombinedImageSampler,
                descriptorCount = 1,
                pImageInfo = &imageInfo,
            },
        };
        vk.update_descriptor_sets(vkc.device, u32(len(descriptorWrite)), mem.raw_slice_data(descriptorWrite), 0, nil);
    }

    return true;
}

sdl_pixeltype_packed32 :: 6;
sdl_packedorder_rgba :: 4;
sdl_packedlayout_8888 :: 6;

// SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA,
//                                SDL_PACKEDLAYOUT_8888, 32, 4),

sdl_define_pixelformat :: proc(type, order , layout, bits, bytes: u32) -> u32 {
    return ((1 << 28) | ((type) << 24) | ((order) << 20) | ((layout) << 16) | ((bits) << 8) | ((bytes) << 0));
}

sdl_pixelformat_rgba8888 := sdl_define_pixelformat(sdl_pixeltype_packed32, sdl_packedorder_rgba, sdl_packedlayout_8888, 32, 4);

create_image_view :: proc(vkc: ^VulkanContext, image: vk.Image, format: vk.Format) -> (vk.ImageView, bool) {
 viewInfo := vk.ImageViewCreateInfo {
        sType = vk.StructureType.ImageViewCreateInfo,
        image = image,
        viewType = vk.ImageViewType._2D,
        format = format,
        subresourceRange = {
            aspectMask = u32(vk.ImageAspectFlagBits.Color),
            baseMipLevel = 0,
            levelCount = 1,
            baseArrayLayer = 0,
            layerCount = 1,
        },
    };


    imageView: vk.ImageView;
    if vk.create_image_view(vkc.device, &viewInfo, nil, &imageView) == vk.Result.Success {
        return imageView, true;
    }

    return nil, false;
}

create_texture_sampler :: proc(vkc: ^VulkanContext) -> bool {
        properties: vk.PhysicalDeviceProperties;
        vk.get_physical_device_properties(vkc.physicalDevice, &properties);

        samplerInfo := vk.SamplerCreateInfo{
            sType = vk.StructureType.SamplerCreateInfo,
            magFilter = vk.Filter.Linear,
            minFilter = vk.Filter.Linear,
            addressModeU = vk.SamplerAddressMode.Repeat,
            addressModeV = vk.SamplerAddressMode.Repeat,
            addressModeW = vk.SamplerAddressMode.Repeat,
            anisotropyEnable = vk.TRUE,
            maxAnisotropy = properties.limits.maxSamplerAnisotropy,
            borderColor = vk.BorderColor.IntOpaqueBlack,
            unnormalizedCoordinates = vk.FALSE,
            compareEnable = vk.FALSE,
            compareOp = vk.CompareOp.Always,
            mipmapMode = vk.SamplerMipmapMode.Linear,
            mipLodBias = 0.0,
            minLod = 0.0,
            maxLod = 0.0,
        };

        if vk.create_sampler(vkc.device, &samplerInfo, nil, &vkc.textureSampler) != vk.Result.Success {
            fmt.println("failed to create texture sampler!");
            return false;
        }
        return true;
}

create_texture_image_view :: proc(vkc: ^VulkanContext) -> bool {
    textureImageView, result := create_image_view(vkc, vkc.textureImage, vk.Format.R8G8B8A8Srgb);
    vkc.textureImageView = textureImageView;
    return result;
}

render_image :: proc(surface: ^sdl.Surface) {
    window := sdl.create_window("SDL2 Displaying Image",
        i32(sdl.Window_Pos.Undefined), i32(sdl.Window_Pos.Undefined), surface.w, surface.h, sdl.Window_Flags(0));
    defer sdl.destroy_window(window);

    renderer := sdl.create_renderer(window, -1, sdl.Renderer_Flags(0));
    defer sdl.destroy_renderer(renderer);

    texture := sdl.create_texture_from_surface(renderer, surface);
    defer sdl.destroy_texture(texture);

    sdl.render_copy(renderer, texture, nil, nil);
    sdl.render_present(renderer);

    event: sdl.Event;
    stop:
    for {
        for sdl.wait_event(&event) != 0 {
            #partial switch event.type {
            case sdl.Event_Type.Quit:
                break stop;
            case sdl.Event_Type.Window_Event:
                #partial switch event.window.event {
                    case sdl.Window_Event_ID.Close:
                        break stop;
                    case:
                }
            }
        }
    }
}

create_texture_image :: proc(vkc: ^VulkanContext) -> bool {
    origImageSurface := img.load("textures/texture.jpg");
    if origImageSurface == nil {
        fmt.println("Error loading texture image");
        return false;
    }
    defer sdl.free_surface(origImageSurface);
    texWidth := origImageSurface.w;
    texHeight := origImageSurface.h;
    targetSurface := sdl.create_rgb_surface_with_format(0, origImageSurface.w, origImageSurface.h, 32, sdl_pixelformat_rgba8888);
    defer sdl.free_surface(targetSurface);
    rect := sdl.Rect {
        x = 0,
        y = 0,
        w = origImageSurface.w,
        h = origImageSurface.h,
    };
    err := sdl.upper_blit(origImageSurface,&rect,targetSurface,&rect);
    if err != 0 {
        fmt.printf("Error blitting texture image to target surface: %d\n", err);
        return false;
    }
    // render_image(targetSurface);
    imageSize : vk.DeviceSize = u64(texWidth * texHeight * 4);
    stagingBuffer : vk.Buffer;
    stagingBufferMemory : vk.DeviceMemory;

    if !create_buffer(vkc, imageSize, vk.BufferUsageFlagBits.TransferSrc, vk.MemoryPropertyFlagBits.HostVisible | vk.MemoryPropertyFlagBits.HostCoherent, &stagingBuffer, &stagingBufferMemory) {
        return false;
    }
    defer vk.destroy_buffer(vkc.device, stagingBuffer, nil);
    defer vk.free_memory(vkc.device, stagingBufferMemory, nil);

    data: rawptr;
    vk.map_memory(vkc.device, stagingBufferMemory, 0, imageSize, 0, &data);
    sdl.lock_surface(targetSurface);
    rt.mem_copy_non_overlapping(data, targetSurface.pixels, int(imageSize));
    sdl.unlock_surface(targetSurface);
    vk.unmap_memory(vkc.device, stagingBufferMemory);

    if !create_image(vkc, u32(texWidth), u32(texHeight), vk.Format.R8G8B8A8Srgb,vk.ImageTiling.Optimal, vk.ImageUsageFlagBits.TransferDst | vk.ImageUsageFlagBits.Sampled, vk.MemoryPropertyFlagBits.DeviceLocal, &vkc.textureImage, &vkc.textureImageMemory) {
        fmt.println("Error: could not create image");
        return false;
    }

    if !transition_image_layout(vkc, vkc.textureImage, vk.Format.R8G8B8A8Srgb, vk.ImageLayout.Undefined, vk.ImageLayout.TransferDstOptimal) {
        return false;
    }
    copy_buffer_to_image(vkc, stagingBuffer, vkc.textureImage, u32(texWidth), u32(texHeight));
    if !transition_image_layout(vkc, vkc.textureImage, vk.Format.R8G8B8A8Srgb, vk.ImageLayout.TransferDstOptimal, vk.ImageLayout.ShaderReadOnlyOptimal) {
        return false;
    }

    return true;
}

copy_buffer_to_image :: proc(vkc: ^VulkanContext, buffer: vk.Buffer, image: vk.Image, width, height: u32) {
    commandBuffer := begin_single_time_commands(vkc);

    region := vk.BufferImageCopy{
        bufferOffset = 0,
        bufferRowLength = 0,
        bufferImageHeight = 0,
        imageSubresource = {
            aspectMask =u32(vk.ImageAspectFlagBits.Color),
            mipLevel = 0,
            baseArrayLayer = 0,
            layerCount = 1,
        },
        imageOffset = {0, 0, 0},
        imageExtent = {width, height, 1},
    };

    vk.cmd_copy_buffer_to_image(commandBuffer, buffer, image, vk.ImageLayout.TransferDstOptimal, 1, &region);

    end_single_time_commands(vkc, &commandBuffer);
}

begin_single_time_commands :: proc(vkc: ^VulkanContext) -> vk.CommandBuffer {
    allocInfo := vk.CommandBufferAllocateInfo{
        sType = vk.StructureType.CommandBufferAllocateInfo,
        level = vk.CommandBufferLevel.Primary,
        commandPool = vkc.commandPool,
        commandBufferCount = 1,
    };

    commandBuffer := vk.CommandBuffer{};
    vk.allocate_command_buffers(vkc.device, &allocInfo, &commandBuffer);

    beginInfo := vk.CommandBufferBeginInfo{
        sType = vk.StructureType.CommandBufferBeginInfo,
        flags = u32(vk.CommandBufferUsageFlagBits.OneTimeSubmit),
    };

    vk.begin_command_buffer(commandBuffer, &beginInfo);

    return commandBuffer;
}

end_single_time_commands :: proc(vkc: ^VulkanContext, commandBuffer: ^vk.CommandBuffer) {
    vk.end_command_buffer(commandBuffer^);

    submitInfo := vk.SubmitInfo{
        sType = vk.StructureType.SubmitInfo,
        commandBufferCount = 1,
        pCommandBuffers = commandBuffer,
    };

    vk.queue_submit(vkc.graphicsQueue, 1, &submitInfo, nil);
    vk.queue_wait_idle(vkc.graphicsQueue);

    vk.free_command_buffers(vkc.device, vkc.commandPool, 1, commandBuffer);
}

transition_image_layout :: proc(vkc: ^VulkanContext, image: vk.Image, format: vk.Format, oldLayout: vk.ImageLayout, newLayout: vk.ImageLayout) -> bool {
    commandBuffer := begin_single_time_commands(vkc);

    ufi : i32 = vk.QUEUE_FAMILY_IGNORED;

    barrier := vk.ImageMemoryBarrier {
        sType = vk.StructureType.ImageMemoryBarrier,
        oldLayout = oldLayout,
        newLayout = newLayout,
        srcQueueFamilyIndex = transmute(u32)(ufi),
        dstQueueFamilyIndex = transmute(u32)(ufi),
        image = image,
        subresourceRange = vk.ImageSubresourceRange{
            aspectMask = u32(vk.ImageAspectFlagBits.Color),
            baseMipLevel = 0,
            levelCount = 1,
            baseArrayLayer = 0,
            layerCount = 1,
        },
    };

    sourceStage: vk.PipelineStageFlags;
    destinationStage: vk.PipelineStageFlags;

    if oldLayout == vk.ImageLayout.Undefined && newLayout == vk.ImageLayout.TransferDstOptimal {
        barrier.srcAccessMask = 0;
        barrier.dstAccessMask = u32(vk.AccessFlagBits.TransferWrite);
        sourceStage = u32(vk.PipelineStageFlagBits.TopOfPipe);
        destinationStage = u32(vk.PipelineStageFlagBits.Transfer);
    } else if oldLayout == vk.ImageLayout.TransferDstOptimal && newLayout == vk.ImageLayout.ShaderReadOnlyOptimal {
        barrier.srcAccessMask = u32(vk.AccessFlagBits.TransferWrite);
        barrier.dstAccessMask = u32(vk.AccessFlagBits.ShaderRead);

        sourceStage = u32(vk.PipelineStageFlagBits.Transfer);
        destinationStage = u32(vk.PipelineStageFlagBits.FragmentShader);
    } else {
        fmt.println("unsupported layout transition!");
        return false;
    }

    vk.cmd_pipeline_barrier(
        commandBuffer,
        sourceStage, destinationStage,
        0,
        0, nil,
        0, nil,
        1, &barrier
    );

    end_single_time_commands(vkc, &commandBuffer);

    return true;
}

create_image :: proc(vkc: ^VulkanContext, width, height: u32, format: vk.Format, tiling: vk.ImageTiling, usage: vk.ImageUsageFlagBits, properties: vk.MemoryPropertyFlagBits, image: ^vk.Image, imageMemory: ^vk.DeviceMemory) -> bool {
   imageInfo := vk.ImageCreateInfo{
        sType = vk.StructureType.ImageCreateInfo,
        imageType = vk.ImageType._2D,
        extent = {
                width = width,
                height = height,
                depth = 1,
            },
        mipLevels = 1,
        arrayLayers = 1,
        format = format,
        tiling = tiling,
        initialLayout = vk.ImageLayout.Undefined,
        usage = u32(usage),
        sharingMode = vk.SharingMode.Exclusive,
        samples = vk.SampleCountFlagBits._1,
        flags = 0,
    };

    if vk.create_image(vkc.device, &imageInfo, nil, image) != vk.Result.Success {
        fmt.println("Failed to create image for the texture map");
        return false;
    }

    memRequirements: vk.MemoryRequirements;
    vk.get_image_memory_requirements(vkc.device,image^,&memRequirements);

    mt, ok := find_memory_type(vkc, memRequirements.memoryTypeBits, u32(properties));
    if !ok {
        fmt.println("Error: failed to find memory");
        return false;
    }

    allocInfo := vk.MemoryAllocateInfo {
        sType = vk.StructureType.MemoryAllocateInfo,
        allocationSize = memRequirements.size,
        memoryTypeIndex = mt,
    };

    if vk.allocate_memory(vkc.device, &allocInfo, nil, imageMemory) != vk.Result.Success {
        fmt.println("Error: failed to allocate memory in device");
        return false;
    }

    vk.bind_image_memory(vkc.device, image^, imageMemory^, 0);

    return true;
}

create_sync_objects :: proc(vkc: ^VulkanContext) -> bool {
    vkc.imageAvailableSemaphores = make([]vk.Semaphore,max_frames_in_flight);
    vkc.renderFinishedSemaphores = make([]vk.Semaphore,max_frames_in_flight);
    vkc.inFlightFences = make([]vk.Fence,max_frames_in_flight);
    vkc.imagesInFlight = make([]vk.Fence,len(vkc.swapChainImages));

    semaphoreInfo := vk.SemaphoreCreateInfo{};
    semaphoreInfo.sType = vk.StructureType.SemaphoreCreateInfo;

    fenceInfo := vk.FenceCreateInfo{};
    fenceInfo.sType = vk.StructureType.FenceCreateInfo;
    fenceInfo.flags = u32(vk.FenceCreateFlagBits.Signaled);


    for i := 0; i < max_frames_in_flight; i += 1 {
        if (vk.create_semaphore(vkc.device, &semaphoreInfo, nil, &vkc.imageAvailableSemaphores[i]) != vk.Result.Success ||
            vk.create_semaphore(vkc.device, &semaphoreInfo, nil, &vkc.renderFinishedSemaphores[i]) != vk.Result.Success ||
            vk.create_fence(vkc.device, &fenceInfo, nil, &vkc.inFlightFences[i]) != vk.Result.Success) {
            return false;
        }
    }
    return true;
}

update_uniform_buffer :: proc(vkc: ^VulkanContext, currentImage: u32) {
    now := time.now();
    diff := time.duration_seconds(time.diff(vkc.startTime,now));

    ubo := UniformBufferObject {
        model = lin.matrix4_rotate(lin.Float(diff)*lin.radians(f32(90)),lin.VECTOR3_Z_AXIS),
        view = lin.matrix4_look_at(lin.Vector3{2,2,2},lin.Vector3{0,0,0},lin.VECTOR3_Z_AXIS),
        proj = lin.matrix4_perspective(lin.radians(f32(45)),lin.Float(vkc.swapChainExtent.width)/lin.Float(vkc.swapChainExtent.height),0.1,10),
    };

    ubo.proj[1][1] *= -1;

    data: rawptr;
    vk.map_memory(vkc.device,vkc.uniformBuffersMemory[currentImage],0,size_of(ubo),0,&data);
    fmt.println("size_of(ubo) = ", size_of(ubo));
    rt.mem_copy_non_overlapping(data,&ubo,size_of(ubo));
    vk.unmap_memory(vkc.device,vkc.uniformBuffersMemory[currentImage]);
}

draw_frame :: proc(vkc: ^VulkanContext, window: ^sdl.Window) -> bool {
    vk.wait_for_fences(vkc.device, 1, &vkc.inFlightFences[vkc.currentFrame], vk.TRUE, bits.U64_MAX);

    imageIndex: u32;
    #partial switch vk.acquire_next_image_khr(vkc.device, vkc.swapChain, bits.U64_MAX, vkc.imageAvailableSemaphores[vkc.currentFrame], nil, &imageIndex) {
        case vk.Result.ErrorOutOfDateKhr:
            return recreate_swap_chain(vkc);
        case vk.Result.Success, vk.Result.SuboptimalKhr:
        // nothing
        case:
            return false;
    }

    fmt.println("about to call update_uniform_buffer");
    update_uniform_buffer(vkc, imageIndex);

    if vkc.imagesInFlight[imageIndex] != nil {
        vk.wait_for_fences(vkc.device, 1, &vkc.imagesInFlight[imageIndex], vk.TRUE, bits.U64_MAX);
    }
    vkc.imagesInFlight[imageIndex] = vkc.inFlightFences[vkc.currentFrame];

    waitSemaphores := []vk.Semaphore{vkc.imageAvailableSemaphores[vkc.currentFrame]};
    waitStages := []vk.PipelineStageFlags{u32(vk.PipelineStageFlagBits.ColorAttachmentOutput)};
    signalSemaphores := []vk.Semaphore{vkc.renderFinishedSemaphores[vkc.currentFrame]};


    submitInfo := vk.SubmitInfo{
        sType = vk.StructureType.SubmitInfo,
        waitSemaphoreCount = 1,
        pWaitSemaphores = mem.raw_slice_data(waitSemaphores),
        pWaitDstStageMask = mem.raw_slice_data(waitStages),
        commandBufferCount = 1,
        pCommandBuffers = &vkc.commandBuffers[imageIndex],
        signalSemaphoreCount = 1,
        pSignalSemaphores = mem.raw_slice_data(signalSemaphores),
    };

    vk.reset_fences(vkc.device, 1, &vkc.inFlightFences[vkc.currentFrame]);

    if (vk.queue_submit(vkc.graphicsQueue, 1, &submitInfo, vkc.inFlightFences[vkc.currentFrame]) != vk.Result.Success) {
        return false;
    }

    swapChains := []vk.SwapchainKHR{vkc.swapChain};
    presentInfo := vk.PresentInfoKHR{
        sType = vk.StructureType.PresentInfoKhr,
        waitSemaphoreCount = 1,
        pWaitSemaphores = mem.raw_slice_data(signalSemaphores),
        swapchainCount = 1,
        pSwapchains = mem.raw_slice_data(swapChains),
        pImageIndices = &imageIndex,
    };

    result := vk.queue_present_khr(vkc.presentQueue, &presentInfo);

    if result == vk.Result.ErrorOutOfDateKhr || result == vk.Result.SuboptimalKhr || vkc.framebufferResized {
        vkc.framebufferResized = false;
        if !recreate_swap_chain(vkc) {
            fmt.println("failed to recreate swap chain");
            return false;
        }
        return true;
    } else if result != vk.Result.Success {
        return false;
    }

    vkc.currentFrame = (vkc.currentFrame + 1) % max_frames_in_flight;
    return true;
}

cleanup_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
    for framebuffer, _ in vkc.swapChainFramebuffers {
        vk.destroy_framebuffer(vkc.device, framebuffer, nil);
    }
    delete(vkc.swapChainFramebuffers);
    vkc.swapChainFramebuffers = nil;

    vk.free_command_buffers(vkc.device, vkc.commandPool, u32(len(vkc.commandBuffers)), mem.raw_slice_data(vkc.commandBuffers));
    delete(vkc.commandBuffers);
    vkc.commandBuffers = nil;

    vk.destroy_pipeline(vkc.device, vkc.graphicsPipeline, nil);
    vk.destroy_pipeline_layout(vkc.device, vkc.pipelineLayout, nil);
    vk.destroy_render_pass(vkc.device, vkc.renderPass, nil);

    for imageView, _ in vkc.swapChainImageViews {
        vk.destroy_image_view(vkc.device, imageView, nil);
    }
    delete(vkc.swapChainImageViews);
    vkc.swapChainImageViews = nil;

    vk.destroy_swapchain_khr(vkc.device, vkc.swapChain, nil);

    for i := 0; i < len(vkc.swapChainImages); i += 1 {
        vk.destroy_buffer(vkc.device, vkc.uniformBuffers[i], nil);
        vk.free_memory(vkc.device, vkc.uniformBuffersMemory[i], nil);
    }
    delete(vkc.uniformBuffers);
    delete(vkc.uniformBuffersMemory);
    vkc.uniformBuffers = nil;
    vkc.uniformBuffersMemory = nil;

    vk.destroy_descriptor_pool(vkc.device, vkc.descriptorPool, nil);

    return true;
}

recreate_swap_chain :: proc(vkc: ^VulkanContext) -> bool {
    fmt.print("recreating the swap chain...");

    if vkc.width == 0 || vkc.height == 0 do return true;

    vk.device_wait_idle(vkc.device);

    if !cleanup_swap_chain(vkc) {
        fmt.println("Failed to clean up swap chain");
        return false;
    }

    if !create_swap_chain(vkc) {
        fmt.println("failed create_swap_chain");
        return false;
    }
    if !create_image_views(vkc) {
        fmt.println("failed create_image_views");
        return false;
    }
    if !create_render_pass(vkc) {
        fmt.println("failed create_render_pass");
        return false;
    }
    if !create_graphics_pipeline(vkc) {
        fmt.println("failed create_graphics_pipeline");
        return false;
    }
    if !create_framebuffers(vkc) {
        fmt.println("failed create_framebuffers");
        return false;
    }
    if !create_uniform_buffers(vkc) {
        fmt.println("failed create_uniform_buffers");
        return false;
    }
    if !create_descriptor_pool(vkc) {
        fmt.println("failed create_descriptor_pool");
        return false;
    }
    if !create_descriptor_sets(vkc) {
        fmt.println("failed create_descriptor_sets");
        return false;
    }
    if !create_command_buffers(vkc) {
        fmt.println("failed create_command_buffers");
        return false;
    }
    fmt.println("done");
    return true;
}

main :: proc() {
    vkc : VulkanContext;
    if sdl.init(sdl.Init_Flags.Everything) < 0 {
        fmt.printf("failed to initialize sdl", sdl.get_error());
        return;
    }
    defer sdl.quit();

    vkc.startTime = time.now();
    create_instance(&vkc);

    fmt.println(" pick_physical_device(&vkc);");
    ok := pick_physical_device(&vkc);
    if !ok {
        fmt.println("No suitable physical devices found.");
        return;
    }

    if !check_device_extension_support(&vkc) {
        fmt.println("Device does not support needed extensions");
        return;
    }

    window := sdl.create_window(
        "hello_sdl2",
        cast(i32)sdl.Window_Pos.Undefined, cast(i32)sdl.Window_Pos.Undefined,
        screen_width, screen_height,
        sdl.Window_Flags.Shown | sdl.Window_Flags.Vulkan | sdl.Window_Flags.Resizable);
    if window == nil {
        fmt.printf("could not create window: {}\n", sdl.get_error());
        return;
    }
    vkc.window = window;
    width, height: i32;
    sdl.get_window_size(vkc.window,&width,&height);
    vkc.width = u32(width);
    vkc.height = u32(height);
    defer sdl.destroy_window(window);

    fmt.println("create_surface(&vkc, window);");
    ok = create_surface(&vkc, window);
    if !ok {
        fmt.println("Could not create Vulkan surface.");
        return;
    }

    fmt.println("find_queue_families(&vkc);");
    ok = find_queue_families(&vkc);
    if !ok {
        fmt.println("Could not retrieve queue families.");
        return;
    }

    fmt.println("create_logical_device(&vkc);");
    ok = create_logical_device(&vkc);
    if !ok {
        fmt.println("Could not create logical device.");
        return;
    }

    fmt.println("query_swap_chain_support(&vkc);");
    ok = query_swap_chain_support(&vkc);
    if !ok {
        fmt.println("Couldn't get swap chain support data.");
        return;
    }

    fmt.println("create_swap_chain(&vkc);");
    ok = create_swap_chain(&vkc);
    if !ok {
        fmt.println("Could not get swap chain");
        return;
    }

    if !create_image_views(&vkc) {
        fmt.println("Could not initialize swap chaing images");
        return;
    }

    if !create_render_pass(&vkc) {
        fmt.println("Could not create render pass");
        return;
    }

    if !create_descriptor_layout(&vkc) {
        fmt.println("Could not create descriptor layout");
        return;
    }

    if !create_graphics_pipeline(&vkc) {
        fmt.println("Could not create graphics pipeline");
        return;
    }

    if !create_framebuffers(&vkc) {
        fmt.println("Could not create frame buffers");
        return;
    }

    if !create_command_pool(&vkc) {
        fmt.println("Could not create command pool");
        return;
    }

    if !create_texture_image(&vkc) {
        fmt.println("Could not create texture image");
        return;
    }

    if !create_texture_image_view(&vkc) {
        fmt.println("Could not create texture image view");
        return;
    }

    if !create_texture_sampler(&vkc) {
        fmt.println("Could not create texture sampler");
        return;
    }

    if !create_vertex_buffer(&vkc) {
        fmt.println("Could not create vertex buffers");
        return;
    }

    if !create_index_buffer(&vkc) {
        fmt.println("Could not create index buffers");
        return;
    }

    if !create_uniform_buffers(&vkc) {
        fmt.println("Could not create uniform buffers");
        return;
    }

    if !create_descriptor_pool(&vkc) {
        fmt.println("Could not create descriptor pool");
        return;
    }

    if !create_descriptor_sets(&vkc) {
        fmt.println("Could not create descriptor sets");
        return;
    }

    if !create_command_buffers(&vkc) {
        fmt.println("Could not create command buffers");
        return;
    }

    if !create_sync_objects(&vkc) {
        fmt.println("Could not create sync objects");
        return;
    }

    defer cleanup(&vkc);

    if !draw_frame(&vkc, window) {
        fmt.println("Could not draw frame");
        return;
    }
    sdl.update_window_surface(window);

    event: sdl.Event;
    stop:
    for {
        for sdl.poll_event(&event) != 0 {
            #partial switch event.type {
            case sdl.Event_Type.Quit:
                break stop;
            case sdl.Event_Type.Window_Event:
                #partial switch event.window.event {
                case sdl.Window_Event_ID.Resized:
                    fmt.println("RESIZED!!");
                    vkc.framebufferResized = true;
                    fmt.printf("new size: %d %d\n",event.window.data1,event.window.data2);
                    vkc.width = u32(event.window.data1);
                    vkc.height = u32(event.window.data2);
                    // sdl.set_window_size(vkc.window,event.window.data1,event.window.data2);
                    if !draw_frame(&vkc, window) {
                        fmt.println("Could not draw frame");
                        return;
                    }
                    sdl.update_window_surface(window);
                case sdl.Window_Event_ID.Exposed:
                    fmt.println("EXPOSED!!");
                    if !draw_frame(&vkc, window) {
                        fmt.println("Could not draw frame");
                        return;
                    }
                    sdl.update_window_surface(window);
                case sdl.Window_Event_ID.Shown:
                    fmt.println("SHOWN!!");
                    if !draw_frame(&vkc, window) {
                        fmt.println("Could not draw frame");
                        return;
                    }
                    sdl.update_window_surface(window);
                }
            case:
                // fmt.printf("event.type: %d\n",event.type);
                // do nothing
            }
            // if !draw_frame(&vkc, window) {
            //     fmt.println("Could not draw frame");
            //     return;
            // }
            // sdl.update_window_surface(window);
        }
        // sdl.update_window_surface(window);
    }


    // file := sdl.rw_from_file("Tree.jpg", "r");
    // if file == nil {
    //     fmt.printf("could not create reference to Tree.jpg: {}\n", sdl.get_error());
    //     return;
    // }
    // defer sdl.free_rw(file);
    // image := img.load_jpg_rw(file);
    // if image == nil {
    //     fmt.printf("could not load image: {}\n", sdl.get_error());
    //     return;
    // }
    // defer sdl.free_surface(image);
    // screenSurface := sdl.get_window_surface(window);
    // sdl.upper_blit_scaled( image, nil, screenSurface, nil);
    // // sdl.fill_rect(screenSurface, nil, sdl.map_rgb(screenSurface.format, 0xFF, 0xFF, 0xFF));
    // sdl.update_window_surface(window);

}
