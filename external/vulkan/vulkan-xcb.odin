package vk

import "shared:x11/xcb"

VULKAN_XCB_H_ :: 1;
KHR_XCB_SURFACE :: 1;
KHR_XCB_SURFACE_SPEC_VERSION :: 6;
KHR_XCB_SURFACE_EXTENSION_NAME :: "VK_KHR_xcb_surface";

XcbSurfaceCreateFlagsKHR :: Flags;
PFN_CreateXcbSurfaceKHR :: #type proc();
PFN_GetPhysicalDeviceXcbPresentationSupportKHR :: #type proc();

XcbSurfaceCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : XcbSurfaceCreateFlagsKHR,
    connection : ^xcb.Connection,
    window : xcb.Window,
};

foreign import vulkan_xcb "system:vulkan"
@(default_calling_convention="c")
foreign vulkan_xcb {

    @(link_name="vkCreateXcbSurfaceKHR")
    create_xcb_surface_khr :: proc(
        instance : Instance,
        pCreateInfo : ^XcbSurfaceCreateInfoKHR,
        pAllocator : ^AllocationCallbacks,
        pSurface : ^SurfaceKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceXcbPresentationSupportKHR")
    get_physical_device_xcb_presentation_support_khr :: proc(
        physicalDevice : PhysicalDevice,
        queueFamilyIndex : u32,
        connection : ^xcb.Connection,
        visual_id : xcb.Visualid
    ) -> Bool32 ---;

}
