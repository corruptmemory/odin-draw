package vk

import "shared:x11/xlib"

VULKAN_XLIB_H_ :: 1;
KHR_XLIB_SURFACE :: 1;
KHR_XLIB_SURFACE_SPEC_VERSION :: 6;
KHR_XLIB_SURFACE_EXTENSION_NAME :: "VK_KHR_xlib_surface";

XlibSurfaceCreateFlagsKHR :: Flags;
PFN_CreateXlibSurfaceKHR :: #type proc();
PFN_GetPhysicalDeviceXlibPresentationSupportKHR :: #type proc();

XlibSurfaceCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : XlibSurfaceCreateFlagsKHR,
    dpy : ^xlib.Display,
    window : xlib.Window,
};

foreign import vulkan_xlib "system:vulkan"

@(default_calling_convention="c")
foreign vulkan_xlib {

    @(link_name="vkCreateXlibSurfaceKHR")
    create_xlib_surface_khr :: proc(
        instance : Instance,
        pCreateInfo : ^XlibSurfaceCreateInfoKHR,
        pAllocator : ^AllocationCallbacks,
        pSurface : ^SurfaceKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceXlibPresentationSupportKHR")
    get_physical_device_xlib_presentation_support_khr :: proc(
        physicalDevice : PhysicalDevice,
        queueFamilyIndex : u32,
        dpy : ^xlib.Display,
        visualID : xlib.VisualId
    ) -> Bool32 ---;

}
