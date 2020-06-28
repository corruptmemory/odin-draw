package main

import "core:fmt"
import "core:mem"
import rt "core:runtime"
import "core:math/bits"
import "core:os"
import sdl "shared:sdl2"
// import img "shared:sdl2/image"
import vk "shared:vulkan"
import lin "core:math/linalg"

screen_width :: 640;
screen_height :: 480;
max_frames_in_flight :: 2;

VulkanContext :: struct {
    instance : vk.Instance,
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
    currentFrame: int,
    window: ^sdl.Window,
    framebufferResized: bool,
    width: u32,
    height: u32,
}

Vertex :: struct {
    pos: lin.Vector2,
    color: lin.Vector3,
};

vertices :: []Vertex {
    {{-0.5, -0.5}, {1.0, 0.0, 0.0}},
    {{0.5, -0.5}, {0.0, 1.0, 0.0}},
    {{0.5, 0.5}, {0.0, 0.0, 1.0}},
    {{-0.5, 0.5}, {1.0, 1.0, 1.0}},
};

indices :: []u16 {0,1,2,2,3,0};

extensions :: []cstring {
    vk.KHR_SURFACE_EXTENSION_NAME,
    vk.KHR_XLIB_SURFACE_EXTENSION_NAME,
    vk.KHR_XCB_SURFACE_EXTENSION_NAME,
    vk.KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME,
    vk.KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME,
};

device_extensions :: []cstring {
    vk.KHR_SWAPCHAIN_EXTENSION_NAME,
};

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

create_instance :: proc(vkc : ^VulkanContext) {
    // @todo Enable validation layers?

    // Application info
    applicationInfo : vk.ApplicationInfo;
    applicationInfo.sType = vk.StructureType.ApplicationInfo;
    applicationInfo.pApplicationName = "vulkan-test";
    applicationInfo.pEngineName = "odin-binding-generator";
    applicationInfo.apiVersion = vk.API_VERSION_1_1;

    // Instance info
    instanceCreateInfo : vk.InstanceCreateInfo;
    instanceCreateInfo.sType = vk.StructureType.InstanceCreateInfo;
    instanceCreateInfo.pApplicationInfo = &applicationInfo;
    instanceCreateInfo.enabledExtensionCount = u32(len(extensions));
    instanceCreateInfo.ppEnabledExtensionNames = mem.raw_slice_data(extensions);

    result := vk.create_instance(&instanceCreateInfo, nil, &vkc.instance);
    if result == vk.Result.Success {
        fmt.println("Successfully created instance!");
    }
    else {
        fmt.println("Unable to create instance!");
        return;
    }

}

is_device_suitable :: proc(physicalDevice: vk.PhysicalDevice) -> bool {
    deviceProperties : vk.PhysicalDeviceProperties;
    vk.get_physical_device_properties(physicalDevice, &deviceProperties);
    deviceFeatures : vk.PhysicalDeviceFeatures;
    vk.get_physical_device_features(physicalDevice, &deviceFeatures);
    if deviceProperties.deviceType == vk.PhysicalDeviceType.DiscreteGpu && deviceFeatures.geometryShader != 0 {
        return true;
    }
    // if deviceFeatures.geometryShader != 0 {
    //     return true;
    // }
    return false;
}

pick_physical_device :: proc(vkc: ^VulkanContext) -> bool {
    // Find physical devices
    physicalDevicesCount : u32;
    vk.enumerate_physical_devices(vkc.instance, &physicalDevicesCount, nil);
    physicalDevices := make([]vk.PhysicalDevice, physicalDevicesCount);
    vk.enumerate_physical_devices(vkc.instance, &physicalDevicesCount, mem.raw_slice_data(physicalDevices));
    fmt.println("Found", physicalDevicesCount, "physical devices.");
    for pd, _ in physicalDevices {
        if is_device_suitable(pd) {
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

    deviceFeatures : vk.PhysicalDeviceFeatures;

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
    if vk.get_physical_device_surface_capabilities_khr(vkc.physicalDevice, vkc.surface, &vkc.capabilities) != vk.Result.Success {
        return false;
    }

    formatCount:u32;
    vk.get_physical_device_surface_formats_khr(vkc.physicalDevice, vkc.surface, &formatCount, nil);
    if formatCount == 0 {
        return false;
    }
    vkc.formats = make([]vk.SurfaceFormatKHR,formatCount);
    vk.get_physical_device_surface_formats_khr(vkc.physicalDevice, vkc.surface, &formatCount, mem.raw_slice_data(vkc.formats));

    presentModeCount:u32;
    vk.get_physical_device_surface_present_modes_khr(vkc.physicalDevice, vkc.surface, &presentModeCount, nil);
    if presentModeCount == 0 {
        return false;
    }
    vkc.presentModes = make([]vk.PresentModeKHR,presentModeCount);
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

    vertShaderStageInfo := vk.PipelineShaderStageCreateInfo{};
    vertShaderStageInfo.sType = vk.StructureType.PipelineShaderStageCreateInfo;
    vertShaderStageInfo.stage = vk.ShaderStageFlagBits.Vertex;
    vertShaderStageInfo.module = vertShaderModule;
    vertShaderStageInfo.pName = "main";

    fragShaderStageInfo := vk.PipelineShaderStageCreateInfo{};
    fragShaderStageInfo.sType = vk.StructureType.PipelineShaderStageCreateInfo;
    fragShaderStageInfo.stage = vk.ShaderStageFlagBits.Fragment;
    fragShaderStageInfo.module = fragShaderModule;
    fragShaderStageInfo.pName = "main";

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

    inputAssembly := vk.PipelineInputAssemblyStateCreateInfo{};
    inputAssembly.sType = vk.StructureType.PipelineInputAssemblyStateCreateInfo;
    inputAssembly.topology = vk.PrimitiveTopology.TriangleList;
    inputAssembly.primitiveRestartEnable = vk.FALSE;

    viewport := vk.Viewport{};
    viewport.x = 0.0;
    viewport.y = 0.0;
    viewport.width = f32(vkc.swapChainExtent.width);
    viewport.height = f32(vkc.swapChainExtent.height);
    viewport.minDepth = 0.0;
    viewport.maxDepth = 1.0;

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
    rasterizer.frontFace = vk.FrontFace.Clockwise;
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

    pipelineLayoutInfo := vk.PipelineLayoutCreateInfo{};
    pipelineLayoutInfo.sType = vk.StructureType.PipelineLayoutCreateInfo;
    pipelineLayoutInfo.setLayoutCount = 0;
    pipelineLayoutInfo.pushConstantRangeCount = 0;

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
        createInfo := vk.ImageViewCreateInfo{};
        createInfo.sType = vk.StructureType.ImageViewCreateInfo;
        createInfo.image = vkc.swapChainImages[i];
        createInfo.viewType = vk.ImageViewType._2D;
        createInfo.format = vkc.swapChainImageFormat;
        createInfo.components.r = vk.ComponentSwizzle.Identity;
        createInfo.components.g = vk.ComponentSwizzle.Identity;
        createInfo.components.b = vk.ComponentSwizzle.Identity;
        createInfo.components.a = vk.ComponentSwizzle.Identity;
        createInfo.subresourceRange.aspectMask = u32(vk.ImageAspectFlagBits.Color);
        createInfo.subresourceRange.baseMipLevel = 0;
        createInfo.subresourceRange.levelCount = 1;
        createInfo.subresourceRange.baseArrayLayer = 0;
        createInfo.subresourceRange.layerCount = 1;

        if vk.create_image_view(vkc.device, &createInfo, nil, &vkc.swapChainImageViews[i]) != vk.Result.Success {
            return false;
        }
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
        beginInfo := vk.CommandBufferBeginInfo{};
        beginInfo.sType = vk.StructureType.CommandBufferBeginInfo;

        if vk.begin_command_buffer(cb, &beginInfo) != vk.Result.Success {
            return false;
        }

        renderPassInfo := vk.RenderPassBeginInfo{};
        renderPassInfo.sType = vk.StructureType.RenderPassBeginInfo;
        renderPassInfo.renderPass = vkc.renderPass;
        renderPassInfo.framebuffer = vkc.swapChainFramebuffers[i];
        renderPassInfo.renderArea.offset = {0, 0};
        renderPassInfo.renderArea.extent = vkc.swapChainExtent;

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
        vk.cmd_draw_indexed(vkc.commandBuffers[i], u32(len(indices)), 1, 0, 0, 0);

        // vk.cmd_draw(cb, 3, 1, 0, 0);

        vk.cmd_end_render_pass(cb);

        if vk.end_command_buffer(cb) != vk.Result.Success {
            return false;
        }
    }
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

    vk.free_command_buffers(vkc.device, vkc.commandPool, u32(len(vkc.commandBuffers)), mem.raw_slice_data(vkc.commandBuffers));
    delete(vkc.commandBuffers);

    vk.destroy_pipeline(vkc.device, vkc.graphicsPipeline, nil);
    vk.destroy_pipeline_layout(vkc.device, vkc.pipelineLayout, nil);
    vk.destroy_render_pass(vkc.device, vkc.renderPass, nil);

    for imageView, _ in vkc.swapChainImageViews {
        vk.destroy_image_view(vkc.device, imageView, nil);
    }

    vk.destroy_swapchain_khr(vkc.device, vkc.swapChain, nil);

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

    create_instance(&vkc);

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

    ok = create_surface(&vkc, window);
    if !ok {
        fmt.println("Could not create Vulkan surface.");
        return;
    }

    ok = find_queue_families(&vkc);
    if !ok {
        fmt.println("Could not retrieve queue families.");
        return;
    }

    ok = create_logical_device(&vkc);
    if !ok {
        fmt.println("Could not create logical device.");
        return;
    }

    ok = query_swap_chain_support(&vkc);
    if !ok {
        fmt.println("Couldn't get swap chain support data.");
        return;
    }

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

    if !create_vertex_buffer(&vkc) {
        fmt.println("Could not create vertex buffers");
        return;
    }

    if !create_index_buffer(&vkc) {
        fmt.println("Could not create index buffers");
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
                fmt.printf("event.type: %d\n",event.type);
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
