package vk

import _c "core:c"
import "core:os"

VULKAN_CORE_H_ :: 1;
VERSION_1_0 :: 1;
API_VERSION_1_0 :: 4194304;
HEADER_VERSION :: 141;
HEADER_VERSION_COMPLETE :: 4202637;
NULL_HANDLE :: 0;
LOD_CLAMP_NONE :: 1000.000;
REMAINING_MIP_LEVELS :: -1;
REMAINING_ARRAY_LAYERS :: -1;
WHOLE_SIZE :: -1;
ATTACHMENT_UNUSED :: -1;
TRUE :: 1;
FALSE :: 0;
QUEUE_FAMILY_IGNORED :: -1;
SUBPASS_EXTERNAL :: -1;
MAX_PHYSICAL_DEVICE_NAME_SIZE :: 256;
UUID_SIZE :: 16;
MAX_MEMORY_TYPES :: 32;
MAX_MEMORY_HEAPS :: 16;
MAX_EXTENSION_NAME_SIZE :: 256;
MAX_DESCRIPTION_SIZE :: 256;
VERSION_1_1 :: 1;
API_VERSION_1_1 :: 4198400;
MAX_DEVICE_GROUP_SIZE :: 32;
LUID_SIZE :: 8;
QUEUE_FAMILY_EXTERNAL :: -2;
VERSION_1_2 :: 1;
API_VERSION_1_2 :: 4202496;
MAX_DRIVER_NAME_SIZE :: 256;
MAX_DRIVER_INFO_SIZE :: 256;
KHR_SURFACE :: 1;
KHR_SURFACE_SPEC_VERSION :: 25;
KHR_SURFACE_EXTENSION_NAME :: "VK_KHR_surface";
KHR_SWAPCHAIN :: 1;
KHR_SWAPCHAIN_SPEC_VERSION :: 70;
KHR_SWAPCHAIN_EXTENSION_NAME :: "VK_KHR_swapchain";
KHR_DISPLAY :: 1;
KHR_DISPLAY_SPEC_VERSION :: 23;
KHR_DISPLAY_EXTENSION_NAME :: "VK_KHR_display";
KHR_DISPLAY_SWAPCHAIN :: 1;
KHR_DISPLAY_SWAPCHAIN_SPEC_VERSION :: 10;
KHR_DISPLAY_SWAPCHAIN_EXTENSION_NAME :: "VK_KHR_display_swapchain";
KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE :: 1;
KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_SPEC_VERSION :: 3;
KHR_SAMPLER_MIRROR_CLAMP_TO_EDGE_EXTENSION_NAME :: "VK_KHR_sampler_mirror_clamp_to_edge";
KHR_MULTIVIEW :: 1;
KHR_MULTIVIEW_SPEC_VERSION :: 1;
KHR_MULTIVIEW_EXTENSION_NAME :: "VK_KHR_multiview";
KHR_GET_PHYSICAL_DEVICE_PROPERTIES2 :: 1;
KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_SPEC_VERSION :: 2;
KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME :: "VK_KHR_get_physical_device_properties2";
KHR_DEVICE_GROUP :: 1;
KHR_DEVICE_GROUP_SPEC_VERSION :: 4;
KHR_DEVICE_GROUP_EXTENSION_NAME :: "VK_KHR_device_group";
KHR_SHADER_DRAW_PARAMETERS :: 1;
KHR_SHADER_DRAW_PARAMETERS_SPEC_VERSION :: 1;
KHR_SHADER_DRAW_PARAMETERS_EXTENSION_NAME :: "VK_KHR_shader_draw_parameters";
KHR_MAINTENANCE1 :: 1;
KHR_MAINTENANCE1_SPEC_VERSION :: 2;
KHR_MAINTENANCE1_EXTENSION_NAME :: "VK_KHR_maintenance1";
KHR_DEVICE_GROUP_CREATION :: 1;
KHR_DEVICE_GROUP_CREATION_SPEC_VERSION :: 1;
KHR_DEVICE_GROUP_CREATION_EXTENSION_NAME :: "VK_KHR_device_group_creation";
MAX_DEVICE_GROUP_SIZE_KHR :: 32;
KHR_EXTERNAL_MEMORY_CAPABILITIES :: 1;
KHR_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION :: 1;
KHR_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME :: "VK_KHR_external_memory_capabilities";
LUID_SIZE_KHR :: 8;
KHR_EXTERNAL_MEMORY :: 1;
KHR_EXTERNAL_MEMORY_SPEC_VERSION :: 1;
KHR_EXTERNAL_MEMORY_EXTENSION_NAME :: "VK_KHR_external_memory";
QUEUE_FAMILY_EXTERNAL_KHR :: -2;
KHR_EXTERNAL_MEMORY_FD :: 1;
KHR_EXTERNAL_MEMORY_FD_SPEC_VERSION :: 1;
KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME :: "VK_KHR_external_memory_fd";
KHR_EXTERNAL_SEMAPHORE_CAPABILITIES :: 1;
KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_SPEC_VERSION :: 1;
KHR_EXTERNAL_SEMAPHORE_CAPABILITIES_EXTENSION_NAME :: "VK_KHR_external_semaphore_capabilities";
KHR_EXTERNAL_SEMAPHORE :: 1;
KHR_EXTERNAL_SEMAPHORE_SPEC_VERSION :: 1;
KHR_EXTERNAL_SEMAPHORE_EXTENSION_NAME :: "VK_KHR_external_semaphore";
KHR_EXTERNAL_SEMAPHORE_FD :: 1;
KHR_EXTERNAL_SEMAPHORE_FD_SPEC_VERSION :: 1;
KHR_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME :: "VK_KHR_external_semaphore_fd";
KHR_PUSH_DESCRIPTOR :: 1;
KHR_PUSH_DESCRIPTOR_SPEC_VERSION :: 2;
KHR_PUSH_DESCRIPTOR_EXTENSION_NAME :: "VK_KHR_push_descriptor";
KHR_SHADER_FLOAT16_INT8 :: 1;
KHR_SHADER_FLOAT16_INT8_SPEC_VERSION :: 1;
KHR_SHADER_FLOAT16_INT8_EXTENSION_NAME :: "VK_KHR_shader_float16_int8";
KHR_16BIT_STORAGE :: 1;
KHR_16BIT_STORAGE_SPEC_VERSION :: 1;
KHR_16BIT_STORAGE_EXTENSION_NAME :: "VK_KHR_16bit_storage";
KHR_INCREMENTAL_PRESENT :: 1;
KHR_INCREMENTAL_PRESENT_SPEC_VERSION :: 1;
KHR_INCREMENTAL_PRESENT_EXTENSION_NAME :: "VK_KHR_incremental_present";
KHR_DESCRIPTOR_UPDATE_TEMPLATE :: 1;
KHR_DESCRIPTOR_UPDATE_TEMPLATE_SPEC_VERSION :: 1;
KHR_DESCRIPTOR_UPDATE_TEMPLATE_EXTENSION_NAME :: "VK_KHR_descriptor_update_template";
KHR_IMAGELESS_FRAMEBUFFER :: 1;
KHR_IMAGELESS_FRAMEBUFFER_SPEC_VERSION :: 1;
KHR_IMAGELESS_FRAMEBUFFER_EXTENSION_NAME :: "VK_KHR_imageless_framebuffer";
KHR_CREATE_RENDERPASS2 :: 1;
KHR_CREATE_RENDERPASS_2_SPEC_VERSION :: 1;
KHR_CREATE_RENDERPASS_2_EXTENSION_NAME :: "VK_KHR_create_renderpass2";
KHR_SHARED_PRESENTABLE_IMAGE :: 1;
KHR_SHARED_PRESENTABLE_IMAGE_SPEC_VERSION :: 1;
KHR_SHARED_PRESENTABLE_IMAGE_EXTENSION_NAME :: "VK_KHR_shared_presentable_image";
KHR_EXTERNAL_FENCE_CAPABILITIES :: 1;
KHR_EXTERNAL_FENCE_CAPABILITIES_SPEC_VERSION :: 1;
KHR_EXTERNAL_FENCE_CAPABILITIES_EXTENSION_NAME :: "VK_KHR_external_fence_capabilities";
KHR_EXTERNAL_FENCE :: 1;
KHR_EXTERNAL_FENCE_SPEC_VERSION :: 1;
KHR_EXTERNAL_FENCE_EXTENSION_NAME :: "VK_KHR_external_fence";
KHR_EXTERNAL_FENCE_FD :: 1;
KHR_EXTERNAL_FENCE_FD_SPEC_VERSION :: 1;
KHR_EXTERNAL_FENCE_FD_EXTENSION_NAME :: "VK_KHR_external_fence_fd";
KHR_PERFORMANCE_QUERY :: 1;
KHR_PERFORMANCE_QUERY_SPEC_VERSION :: 1;
KHR_PERFORMANCE_QUERY_EXTENSION_NAME :: "VK_KHR_performance_query";
KHR_MAINTENANCE2 :: 1;
KHR_MAINTENANCE2_SPEC_VERSION :: 1;
KHR_MAINTENANCE2_EXTENSION_NAME :: "VK_KHR_maintenance2";
KHR_GET_SURFACE_CAPABILITIES2 :: 1;
KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION :: 1;
KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME :: "VK_KHR_get_surface_capabilities2";
KHR_VARIABLE_POINTERS :: 1;
KHR_VARIABLE_POINTERS_SPEC_VERSION :: 1;
KHR_VARIABLE_POINTERS_EXTENSION_NAME :: "VK_KHR_variable_pointers";
KHR_GET_DISPLAY_PROPERTIES2 :: 1;
KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION :: 1;
KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME :: "VK_KHR_get_display_properties2";
KHR_DEDICATED_ALLOCATION :: 1;
KHR_DEDICATED_ALLOCATION_SPEC_VERSION :: 3;
KHR_DEDICATED_ALLOCATION_EXTENSION_NAME :: "VK_KHR_dedicated_allocation";
KHR_STORAGE_BUFFER_STORAGE_CLASS :: 1;
KHR_STORAGE_BUFFER_STORAGE_CLASS_SPEC_VERSION :: 1;
KHR_STORAGE_BUFFER_STORAGE_CLASS_EXTENSION_NAME :: "VK_KHR_storage_buffer_storage_class";
KHR_RELAXED_BLOCK_LAYOUT :: 1;
KHR_RELAXED_BLOCK_LAYOUT_SPEC_VERSION :: 1;
KHR_RELAXED_BLOCK_LAYOUT_EXTENSION_NAME :: "VK_KHR_relaxed_block_layout";
KHR_GET_MEMORY_REQUIREMENTS2 :: 1;
KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION :: 1;
KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME :: "VK_KHR_get_memory_requirements2";
KHR_IMAGE_FORMAT_LIST :: 1;
KHR_IMAGE_FORMAT_LIST_SPEC_VERSION :: 1;
KHR_IMAGE_FORMAT_LIST_EXTENSION_NAME :: "VK_KHR_image_format_list";
KHR_SAMPLER_YCBCR_CONVERSION :: 1;
KHR_SAMPLER_YCBCR_CONVERSION_SPEC_VERSION :: 14;
KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME :: "VK_KHR_sampler_ycbcr_conversion";
KHR_BIND_MEMORY2 :: 1;
KHR_BIND_MEMORY_2_SPEC_VERSION :: 1;
KHR_BIND_MEMORY_2_EXTENSION_NAME :: "VK_KHR_bind_memory2";
KHR_MAINTENANCE3 :: 1;
KHR_MAINTENANCE3_SPEC_VERSION :: 1;
KHR_MAINTENANCE3_EXTENSION_NAME :: "VK_KHR_maintenance3";
KHR_DRAW_INDIRECT_COUNT :: 1;
KHR_DRAW_INDIRECT_COUNT_SPEC_VERSION :: 1;
KHR_DRAW_INDIRECT_COUNT_EXTENSION_NAME :: "VK_KHR_draw_indirect_count";
KHR_SHADER_SUBGROUP_EXTENDED_TYPES :: 1;
KHR_SHADER_SUBGROUP_EXTENDED_TYPES_SPEC_VERSION :: 1;
KHR_SHADER_SUBGROUP_EXTENDED_TYPES_EXTENSION_NAME :: "VK_KHR_shader_subgroup_extended_types";
KHR_8BIT_STORAGE :: 1;
KHR_8BIT_STORAGE_SPEC_VERSION :: 1;
KHR_8BIT_STORAGE_EXTENSION_NAME :: "VK_KHR_8bit_storage";
KHR_SHADER_ATOMIC_INT64 :: 1;
KHR_SHADER_ATOMIC_INT64_SPEC_VERSION :: 1;
KHR_SHADER_ATOMIC_INT64_EXTENSION_NAME :: "VK_KHR_shader_atomic_int64";
KHR_SHADER_CLOCK :: 1;
KHR_SHADER_CLOCK_SPEC_VERSION :: 1;
KHR_SHADER_CLOCK_EXTENSION_NAME :: "VK_KHR_shader_clock";
KHR_DRIVER_PROPERTIES :: 1;
KHR_DRIVER_PROPERTIES_SPEC_VERSION :: 1;
KHR_DRIVER_PROPERTIES_EXTENSION_NAME :: "VK_KHR_driver_properties";
MAX_DRIVER_NAME_SIZE_KHR :: 256;
MAX_DRIVER_INFO_SIZE_KHR :: 256;
KHR_SHADER_FLOAT_CONTROLS :: 1;
KHR_SHADER_FLOAT_CONTROLS_SPEC_VERSION :: 4;
KHR_SHADER_FLOAT_CONTROLS_EXTENSION_NAME :: "VK_KHR_shader_float_controls";
KHR_DEPTH_STENCIL_RESOLVE :: 1;
KHR_DEPTH_STENCIL_RESOLVE_SPEC_VERSION :: 1;
KHR_DEPTH_STENCIL_RESOLVE_EXTENSION_NAME :: "VK_KHR_depth_stencil_resolve";
KHR_SWAPCHAIN_MUTABLE_FORMAT :: 1;
KHR_SWAPCHAIN_MUTABLE_FORMAT_SPEC_VERSION :: 1;
KHR_SWAPCHAIN_MUTABLE_FORMAT_EXTENSION_NAME :: "VK_KHR_swapchain_mutable_format";
KHR_TIMELINE_SEMAPHORE :: 1;
KHR_TIMELINE_SEMAPHORE_SPEC_VERSION :: 2;
KHR_TIMELINE_SEMAPHORE_EXTENSION_NAME :: "VK_KHR_timeline_semaphore";
KHR_VULKAN_MEMORY_MODEL :: 1;
KHR_VULKAN_MEMORY_MODEL_SPEC_VERSION :: 3;
KHR_VULKAN_MEMORY_MODEL_EXTENSION_NAME :: "VK_KHR_vulkan_memory_model";
KHR_SPIRV_1_4 :: 1;
KHR_SPIRV_1_4_SPEC_VERSION :: 1;
KHR_SPIRV_1_4_EXTENSION_NAME :: "VK_KHR_spirv_1_4";
KHR_SURFACE_PROTECTED_CAPABILITIES :: 1;
KHR_SURFACE_PROTECTED_CAPABILITIES_SPEC_VERSION :: 1;
KHR_SURFACE_PROTECTED_CAPABILITIES_EXTENSION_NAME :: "VK_KHR_surface_protected_capabilities";
KHR_SEPARATE_DEPTH_STENCIL_LAYOUTS :: 1;
KHR_SEPARATE_DEPTH_STENCIL_LAYOUTS_SPEC_VERSION :: 1;
KHR_SEPARATE_DEPTH_STENCIL_LAYOUTS_EXTENSION_NAME :: "VK_KHR_separate_depth_stencil_layouts";
KHR_UNIFORM_BUFFER_STANDARD_LAYOUT :: 1;
KHR_UNIFORM_BUFFER_STANDARD_LAYOUT_SPEC_VERSION :: 1;
KHR_UNIFORM_BUFFER_STANDARD_LAYOUT_EXTENSION_NAME :: "VK_KHR_uniform_buffer_standard_layout";
KHR_BUFFER_DEVICE_ADDRESS :: 1;
KHR_BUFFER_DEVICE_ADDRESS_SPEC_VERSION :: 1;
KHR_BUFFER_DEVICE_ADDRESS_EXTENSION_NAME :: "VK_KHR_buffer_device_address";
KHR_PIPELINE_EXECUTABLE_PROPERTIES :: 1;
KHR_PIPELINE_EXECUTABLE_PROPERTIES_SPEC_VERSION :: 1;
KHR_PIPELINE_EXECUTABLE_PROPERTIES_EXTENSION_NAME :: "VK_KHR_pipeline_executable_properties";
KHR_SHADER_NON_SEMANTIC_INFO :: 1;
KHR_SHADER_NON_SEMANTIC_INFO_SPEC_VERSION :: 1;
KHR_SHADER_NON_SEMANTIC_INFO_EXTENSION_NAME :: "VK_KHR_shader_non_semantic_info";
EXT_DEBUG_REPORT :: 1;
EXT_DEBUG_REPORT_SPEC_VERSION :: 9;
EXT_DEBUG_REPORT_EXTENSION_NAME :: "VK_EXT_debug_report";
NV_GLSL_SHADER :: 1;
NV_GLSL_SHADER_SPEC_VERSION :: 1;
NV_GLSL_SHADER_EXTENSION_NAME :: "VK_NV_glsl_shader";
EXT_DEPTH_RANGE_UNRESTRICTED :: 1;
EXT_DEPTH_RANGE_UNRESTRICTED_SPEC_VERSION :: 1;
EXT_DEPTH_RANGE_UNRESTRICTED_EXTENSION_NAME :: "VK_EXT_depth_range_unrestricted";
IMG_FILTER_CUBIC :: 1;
IMG_FILTER_CUBIC_SPEC_VERSION :: 1;
IMG_FILTER_CUBIC_EXTENSION_NAME :: "VK_IMG_filter_cubic";
AMD_RASTERIZATION_ORDER :: 1;
AMD_RASTERIZATION_ORDER_SPEC_VERSION :: 1;
AMD_RASTERIZATION_ORDER_EXTENSION_NAME :: "VK_AMD_rasterization_order";
AMD_SHADER_TRINARY_MINMAX :: 1;
AMD_SHADER_TRINARY_MINMAX_SPEC_VERSION :: 1;
AMD_SHADER_TRINARY_MINMAX_EXTENSION_NAME :: "VK_AMD_shader_trinary_minmax";
AMD_SHADER_EXPLICIT_VERTEX_PARAMETER :: 1;
AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_SPEC_VERSION :: 1;
AMD_SHADER_EXPLICIT_VERTEX_PARAMETER_EXTENSION_NAME :: "VK_AMD_shader_explicit_vertex_parameter";
EXT_DEBUG_MARKER :: 1;
EXT_DEBUG_MARKER_SPEC_VERSION :: 4;
EXT_DEBUG_MARKER_EXTENSION_NAME :: "VK_EXT_debug_marker";
AMD_GCN_SHADER :: 1;
AMD_GCN_SHADER_SPEC_VERSION :: 1;
AMD_GCN_SHADER_EXTENSION_NAME :: "VK_AMD_gcn_shader";
NV_DEDICATED_ALLOCATION :: 1;
NV_DEDICATED_ALLOCATION_SPEC_VERSION :: 1;
NV_DEDICATED_ALLOCATION_EXTENSION_NAME :: "VK_NV_dedicated_allocation";
EXT_TRANSFORM_FEEDBACK :: 1;
EXT_TRANSFORM_FEEDBACK_SPEC_VERSION :: 1;
EXT_TRANSFORM_FEEDBACK_EXTENSION_NAME :: "VK_EXT_transform_feedback";
NVX_IMAGE_VIEW_HANDLE :: 1;
NVX_IMAGE_VIEW_HANDLE_SPEC_VERSION :: 2;
NVX_IMAGE_VIEW_HANDLE_EXTENSION_NAME :: "VK_NVX_image_view_handle";
AMD_DRAW_INDIRECT_COUNT :: 1;
AMD_DRAW_INDIRECT_COUNT_SPEC_VERSION :: 2;
AMD_DRAW_INDIRECT_COUNT_EXTENSION_NAME :: "VK_AMD_draw_indirect_count";
AMD_NEGATIVE_VIEWPORT_HEIGHT :: 1;
AMD_NEGATIVE_VIEWPORT_HEIGHT_SPEC_VERSION :: 1;
AMD_NEGATIVE_VIEWPORT_HEIGHT_EXTENSION_NAME :: "VK_AMD_negative_viewport_height";
AMD_GPU_SHADER_HALF_FLOAT :: 1;
AMD_GPU_SHADER_HALF_FLOAT_SPEC_VERSION :: 2;
AMD_GPU_SHADER_HALF_FLOAT_EXTENSION_NAME :: "VK_AMD_gpu_shader_half_float";
AMD_SHADER_BALLOT :: 1;
AMD_SHADER_BALLOT_SPEC_VERSION :: 1;
AMD_SHADER_BALLOT_EXTENSION_NAME :: "VK_AMD_shader_ballot";
AMD_TEXTURE_GATHER_BIAS_LOD :: 1;
AMD_TEXTURE_GATHER_BIAS_LOD_SPEC_VERSION :: 1;
AMD_TEXTURE_GATHER_BIAS_LOD_EXTENSION_NAME :: "VK_AMD_texture_gather_bias_lod";
AMD_SHADER_INFO :: 1;
AMD_SHADER_INFO_SPEC_VERSION :: 1;
AMD_SHADER_INFO_EXTENSION_NAME :: "VK_AMD_shader_info";
AMD_SHADER_IMAGE_LOAD_STORE_LOD :: 1;
AMD_SHADER_IMAGE_LOAD_STORE_LOD_SPEC_VERSION :: 1;
AMD_SHADER_IMAGE_LOAD_STORE_LOD_EXTENSION_NAME :: "VK_AMD_shader_image_load_store_lod";
NV_CORNER_SAMPLED_IMAGE :: 1;
NV_CORNER_SAMPLED_IMAGE_SPEC_VERSION :: 2;
NV_CORNER_SAMPLED_IMAGE_EXTENSION_NAME :: "VK_NV_corner_sampled_image";
IMG_FORMAT_PVRTC :: 1;
IMG_FORMAT_PVRTC_SPEC_VERSION :: 1;
IMG_FORMAT_PVRTC_EXTENSION_NAME :: "VK_IMG_format_pvrtc";
NV_EXTERNAL_MEMORY_CAPABILITIES :: 1;
NV_EXTERNAL_MEMORY_CAPABILITIES_SPEC_VERSION :: 1;
NV_EXTERNAL_MEMORY_CAPABILITIES_EXTENSION_NAME :: "VK_NV_external_memory_capabilities";
NV_EXTERNAL_MEMORY :: 1;
NV_EXTERNAL_MEMORY_SPEC_VERSION :: 1;
NV_EXTERNAL_MEMORY_EXTENSION_NAME :: "VK_NV_external_memory";
EXT_VALIDATION_FLAGS :: 1;
EXT_VALIDATION_FLAGS_SPEC_VERSION :: 2;
EXT_VALIDATION_FLAGS_EXTENSION_NAME :: "VK_EXT_validation_flags";
EXT_SHADER_SUBGROUP_BALLOT :: 1;
EXT_SHADER_SUBGROUP_BALLOT_SPEC_VERSION :: 1;
EXT_SHADER_SUBGROUP_BALLOT_EXTENSION_NAME :: "VK_EXT_shader_subgroup_ballot";
EXT_SHADER_SUBGROUP_VOTE :: 1;
EXT_SHADER_SUBGROUP_VOTE_SPEC_VERSION :: 1;
EXT_SHADER_SUBGROUP_VOTE_EXTENSION_NAME :: "VK_EXT_shader_subgroup_vote";
EXT_TEXTURE_COMPRESSION_ASTC_HDR :: 1;
EXT_TEXTURE_COMPRESSION_ASTC_HDR_SPEC_VERSION :: 1;
EXT_TEXTURE_COMPRESSION_ASTC_HDR_EXTENSION_NAME :: "VK_EXT_texture_compression_astc_hdr";
EXT_ASTC_DECODE_MODE :: 1;
EXT_ASTC_DECODE_MODE_SPEC_VERSION :: 1;
EXT_ASTC_DECODE_MODE_EXTENSION_NAME :: "VK_EXT_astc_decode_mode";
EXT_CONDITIONAL_RENDERING :: 1;
EXT_CONDITIONAL_RENDERING_SPEC_VERSION :: 2;
EXT_CONDITIONAL_RENDERING_EXTENSION_NAME :: "VK_EXT_conditional_rendering";
NV_CLIP_SPACE_W_SCALING :: 1;
NV_CLIP_SPACE_W_SCALING_SPEC_VERSION :: 1;
NV_CLIP_SPACE_W_SCALING_EXTENSION_NAME :: "VK_NV_clip_space_w_scaling";
EXT_DIRECT_MODE_DISPLAY :: 1;
EXT_DIRECT_MODE_DISPLAY_SPEC_VERSION :: 1;
EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME :: "VK_EXT_direct_mode_display";
EXT_DISPLAY_SURFACE_COUNTER :: 1;
EXT_DISPLAY_SURFACE_COUNTER_SPEC_VERSION :: 1;
EXT_DISPLAY_SURFACE_COUNTER_EXTENSION_NAME :: "VK_EXT_display_surface_counter";
EXT_DISPLAY_CONTROL :: 1;
EXT_DISPLAY_CONTROL_SPEC_VERSION :: 1;
EXT_DISPLAY_CONTROL_EXTENSION_NAME :: "VK_EXT_display_control";
GOOGLE_DISPLAY_TIMING :: 1;
GOOGLE_DISPLAY_TIMING_SPEC_VERSION :: 1;
GOOGLE_DISPLAY_TIMING_EXTENSION_NAME :: "VK_GOOGLE_display_timing";
NV_SAMPLE_MASK_OVERRIDE_COVERAGE :: 1;
NV_SAMPLE_MASK_OVERRIDE_COVERAGE_SPEC_VERSION :: 1;
NV_SAMPLE_MASK_OVERRIDE_COVERAGE_EXTENSION_NAME :: "VK_NV_sample_mask_override_coverage";
NV_GEOMETRY_SHADER_PASSTHROUGH :: 1;
NV_GEOMETRY_SHADER_PASSTHROUGH_SPEC_VERSION :: 1;
NV_GEOMETRY_SHADER_PASSTHROUGH_EXTENSION_NAME :: "VK_NV_geometry_shader_passthrough";
NV_VIEWPORT_ARRAY2 :: 1;
NV_VIEWPORT_ARRAY2_SPEC_VERSION :: 1;
NV_VIEWPORT_ARRAY2_EXTENSION_NAME :: "VK_NV_viewport_array2";
NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES :: 1;
NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_SPEC_VERSION :: 1;
NVX_MULTIVIEW_PER_VIEW_ATTRIBUTES_EXTENSION_NAME :: "VK_NVX_multiview_per_view_attributes";
NV_VIEWPORT_SWIZZLE :: 1;
NV_VIEWPORT_SWIZZLE_SPEC_VERSION :: 1;
NV_VIEWPORT_SWIZZLE_EXTENSION_NAME :: "VK_NV_viewport_swizzle";
EXT_DISCARD_RECTANGLES :: 1;
EXT_DISCARD_RECTANGLES_SPEC_VERSION :: 1;
EXT_DISCARD_RECTANGLES_EXTENSION_NAME :: "VK_EXT_discard_rectangles";
EXT_CONSERVATIVE_RASTERIZATION :: 1;
EXT_CONSERVATIVE_RASTERIZATION_SPEC_VERSION :: 1;
EXT_CONSERVATIVE_RASTERIZATION_EXTENSION_NAME :: "VK_EXT_conservative_rasterization";
EXT_DEPTH_CLIP_ENABLE :: 1;
EXT_DEPTH_CLIP_ENABLE_SPEC_VERSION :: 1;
EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME :: "VK_EXT_depth_clip_enable";
EXT_SWAPCHAIN_COLORSPACE :: 1;
EXT_SWAPCHAIN_COLOR_SPACE_SPEC_VERSION :: 4;
EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME :: "VK_EXT_swapchain_colorspace";
EXT_HDR_METADATA :: 1;
EXT_HDR_METADATA_SPEC_VERSION :: 2;
EXT_HDR_METADATA_EXTENSION_NAME :: "VK_EXT_hdr_metadata";
EXT_EXTERNAL_MEMORY_DMA_BUF :: 1;
EXT_EXTERNAL_MEMORY_DMA_BUF_SPEC_VERSION :: 1;
EXT_EXTERNAL_MEMORY_DMA_BUF_EXTENSION_NAME :: "VK_EXT_external_memory_dma_buf";
EXT_QUEUE_FAMILY_FOREIGN :: 1;
EXT_QUEUE_FAMILY_FOREIGN_SPEC_VERSION :: 1;
EXT_QUEUE_FAMILY_FOREIGN_EXTENSION_NAME :: "VK_EXT_queue_family_foreign";
QUEUE_FAMILY_FOREIGN_EXT :: -3;
EXT_DEBUG_UTILS :: 1;
EXT_DEBUG_UTILS_SPEC_VERSION :: 2;
EXT_DEBUG_UTILS_EXTENSION_NAME :: "VK_EXT_debug_utils";
EXT_SAMPLER_FILTER_MINMAX :: 1;
EXT_SAMPLER_FILTER_MINMAX_SPEC_VERSION :: 2;
EXT_SAMPLER_FILTER_MINMAX_EXTENSION_NAME :: "VK_EXT_sampler_filter_minmax";
AMD_GPU_SHADER_INT16 :: 1;
AMD_GPU_SHADER_INT16_SPEC_VERSION :: 2;
AMD_GPU_SHADER_INT16_EXTENSION_NAME :: "VK_AMD_gpu_shader_int16";
AMD_MIXED_ATTACHMENT_SAMPLES :: 1;
AMD_MIXED_ATTACHMENT_SAMPLES_SPEC_VERSION :: 1;
AMD_MIXED_ATTACHMENT_SAMPLES_EXTENSION_NAME :: "VK_AMD_mixed_attachment_samples";
AMD_SHADER_FRAGMENT_MASK :: 1;
AMD_SHADER_FRAGMENT_MASK_SPEC_VERSION :: 1;
AMD_SHADER_FRAGMENT_MASK_EXTENSION_NAME :: "VK_AMD_shader_fragment_mask";
EXT_INLINE_UNIFORM_BLOCK :: 1;
EXT_INLINE_UNIFORM_BLOCK_SPEC_VERSION :: 1;
EXT_INLINE_UNIFORM_BLOCK_EXTENSION_NAME :: "VK_EXT_inline_uniform_block";
EXT_SHADER_STENCIL_EXPORT :: 1;
EXT_SHADER_STENCIL_EXPORT_SPEC_VERSION :: 1;
EXT_SHADER_STENCIL_EXPORT_EXTENSION_NAME :: "VK_EXT_shader_stencil_export";
EXT_SAMPLE_LOCATIONS :: 1;
EXT_SAMPLE_LOCATIONS_SPEC_VERSION :: 1;
EXT_SAMPLE_LOCATIONS_EXTENSION_NAME :: "VK_EXT_sample_locations";
EXT_BLEND_OPERATION_ADVANCED :: 1;
EXT_BLEND_OPERATION_ADVANCED_SPEC_VERSION :: 2;
EXT_BLEND_OPERATION_ADVANCED_EXTENSION_NAME :: "VK_EXT_blend_operation_advanced";
NV_FRAGMENT_COVERAGE_TO_COLOR :: 1;
NV_FRAGMENT_COVERAGE_TO_COLOR_SPEC_VERSION :: 1;
NV_FRAGMENT_COVERAGE_TO_COLOR_EXTENSION_NAME :: "VK_NV_fragment_coverage_to_color";
NV_FRAMEBUFFER_MIXED_SAMPLES :: 1;
NV_FRAMEBUFFER_MIXED_SAMPLES_SPEC_VERSION :: 1;
NV_FRAMEBUFFER_MIXED_SAMPLES_EXTENSION_NAME :: "VK_NV_framebuffer_mixed_samples";
NV_FILL_RECTANGLE :: 1;
NV_FILL_RECTANGLE_SPEC_VERSION :: 1;
NV_FILL_RECTANGLE_EXTENSION_NAME :: "VK_NV_fill_rectangle";
NV_SHADER_SM_BUILTINS :: 1;
NV_SHADER_SM_BUILTINS_SPEC_VERSION :: 1;
NV_SHADER_SM_BUILTINS_EXTENSION_NAME :: "VK_NV_shader_sm_builtins";
EXT_POST_DEPTH_COVERAGE :: 1;
EXT_POST_DEPTH_COVERAGE_SPEC_VERSION :: 1;
EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME :: "VK_EXT_post_depth_coverage";
EXT_IMAGE_DRM_FORMAT_MODIFIER :: 1;
EXT_IMAGE_DRM_FORMAT_MODIFIER_SPEC_VERSION :: 1;
EXT_IMAGE_DRM_FORMAT_MODIFIER_EXTENSION_NAME :: "VK_EXT_image_drm_format_modifier";
EXT_VALIDATION_CACHE :: 1;
EXT_VALIDATION_CACHE_SPEC_VERSION :: 1;
EXT_VALIDATION_CACHE_EXTENSION_NAME :: "VK_EXT_validation_cache";
EXT_DESCRIPTOR_INDEXING :: 1;
EXT_DESCRIPTOR_INDEXING_SPEC_VERSION :: 2;
EXT_DESCRIPTOR_INDEXING_EXTENSION_NAME :: "VK_EXT_descriptor_indexing";
EXT_SHADER_VIEWPORT_INDEX_LAYER :: 1;
EXT_SHADER_VIEWPORT_INDEX_LAYER_SPEC_VERSION :: 1;
EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME :: "VK_EXT_shader_viewport_index_layer";
NV_SHADING_RATE_IMAGE :: 1;
NV_SHADING_RATE_IMAGE_SPEC_VERSION :: 3;
NV_SHADING_RATE_IMAGE_EXTENSION_NAME :: "VK_NV_shading_rate_image";
NV_RAY_TRACING :: 1;
NV_RAY_TRACING_SPEC_VERSION :: 3;
NV_RAY_TRACING_EXTENSION_NAME :: "VK_NV_ray_tracing";
SHADER_UNUSED_KHR :: -1;
SHADER_UNUSED_NV :: -1;
NV_REPRESENTATIVE_FRAGMENT_TEST :: 1;
NV_REPRESENTATIVE_FRAGMENT_TEST_SPEC_VERSION :: 2;
NV_REPRESENTATIVE_FRAGMENT_TEST_EXTENSION_NAME :: "VK_NV_representative_fragment_test";
EXT_FILTER_CUBIC :: 1;
EXT_FILTER_CUBIC_SPEC_VERSION :: 3;
EXT_FILTER_CUBIC_EXTENSION_NAME :: "VK_EXT_filter_cubic";
QCOM_RENDER_PASS_SHADER_RESOLVE :: 1;
QCOM_RENDER_PASS_SHADER_RESOLVE_SPEC_VERSION :: 4;
QCOM_RENDER_PASS_SHADER_RESOLVE_EXTENSION_NAME :: "VK_QCOM_render_pass_shader_resolve";
EXT_GLOBAL_PRIORITY :: 1;
EXT_GLOBAL_PRIORITY_SPEC_VERSION :: 2;
EXT_GLOBAL_PRIORITY_EXTENSION_NAME :: "VK_EXT_global_priority";
EXT_EXTERNAL_MEMORY_HOST :: 1;
EXT_EXTERNAL_MEMORY_HOST_SPEC_VERSION :: 1;
EXT_EXTERNAL_MEMORY_HOST_EXTENSION_NAME :: "VK_EXT_external_memory_host";
AMD_BUFFER_MARKER :: 1;
AMD_BUFFER_MARKER_SPEC_VERSION :: 1;
AMD_BUFFER_MARKER_EXTENSION_NAME :: "VK_AMD_buffer_marker";
AMD_PIPELINE_COMPILER_CONTROL :: 1;
AMD_PIPELINE_COMPILER_CONTROL_SPEC_VERSION :: 1;
AMD_PIPELINE_COMPILER_CONTROL_EXTENSION_NAME :: "VK_AMD_pipeline_compiler_control";
EXT_CALIBRATED_TIMESTAMPS :: 1;
EXT_CALIBRATED_TIMESTAMPS_SPEC_VERSION :: 1;
EXT_CALIBRATED_TIMESTAMPS_EXTENSION_NAME :: "VK_EXT_calibrated_timestamps";
AMD_SHADER_CORE_PROPERTIES :: 1;
AMD_SHADER_CORE_PROPERTIES_SPEC_VERSION :: 2;
AMD_SHADER_CORE_PROPERTIES_EXTENSION_NAME :: "VK_AMD_shader_core_properties";
AMD_MEMORY_OVERALLOCATION_BEHAVIOR :: 1;
AMD_MEMORY_OVERALLOCATION_BEHAVIOR_SPEC_VERSION :: 1;
AMD_MEMORY_OVERALLOCATION_BEHAVIOR_EXTENSION_NAME :: "VK_AMD_memory_overallocation_behavior";
EXT_VERTEX_ATTRIBUTE_DIVISOR :: 1;
EXT_VERTEX_ATTRIBUTE_DIVISOR_SPEC_VERSION :: 3;
EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME :: "VK_EXT_vertex_attribute_divisor";
EXT_PIPELINE_CREATION_FEEDBACK :: 1;
EXT_PIPELINE_CREATION_FEEDBACK_SPEC_VERSION :: 1;
EXT_PIPELINE_CREATION_FEEDBACK_EXTENSION_NAME :: "VK_EXT_pipeline_creation_feedback";
NV_SHADER_SUBGROUP_PARTITIONED :: 1;
NV_SHADER_SUBGROUP_PARTITIONED_SPEC_VERSION :: 1;
NV_SHADER_SUBGROUP_PARTITIONED_EXTENSION_NAME :: "VK_NV_shader_subgroup_partitioned";
NV_COMPUTE_SHADER_DERIVATIVES :: 1;
NV_COMPUTE_SHADER_DERIVATIVES_SPEC_VERSION :: 1;
NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME :: "VK_NV_compute_shader_derivatives";
NV_MESH_SHADER :: 1;
NV_MESH_SHADER_SPEC_VERSION :: 1;
NV_MESH_SHADER_EXTENSION_NAME :: "VK_NV_mesh_shader";
NV_FRAGMENT_SHADER_BARYCENTRIC :: 1;
NV_FRAGMENT_SHADER_BARYCENTRIC_SPEC_VERSION :: 1;
NV_FRAGMENT_SHADER_BARYCENTRIC_EXTENSION_NAME :: "VK_NV_fragment_shader_barycentric";
NV_SHADER_IMAGE_FOOTPRINT :: 1;
NV_SHADER_IMAGE_FOOTPRINT_SPEC_VERSION :: 2;
NV_SHADER_IMAGE_FOOTPRINT_EXTENSION_NAME :: "VK_NV_shader_image_footprint";
NV_SCISSOR_EXCLUSIVE :: 1;
NV_SCISSOR_EXCLUSIVE_SPEC_VERSION :: 1;
NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME :: "VK_NV_scissor_exclusive";
NV_DEVICE_DIAGNOSTIC_CHECKPOINTS :: 1;
NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION :: 2;
NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME :: "VK_NV_device_diagnostic_checkpoints";
INTEL_SHADER_INTEGER_FUNCTIONS2 :: 1;
INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION :: 1;
INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME :: "VK_INTEL_shader_integer_functions2";
INTEL_PERFORMANCE_QUERY :: 1;
INTEL_PERFORMANCE_QUERY_SPEC_VERSION :: 2;
INTEL_PERFORMANCE_QUERY_EXTENSION_NAME :: "VK_INTEL_performance_query";
EXT_PCI_BUS_INFO :: 1;
EXT_PCI_BUS_INFO_SPEC_VERSION :: 2;
EXT_PCI_BUS_INFO_EXTENSION_NAME :: "VK_EXT_pci_bus_info";
AMD_DISPLAY_NATIVE_HDR :: 1;
AMD_DISPLAY_NATIVE_HDR_SPEC_VERSION :: 1;
AMD_DISPLAY_NATIVE_HDR_EXTENSION_NAME :: "VK_AMD_display_native_hdr";
EXT_FRAGMENT_DENSITY_MAP :: 1;
EXT_FRAGMENT_DENSITY_MAP_SPEC_VERSION :: 1;
EXT_FRAGMENT_DENSITY_MAP_EXTENSION_NAME :: "VK_EXT_fragment_density_map";
EXT_SCALAR_BLOCK_LAYOUT :: 1;
EXT_SCALAR_BLOCK_LAYOUT_SPEC_VERSION :: 1;
EXT_SCALAR_BLOCK_LAYOUT_EXTENSION_NAME :: "VK_EXT_scalar_block_layout";
GOOGLE_HLSL_FUNCTIONALITY1 :: 1;
GOOGLE_HLSL_FUNCTIONALITY1_SPEC_VERSION :: 1;
GOOGLE_HLSL_FUNCTIONALITY1_EXTENSION_NAME :: "VK_GOOGLE_hlsl_functionality1";
GOOGLE_DECORATE_STRING :: 1;
GOOGLE_DECORATE_STRING_SPEC_VERSION :: 1;
GOOGLE_DECORATE_STRING_EXTENSION_NAME :: "VK_GOOGLE_decorate_string";
EXT_SUBGROUP_SIZE_CONTROL :: 1;
EXT_SUBGROUP_SIZE_CONTROL_SPEC_VERSION :: 2;
EXT_SUBGROUP_SIZE_CONTROL_EXTENSION_NAME :: "VK_EXT_subgroup_size_control";
AMD_SHADER_CORE_PROPERTIES2 :: 1;
AMD_SHADER_CORE_PROPERTIES_2_SPEC_VERSION :: 1;
AMD_SHADER_CORE_PROPERTIES_2_EXTENSION_NAME :: "VK_AMD_shader_core_properties2";
AMD_DEVICE_COHERENT_MEMORY :: 1;
AMD_DEVICE_COHERENT_MEMORY_SPEC_VERSION :: 1;
AMD_DEVICE_COHERENT_MEMORY_EXTENSION_NAME :: "VK_AMD_device_coherent_memory";
EXT_MEMORY_BUDGET :: 1;
EXT_MEMORY_BUDGET_SPEC_VERSION :: 1;
EXT_MEMORY_BUDGET_EXTENSION_NAME :: "VK_EXT_memory_budget";
EXT_MEMORY_PRIORITY :: 1;
EXT_MEMORY_PRIORITY_SPEC_VERSION :: 1;
EXT_MEMORY_PRIORITY_EXTENSION_NAME :: "VK_EXT_memory_priority";
NV_DEDICATED_ALLOCATION_IMAGE_ALIASING :: 1;
NV_DEDICATED_ALLOCATION_IMAGE_ALIASING_SPEC_VERSION :: 1;
NV_DEDICATED_ALLOCATION_IMAGE_ALIASING_EXTENSION_NAME :: "VK_NV_dedicated_allocation_image_aliasing";
EXT_BUFFER_DEVICE_ADDRESS :: 1;
EXT_BUFFER_DEVICE_ADDRESS_SPEC_VERSION :: 2;
EXT_BUFFER_DEVICE_ADDRESS_EXTENSION_NAME :: "VK_EXT_buffer_device_address";
EXT_TOOLING_INFO :: 1;
EXT_TOOLING_INFO_SPEC_VERSION :: 1;
EXT_TOOLING_INFO_EXTENSION_NAME :: "VK_EXT_tooling_info";
EXT_SEPARATE_STENCIL_USAGE :: 1;
EXT_SEPARATE_STENCIL_USAGE_SPEC_VERSION :: 1;
EXT_SEPARATE_STENCIL_USAGE_EXTENSION_NAME :: "VK_EXT_separate_stencil_usage";
EXT_VALIDATION_FEATURES :: 1;
EXT_VALIDATION_FEATURES_SPEC_VERSION :: 3;
EXT_VALIDATION_FEATURES_EXTENSION_NAME :: "VK_EXT_validation_features";
NV_COOPERATIVE_MATRIX :: 1;
NV_COOPERATIVE_MATRIX_SPEC_VERSION :: 1;
NV_COOPERATIVE_MATRIX_EXTENSION_NAME :: "VK_NV_cooperative_matrix";
NV_COVERAGE_REDUCTION_MODE :: 1;
NV_COVERAGE_REDUCTION_MODE_SPEC_VERSION :: 1;
NV_COVERAGE_REDUCTION_MODE_EXTENSION_NAME :: "VK_NV_coverage_reduction_mode";
EXT_FRAGMENT_SHADER_INTERLOCK :: 1;
EXT_FRAGMENT_SHADER_INTERLOCK_SPEC_VERSION :: 1;
EXT_FRAGMENT_SHADER_INTERLOCK_EXTENSION_NAME :: "VK_EXT_fragment_shader_interlock";
EXT_YCBCR_IMAGE_ARRAYS :: 1;
EXT_YCBCR_IMAGE_ARRAYS_SPEC_VERSION :: 1;
EXT_YCBCR_IMAGE_ARRAYS_EXTENSION_NAME :: "VK_EXT_ycbcr_image_arrays";
EXT_HEADLESS_SURFACE :: 1;
EXT_HEADLESS_SURFACE_SPEC_VERSION :: 1;
EXT_HEADLESS_SURFACE_EXTENSION_NAME :: "VK_EXT_headless_surface";
EXT_LINE_RASTERIZATION :: 1;
EXT_LINE_RASTERIZATION_SPEC_VERSION :: 1;
EXT_LINE_RASTERIZATION_EXTENSION_NAME :: "VK_EXT_line_rasterization";
EXT_HOST_QUERY_RESET :: 1;
EXT_HOST_QUERY_RESET_SPEC_VERSION :: 1;
EXT_HOST_QUERY_RESET_EXTENSION_NAME :: "VK_EXT_host_query_reset";
EXT_INDEX_TYPE_UINT8 :: 1;
EXT_INDEX_TYPE_UINT8_SPEC_VERSION :: 1;
EXT_INDEX_TYPE_UINT8_EXTENSION_NAME :: "VK_EXT_index_type_uint8";
EXT_SHADER_DEMOTE_TO_HELPER_INVOCATION :: 1;
EXT_SHADER_DEMOTE_TO_HELPER_INVOCATION_SPEC_VERSION :: 1;
EXT_SHADER_DEMOTE_TO_HELPER_INVOCATION_EXTENSION_NAME :: "VK_EXT_shader_demote_to_helper_invocation";
NV_DEVICE_GENERATED_COMMANDS :: 1;
NV_DEVICE_GENERATED_COMMANDS_SPEC_VERSION :: 3;
NV_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME :: "VK_NV_device_generated_commands";
EXT_TEXEL_BUFFER_ALIGNMENT :: 1;
EXT_TEXEL_BUFFER_ALIGNMENT_SPEC_VERSION :: 1;
EXT_TEXEL_BUFFER_ALIGNMENT_EXTENSION_NAME :: "VK_EXT_texel_buffer_alignment";
QCOM_RENDER_PASS_TRANSFORM :: 1;
QCOM_RENDER_PASS_TRANSFORM_SPEC_VERSION :: 1;
QCOM_RENDER_PASS_TRANSFORM_EXTENSION_NAME :: "VK_QCOM_render_pass_transform";
EXT_ROBUSTNESS2 :: 1;
EXT_ROBUSTNESS_2_SPEC_VERSION :: 1;
EXT_ROBUSTNESS_2_EXTENSION_NAME :: "VK_EXT_robustness2";
EXT_CUSTOM_BORDER_COLOR :: 1;
EXT_CUSTOM_BORDER_COLOR_SPEC_VERSION :: 12;
EXT_CUSTOM_BORDER_COLOR_EXTENSION_NAME :: "VK_EXT_custom_border_color";
GOOGLE_USER_TYPE :: 1;
GOOGLE_USER_TYPE_SPEC_VERSION :: 1;
GOOGLE_USER_TYPE_EXTENSION_NAME :: "VK_GOOGLE_user_type";
EXT_PRIVATE_DATA :: 1;
EXT_PRIVATE_DATA_SPEC_VERSION :: 1;
EXT_PRIVATE_DATA_EXTENSION_NAME :: "VK_EXT_private_data";
EXT_PIPELINE_CREATION_CACHE_CONTROL :: 1;
EXT_PIPELINE_CREATION_CACHE_CONTROL_SPEC_VERSION :: 3;
EXT_PIPELINE_CREATION_CACHE_CONTROL_EXTENSION_NAME :: "VK_EXT_pipeline_creation_cache_control";
NV_DEVICE_DIAGNOSTICS_CONFIG :: 1;
NV_DEVICE_DIAGNOSTICS_CONFIG_SPEC_VERSION :: 1;
NV_DEVICE_DIAGNOSTICS_CONFIG_EXTENSION_NAME :: "VK_NV_device_diagnostics_config";
QCOM_RENDER_PASS_STORE_OPS :: 1;
QCOM_RENDER_PASS_STORE_OPS_SPEC_VERSION :: 2;
QCOM_RENDER_PASS_STORE_OPS_EXTENSION_NAME :: "VK_QCOM_render_pass_store_ops";

Flags :: u32;
Bool32 :: u32;
DeviceSize :: u64;
SampleMask :: u32;
Instance :: ^InstanceT;
PhysicalDevice :: ^PhysicalDeviceT;
Device :: ^DeviceT;
Queue :: ^QueueT;
Semaphore :: ^SemaphoreT;
CommandBuffer :: ^CommandBufferT;
Fence :: ^FenceT;
DeviceMemory :: ^DeviceMemoryT;
Buffer :: ^BufferT;
Image :: ^ImageT;
Event :: ^EventT;
QueryPool :: ^QueryPoolT;
BufferView :: ^BufferViewT;
ImageView :: ^ImageViewT;
ShaderModule :: ^ShaderModuleT;
PipelineCache :: ^PipelineCacheT;
PipelineLayout :: ^PipelineLayoutT;
RenderPass :: ^RenderPassT;
Pipeline :: ^PipelineT;
DescriptorSetLayout :: ^DescriptorSetLayoutT;
Sampler :: ^SamplerT;
DescriptorPool :: ^DescriptorPoolT;
DescriptorSet :: ^DescriptorSetT;
Framebuffer :: ^FramebufferT;
CommandPool :: ^CommandPoolT;
InstanceCreateFlags :: Flags;
FormatFeatureFlags :: Flags;
ImageUsageFlags :: Flags;
ImageCreateFlags :: Flags;
SampleCountFlags :: Flags;
QueueFlags :: Flags;
MemoryPropertyFlags :: Flags;
MemoryHeapFlags :: Flags;
DeviceCreateFlags :: Flags;
DeviceQueueCreateFlags :: Flags;
PipelineStageFlags :: Flags;
MemoryMapFlags :: Flags;
ImageAspectFlags :: Flags;
SparseImageFormatFlags :: Flags;
SparseMemoryBindFlags :: Flags;
FenceCreateFlags :: Flags;
SemaphoreCreateFlags :: Flags;
EventCreateFlags :: Flags;
QueryPoolCreateFlags :: Flags;
QueryPipelineStatisticFlags :: Flags;
QueryResultFlags :: Flags;
BufferCreateFlags :: Flags;
BufferUsageFlags :: Flags;
BufferViewCreateFlags :: Flags;
ImageViewCreateFlags :: Flags;
ShaderModuleCreateFlags :: Flags;
PipelineCacheCreateFlags :: Flags;
PipelineCreateFlags :: Flags;
PipelineShaderStageCreateFlags :: Flags;
PipelineVertexInputStateCreateFlags :: Flags;
PipelineInputAssemblyStateCreateFlags :: Flags;
PipelineTessellationStateCreateFlags :: Flags;
PipelineViewportStateCreateFlags :: Flags;
PipelineRasterizationStateCreateFlags :: Flags;
CullModeFlags :: Flags;
PipelineMultisampleStateCreateFlags :: Flags;
PipelineDepthStencilStateCreateFlags :: Flags;
PipelineColorBlendStateCreateFlags :: Flags;
ColorComponentFlags :: Flags;
PipelineDynamicStateCreateFlags :: Flags;
PipelineLayoutCreateFlags :: Flags;
ShaderStageFlags :: Flags;
SamplerCreateFlags :: Flags;
DescriptorSetLayoutCreateFlags :: Flags;
DescriptorPoolCreateFlags :: Flags;
DescriptorPoolResetFlags :: Flags;
FramebufferCreateFlags :: Flags;
RenderPassCreateFlags :: Flags;
AttachmentDescriptionFlags :: Flags;
SubpassDescriptionFlags :: Flags;
AccessFlags :: Flags;
DependencyFlags :: Flags;
CommandPoolCreateFlags :: Flags;
CommandPoolResetFlags :: Flags;
CommandBufferUsageFlags :: Flags;
QueryControlFlags :: Flags;
CommandBufferResetFlags :: Flags;
StencilFaceFlags :: Flags;
PFN_AllocationFunction :: #type proc();
PFN_ReallocationFunction :: #type proc();
PFN_FreeFunction :: #type proc();
PFN_InternalAllocationNotification :: #type proc();
PFN_InternalFreeNotification :: #type proc();
PFN_VoidFunction :: #type proc();
PFN_CreateInstance :: #type proc();
PFN_DestroyInstance :: #type proc();
PFN_EnumeratePhysicalDevices :: #type proc();
PFN_GetPhysicalDeviceFeatures :: #type proc();
PFN_GetPhysicalDeviceFormatProperties :: #type proc();
PFN_GetPhysicalDeviceImageFormatProperties :: #type proc();
PFN_GetPhysicalDeviceProperties :: #type proc();
PFN_GetPhysicalDeviceQueueFamilyProperties :: #type proc();
PFN_GetPhysicalDeviceMemoryProperties :: #type proc();
PFN_GetInstanceProcAddr :: #type proc();
PFN_GetDeviceProcAddr :: #type proc();
PFN_CreateDevice :: #type proc();
PFN_DestroyDevice :: #type proc();
PFN_EnumerateInstanceExtensionProperties :: #type proc();
PFN_EnumerateDeviceExtensionProperties :: #type proc();
PFN_EnumerateInstanceLayerProperties :: #type proc();
PFN_EnumerateDeviceLayerProperties :: #type proc();
PFN_GetDeviceQueue :: #type proc();
PFN_QueueSubmit :: #type proc();
PFN_QueueWaitIdle :: #type proc();
PFN_DeviceWaitIdle :: #type proc();
PFN_AllocateMemory :: #type proc();
PFN_FreeMemory :: #type proc();
PFN_MapMemory :: #type proc();
PFN_UnmapMemory :: #type proc();
PFN_FlushMappedMemoryRanges :: #type proc();
PFN_InvalidateMappedMemoryRanges :: #type proc();
PFN_GetDeviceMemoryCommitment :: #type proc();
PFN_BindBufferMemory :: #type proc();
PFN_BindImageMemory :: #type proc();
PFN_GetBufferMemoryRequirements :: #type proc();
PFN_GetImageMemoryRequirements :: #type proc();
PFN_GetImageSparseMemoryRequirements :: #type proc();
PFN_GetPhysicalDeviceSparseImageFormatProperties :: #type proc();
PFN_QueueBindSparse :: #type proc();
PFN_CreateFence :: #type proc();
PFN_DestroyFence :: #type proc();
PFN_ResetFences :: #type proc();
PFN_GetFenceStatus :: #type proc();
PFN_WaitForFences :: #type proc();
PFN_CreateSemaphore :: #type proc();
PFN_DestroySemaphore :: #type proc();
PFN_CreateEvent :: #type proc();
PFN_DestroyEvent :: #type proc();
PFN_GetEventStatus :: #type proc();
PFN_SetEvent :: #type proc();
PFN_ResetEvent :: #type proc();
PFN_CreateQueryPool :: #type proc();
PFN_DestroyQueryPool :: #type proc();
PFN_GetQueryPoolResults :: #type proc();
PFN_CreateBuffer :: #type proc();
PFN_DestroyBuffer :: #type proc();
PFN_CreateBufferView :: #type proc();
PFN_DestroyBufferView :: #type proc();
PFN_CreateImage :: #type proc();
PFN_DestroyImage :: #type proc();
PFN_GetImageSubresourceLayout :: #type proc();
PFN_CreateImageView :: #type proc();
PFN_DestroyImageView :: #type proc();
PFN_CreateShaderModule :: #type proc();
PFN_DestroyShaderModule :: #type proc();
PFN_CreatePipelineCache :: #type proc();
PFN_DestroyPipelineCache :: #type proc();
PFN_GetPipelineCacheData :: #type proc();
PFN_MergePipelineCaches :: #type proc();
PFN_CreateGraphicsPipelines :: #type proc();
PFN_CreateComputePipelines :: #type proc();
PFN_DestroyPipeline :: #type proc();
PFN_CreatePipelineLayout :: #type proc();
PFN_DestroyPipelineLayout :: #type proc();
PFN_CreateSampler :: #type proc();
PFN_DestroySampler :: #type proc();
PFN_CreateDescriptorSetLayout :: #type proc();
PFN_DestroyDescriptorSetLayout :: #type proc();
PFN_CreateDescriptorPool :: #type proc();
PFN_DestroyDescriptorPool :: #type proc();
PFN_ResetDescriptorPool :: #type proc();
PFN_AllocateDescriptorSets :: #type proc();
PFN_FreeDescriptorSets :: #type proc();
PFN_UpdateDescriptorSets :: #type proc();
PFN_CreateFramebuffer :: #type proc();
PFN_DestroyFramebuffer :: #type proc();
PFN_CreateRenderPass :: #type proc();
PFN_DestroyRenderPass :: #type proc();
PFN_GetRenderAreaGranularity :: #type proc();
PFN_CreateCommandPool :: #type proc();
PFN_DestroyCommandPool :: #type proc();
PFN_ResetCommandPool :: #type proc();
PFN_AllocateCommandBuffers :: #type proc();
PFN_FreeCommandBuffers :: #type proc();
PFN_BeginCommandBuffer :: #type proc();
PFN_EndCommandBuffer :: #type proc();
PFN_ResetCommandBuffer :: #type proc();
PFN_CmdBindPipeline :: #type proc();
PFN_CmdSetViewport :: #type proc();
PFN_CmdSetScissor :: #type proc();
PFN_CmdSetLineWidth :: #type proc();
PFN_CmdSetDepthBias :: #type proc();
PFN_CmdSetBlendConstants :: #type proc();
PFN_CmdSetDepthBounds :: #type proc();
PFN_CmdSetStencilCompareMask :: #type proc();
PFN_CmdSetStencilWriteMask :: #type proc();
PFN_CmdSetStencilReference :: #type proc();
PFN_CmdBindDescriptorSets :: #type proc();
PFN_CmdBindIndexBuffer :: #type proc();
PFN_CmdBindVertexBuffers :: #type proc();
PFN_CmdDraw :: #type proc();
PFN_CmdDrawIndexed :: #type proc();
PFN_CmdDrawIndirect :: #type proc();
PFN_CmdDrawIndexedIndirect :: #type proc();
PFN_CmdDispatch :: #type proc();
PFN_CmdDispatchIndirect :: #type proc();
PFN_CmdCopyBuffer :: #type proc();
PFN_CmdCopyImage :: #type proc();
PFN_CmdBlitImage :: #type proc();
PFN_CmdCopyBufferToImage :: #type proc();
PFN_CmdCopyImageToBuffer :: #type proc();
PFN_CmdUpdateBuffer :: #type proc();
PFN_CmdFillBuffer :: #type proc();
PFN_CmdClearColorImage :: #type proc();
PFN_CmdClearDepthStencilImage :: #type proc();
PFN_CmdClearAttachments :: #type proc();
PFN_CmdResolveImage :: #type proc();
PFN_CmdSetEvent :: #type proc();
PFN_CmdResetEvent :: #type proc();
PFN_CmdWaitEvents :: #type proc();
PFN_CmdPipelineBarrier :: #type proc();
PFN_CmdBeginQuery :: #type proc();
PFN_CmdEndQuery :: #type proc();
PFN_CmdResetQueryPool :: #type proc();
PFN_CmdWriteTimestamp :: #type proc();
PFN_CmdCopyQueryPoolResults :: #type proc();
PFN_CmdPushConstants :: #type proc();
PFN_CmdBeginRenderPass :: #type proc();
PFN_CmdNextSubpass :: #type proc();
PFN_CmdEndRenderPass :: #type proc();
PFN_CmdExecuteCommands :: #type proc();
SamplerYcbcrConversion :: ^SamplerYcbcrConversionT;
DescriptorUpdateTemplate :: ^DescriptorUpdateTemplateT;
SubgroupFeatureFlags :: Flags;
PeerMemoryFeatureFlags :: Flags;
MemoryAllocateFlags :: Flags;
CommandPoolTrimFlags :: Flags;
DescriptorUpdateTemplateCreateFlags :: Flags;
ExternalMemoryHandleTypeFlags :: Flags;
ExternalMemoryFeatureFlags :: Flags;
ExternalFenceHandleTypeFlags :: Flags;
ExternalFenceFeatureFlags :: Flags;
FenceImportFlags :: Flags;
SemaphoreImportFlags :: Flags;
ExternalSemaphoreHandleTypeFlags :: Flags;
ExternalSemaphoreFeatureFlags :: Flags;
MemoryRequirements2KHR :: MemoryRequirements2;
PhysicalDeviceVariablePointerFeatures :: PhysicalDeviceVariablePointersFeatures;
PhysicalDeviceShaderDrawParameterFeatures :: PhysicalDeviceShaderDrawParametersFeatures;
PFN_EnumerateInstanceVersion :: #type proc();
PFN_BindBufferMemory2 :: #type proc();
PFN_BindImageMemory2 :: #type proc();
PFN_GetDeviceGroupPeerMemoryFeatures :: #type proc();
PFN_CmdSetDeviceMask :: #type proc();
PFN_CmdDispatchBase :: #type proc();
PFN_EnumeratePhysicalDeviceGroups :: #type proc();
PFN_GetImageMemoryRequirements2 :: #type proc();
PFN_GetBufferMemoryRequirements2 :: #type proc();
PFN_GetImageSparseMemoryRequirements2 :: #type proc();
PFN_GetPhysicalDeviceFeatures2 :: #type proc();
PFN_GetPhysicalDeviceProperties2 :: #type proc();
PFN_GetPhysicalDeviceFormatProperties2 :: #type proc();
PFN_GetPhysicalDeviceImageFormatProperties2 :: #type proc();
PFN_GetPhysicalDeviceQueueFamilyProperties2 :: #type proc();
PFN_GetPhysicalDeviceMemoryProperties2 :: #type proc();
PFN_GetPhysicalDeviceSparseImageFormatProperties2 :: #type proc();
PFN_TrimCommandPool :: #type proc();
PFN_GetDeviceQueue2 :: #type proc();
PFN_CreateSamplerYcbcrConversion :: #type proc();
PFN_DestroySamplerYcbcrConversion :: #type proc();
PFN_CreateDescriptorUpdateTemplate :: #type proc();
PFN_DestroyDescriptorUpdateTemplate :: #type proc();
PFN_UpdateDescriptorSetWithTemplate :: #type proc();
PFN_GetPhysicalDeviceExternalBufferProperties :: #type proc();
PFN_GetPhysicalDeviceExternalFenceProperties :: #type proc();
PFN_GetPhysicalDeviceExternalSemaphoreProperties :: #type proc();
PFN_GetDescriptorSetLayoutSupport :: #type proc();
DeviceAddress :: u64;
ResolveModeFlags :: Flags;
DescriptorBindingFlags :: Flags;
SemaphoreWaitFlags :: Flags;
PFN_CmdDrawIndirectCount :: #type proc();
PFN_CmdDrawIndexedIndirectCount :: #type proc();
PFN_CreateRenderPass2 :: #type proc();
PFN_CmdBeginRenderPass2 :: #type proc();
PFN_CmdNextSubpass2 :: #type proc();
PFN_CmdEndRenderPass2 :: #type proc();
PFN_ResetQueryPool :: #type proc();
PFN_GetSemaphoreCounterValue :: #type proc();
PFN_WaitSemaphores :: #type proc();
PFN_SignalSemaphore :: #type proc();
PFN_GetBufferDeviceAddress :: #type proc();
PFN_GetBufferOpaqueCaptureAddress :: #type proc();
PFN_GetDeviceMemoryOpaqueCaptureAddress :: #type proc();
SurfaceKHR :: ^SurfaceKHRT;
SurfaceTransformFlagsKHR :: Flags;
CompositeAlphaFlagsKHR :: Flags;
PFN_DestroySurfaceKHR :: #type proc();
PFN_GetPhysicalDeviceSurfaceSupportKHR :: #type proc();
PFN_GetPhysicalDeviceSurfaceCapabilitiesKHR :: #type proc();
PFN_GetPhysicalDeviceSurfaceFormatsKHR :: #type proc();
PFN_GetPhysicalDeviceSurfacePresentModesKHR :: #type proc();
SwapchainKHR :: ^SwapchainKHRT;
SwapchainCreateFlagsKHR :: Flags;
DeviceGroupPresentModeFlagsKHR :: Flags;
PFN_CreateSwapchainKHR :: #type proc();
PFN_DestroySwapchainKHR :: #type proc();
PFN_GetSwapchainImagesKHR :: #type proc();
PFN_AcquireNextImageKHR :: #type proc();
PFN_QueuePresentKHR :: #type proc();
PFN_GetDeviceGroupPresentCapabilitiesKHR :: #type proc();
PFN_GetDeviceGroupSurfacePresentModesKHR :: #type proc();
PFN_GetPhysicalDevicePresentRectanglesKHR :: #type proc();
PFN_AcquireNextImage2KHR :: #type proc();
DisplayKHR :: ^DisplayKHRT;
DisplayModeKHR :: ^DisplayModeKHRT;
DisplayPlaneAlphaFlagsKHR :: Flags;
DisplayModeCreateFlagsKHR :: Flags;
DisplaySurfaceCreateFlagsKHR :: Flags;
PFN_GetPhysicalDeviceDisplayPropertiesKHR :: #type proc();
PFN_GetPhysicalDeviceDisplayPlanePropertiesKHR :: #type proc();
PFN_GetDisplayPlaneSupportedDisplaysKHR :: #type proc();
PFN_GetDisplayModePropertiesKHR :: #type proc();
PFN_CreateDisplayModeKHR :: #type proc();
PFN_GetDisplayPlaneCapabilitiesKHR :: #type proc();
PFN_CreateDisplayPlaneSurfaceKHR :: #type proc();
PFN_CreateSharedSwapchainsKHR :: #type proc();
RenderPassMultiviewCreateInfoKHR :: RenderPassMultiviewCreateInfo;
PhysicalDeviceMultiviewFeaturesKHR :: PhysicalDeviceMultiviewFeatures;
PhysicalDeviceMultiviewPropertiesKHR :: PhysicalDeviceMultiviewProperties;
PhysicalDeviceFeatures2KHR :: PhysicalDeviceFeatures2;
PhysicalDeviceProperties2KHR :: PhysicalDeviceProperties2;
FormatProperties2KHR :: FormatProperties2;
ImageFormatProperties2KHR :: ImageFormatProperties2;
PhysicalDeviceImageFormatInfo2KHR :: PhysicalDeviceImageFormatInfo2;
QueueFamilyProperties2KHR :: QueueFamilyProperties2;
PhysicalDeviceMemoryProperties2KHR :: PhysicalDeviceMemoryProperties2;
SparseImageFormatProperties2KHR :: SparseImageFormatProperties2;
PhysicalDeviceSparseImageFormatInfo2KHR :: PhysicalDeviceSparseImageFormatInfo2;
PFN_GetPhysicalDeviceFeatures2KHR :: #type proc();
PFN_GetPhysicalDeviceProperties2KHR :: #type proc();
PFN_GetPhysicalDeviceFormatProperties2KHR :: #type proc();
PFN_GetPhysicalDeviceImageFormatProperties2KHR :: #type proc();
PFN_GetPhysicalDeviceQueueFamilyProperties2KHR :: #type proc();
PFN_GetPhysicalDeviceMemoryProperties2KHR :: #type proc();
PFN_GetPhysicalDeviceSparseImageFormatProperties2KHR :: #type proc();
PeerMemoryFeatureFlagsKHR :: PeerMemoryFeatureFlags;
PeerMemoryFeatureFlagBitsKHR :: PeerMemoryFeatureFlagBits;
MemoryAllocateFlagsKHR :: MemoryAllocateFlags;
MemoryAllocateFlagBitsKHR :: MemoryAllocateFlagBits;
MemoryAllocateFlagsInfoKHR :: MemoryAllocateFlagsInfo;
DeviceGroupRenderPassBeginInfoKHR :: DeviceGroupRenderPassBeginInfo;
DeviceGroupCommandBufferBeginInfoKHR :: DeviceGroupCommandBufferBeginInfo;
DeviceGroupSubmitInfoKHR :: DeviceGroupSubmitInfo;
DeviceGroupBindSparseInfoKHR :: DeviceGroupBindSparseInfo;
BindBufferMemoryDeviceGroupInfoKHR :: BindBufferMemoryDeviceGroupInfo;
BindImageMemoryDeviceGroupInfoKHR :: BindImageMemoryDeviceGroupInfo;
PFN_GetDeviceGroupPeerMemoryFeaturesKHR :: #type proc();
PFN_CmdSetDeviceMaskKHR :: #type proc();
PFN_CmdDispatchBaseKHR :: #type proc();
CommandPoolTrimFlagsKHR :: CommandPoolTrimFlags;
PFN_TrimCommandPoolKHR :: #type proc();
PhysicalDeviceGroupPropertiesKHR :: PhysicalDeviceGroupProperties;
DeviceGroupDeviceCreateInfoKHR :: DeviceGroupDeviceCreateInfo;
PFN_EnumeratePhysicalDeviceGroupsKHR :: #type proc();
ExternalMemoryHandleTypeFlagsKHR :: ExternalMemoryHandleTypeFlags;
ExternalMemoryHandleTypeFlagBitsKHR :: ExternalMemoryHandleTypeFlagBits;
ExternalMemoryFeatureFlagsKHR :: ExternalMemoryFeatureFlags;
ExternalMemoryFeatureFlagBitsKHR :: ExternalMemoryFeatureFlagBits;
ExternalMemoryPropertiesKHR :: ExternalMemoryProperties;
PhysicalDeviceExternalImageFormatInfoKHR :: PhysicalDeviceExternalImageFormatInfo;
ExternalImageFormatPropertiesKHR :: ExternalImageFormatProperties;
PhysicalDeviceExternalBufferInfoKHR :: PhysicalDeviceExternalBufferInfo;
ExternalBufferPropertiesKHR :: ExternalBufferProperties;
PhysicalDeviceIDPropertiesKHR :: PhysicalDeviceIDProperties;
PFN_GetPhysicalDeviceExternalBufferPropertiesKHR :: #type proc();
ExternalMemoryImageCreateInfoKHR :: ExternalMemoryImageCreateInfo;
ExternalMemoryBufferCreateInfoKHR :: ExternalMemoryBufferCreateInfo;
ExportMemoryAllocateInfoKHR :: ExportMemoryAllocateInfo;
PFN_GetMemoryFdKHR :: #type proc();
PFN_GetMemoryFdPropertiesKHR :: #type proc();
ExternalSemaphoreHandleTypeFlagsKHR :: ExternalSemaphoreHandleTypeFlags;
ExternalSemaphoreHandleTypeFlagBitsKHR :: ExternalSemaphoreHandleTypeFlagBits;
ExternalSemaphoreFeatureFlagsKHR :: ExternalSemaphoreFeatureFlags;
ExternalSemaphoreFeatureFlagBitsKHR :: ExternalSemaphoreFeatureFlagBits;
PhysicalDeviceExternalSemaphoreInfoKHR :: PhysicalDeviceExternalSemaphoreInfo;
ExternalSemaphorePropertiesKHR :: ExternalSemaphoreProperties;
PFN_GetPhysicalDeviceExternalSemaphorePropertiesKHR :: #type proc();
SemaphoreImportFlagsKHR :: SemaphoreImportFlags;
SemaphoreImportFlagBitsKHR :: SemaphoreImportFlagBits;
ExportSemaphoreCreateInfoKHR :: ExportSemaphoreCreateInfo;
PFN_ImportSemaphoreFdKHR :: #type proc();
PFN_GetSemaphoreFdKHR :: #type proc();
PFN_CmdPushDescriptorSetKHR :: #type proc();
PFN_CmdPushDescriptorSetWithTemplateKHR :: #type proc();
PhysicalDeviceShaderFloat16Int8FeaturesKHR :: PhysicalDeviceShaderFloat16Int8Features;
PhysicalDeviceFloat16Int8FeaturesKHR :: PhysicalDeviceShaderFloat16Int8Features;
PhysicalDevice16BitStorageFeaturesKHR :: PhysicalDevice16BitStorageFeatures;
DescriptorUpdateTemplateKHR :: DescriptorUpdateTemplate;
DescriptorUpdateTemplateTypeKHR :: DescriptorUpdateTemplateType;
DescriptorUpdateTemplateCreateFlagsKHR :: DescriptorUpdateTemplateCreateFlags;
DescriptorUpdateTemplateEntryKHR :: DescriptorUpdateTemplateEntry;
DescriptorUpdateTemplateCreateInfoKHR :: DescriptorUpdateTemplateCreateInfo;
PFN_CreateDescriptorUpdateTemplateKHR :: #type proc();
PFN_DestroyDescriptorUpdateTemplateKHR :: #type proc();
PFN_UpdateDescriptorSetWithTemplateKHR :: #type proc();
PhysicalDeviceImagelessFramebufferFeaturesKHR :: PhysicalDeviceImagelessFramebufferFeatures;
FramebufferAttachmentsCreateInfoKHR :: FramebufferAttachmentsCreateInfo;
FramebufferAttachmentImageInfoKHR :: FramebufferAttachmentImageInfo;
RenderPassAttachmentBeginInfoKHR :: RenderPassAttachmentBeginInfo;
RenderPassCreateInfo2KHR :: RenderPassCreateInfo2;
AttachmentDescription2KHR :: AttachmentDescription2;
AttachmentReference2KHR :: AttachmentReference2;
SubpassDescription2KHR :: SubpassDescription2;
SubpassDependency2KHR :: SubpassDependency2;
SubpassBeginInfoKHR :: SubpassBeginInfo;
SubpassEndInfoKHR :: SubpassEndInfo;
PFN_CreateRenderPass2KHR :: #type proc();
PFN_CmdBeginRenderPass2KHR :: #type proc();
PFN_CmdNextSubpass2KHR :: #type proc();
PFN_CmdEndRenderPass2KHR :: #type proc();
PFN_GetSwapchainStatusKHR :: #type proc();
ExternalFenceHandleTypeFlagsKHR :: ExternalFenceHandleTypeFlags;
ExternalFenceHandleTypeFlagBitsKHR :: ExternalFenceHandleTypeFlagBits;
ExternalFenceFeatureFlagsKHR :: ExternalFenceFeatureFlags;
ExternalFenceFeatureFlagBitsKHR :: ExternalFenceFeatureFlagBits;
PhysicalDeviceExternalFenceInfoKHR :: PhysicalDeviceExternalFenceInfo;
ExternalFencePropertiesKHR :: ExternalFenceProperties;
PFN_GetPhysicalDeviceExternalFencePropertiesKHR :: #type proc();
FenceImportFlagsKHR :: FenceImportFlags;
FenceImportFlagBitsKHR :: FenceImportFlagBits;
ExportFenceCreateInfoKHR :: ExportFenceCreateInfo;
PFN_ImportFenceFdKHR :: #type proc();
PFN_GetFenceFdKHR :: #type proc();
PerformanceCounterDescriptionFlagsKHR :: Flags;
AcquireProfilingLockFlagsKHR :: Flags;
PFN_EnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR :: #type proc();
PFN_GetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR :: #type proc();
PFN_AcquireProfilingLockKHR :: #type proc();
PFN_ReleaseProfilingLockKHR :: #type proc();
PointClippingBehaviorKHR :: PointClippingBehavior;
TessellationDomainOriginKHR :: TessellationDomainOrigin;
PhysicalDevicePointClippingPropertiesKHR :: PhysicalDevicePointClippingProperties;
RenderPassInputAttachmentAspectCreateInfoKHR :: RenderPassInputAttachmentAspectCreateInfo;
InputAttachmentAspectReferenceKHR :: InputAttachmentAspectReference;
ImageViewUsageCreateInfoKHR :: ImageViewUsageCreateInfo;
PipelineTessellationDomainOriginStateCreateInfoKHR :: PipelineTessellationDomainOriginStateCreateInfo;
PFN_GetPhysicalDeviceSurfaceCapabilities2KHR :: #type proc();
PFN_GetPhysicalDeviceSurfaceFormats2KHR :: #type proc();
PhysicalDeviceVariablePointerFeaturesKHR :: PhysicalDeviceVariablePointersFeatures;
PhysicalDeviceVariablePointersFeaturesKHR :: PhysicalDeviceVariablePointersFeatures;
PFN_GetPhysicalDeviceDisplayProperties2KHR :: #type proc();
PFN_GetPhysicalDeviceDisplayPlaneProperties2KHR :: #type proc();
PFN_GetDisplayModeProperties2KHR :: #type proc();
PFN_GetDisplayPlaneCapabilities2KHR :: #type proc();
MemoryDedicatedRequirementsKHR :: MemoryDedicatedRequirements;
MemoryDedicatedAllocateInfoKHR :: MemoryDedicatedAllocateInfo;
BufferMemoryRequirementsInfo2KHR :: BufferMemoryRequirementsInfo2;
ImageMemoryRequirementsInfo2KHR :: ImageMemoryRequirementsInfo2;
ImageSparseMemoryRequirementsInfo2KHR :: ImageSparseMemoryRequirementsInfo2;
SparseImageMemoryRequirements2KHR :: SparseImageMemoryRequirements2;
PFN_GetImageMemoryRequirements2KHR :: #type proc();
PFN_GetBufferMemoryRequirements2KHR :: #type proc();
PFN_GetImageSparseMemoryRequirements2KHR :: #type proc();
ImageFormatListCreateInfoKHR :: ImageFormatListCreateInfo;
SamplerYcbcrConversionKHR :: SamplerYcbcrConversion;
SamplerYcbcrModelConversionKHR :: SamplerYcbcrModelConversion;
SamplerYcbcrRangeKHR :: SamplerYcbcrRange;
ChromaLocationKHR :: ChromaLocation;
SamplerYcbcrConversionCreateInfoKHR :: SamplerYcbcrConversionCreateInfo;
SamplerYcbcrConversionInfoKHR :: SamplerYcbcrConversionInfo;
BindImagePlaneMemoryInfoKHR :: BindImagePlaneMemoryInfo;
ImagePlaneMemoryRequirementsInfoKHR :: ImagePlaneMemoryRequirementsInfo;
PhysicalDeviceSamplerYcbcrConversionFeaturesKHR :: PhysicalDeviceSamplerYcbcrConversionFeatures;
SamplerYcbcrConversionImageFormatPropertiesKHR :: SamplerYcbcrConversionImageFormatProperties;
PFN_CreateSamplerYcbcrConversionKHR :: #type proc();
PFN_DestroySamplerYcbcrConversionKHR :: #type proc();
BindBufferMemoryInfoKHR :: BindBufferMemoryInfo;
BindImageMemoryInfoKHR :: BindImageMemoryInfo;
PFN_BindBufferMemory2KHR :: #type proc();
PFN_BindImageMemory2KHR :: #type proc();
PhysicalDeviceMaintenance3PropertiesKHR :: PhysicalDeviceMaintenance3Properties;
DescriptorSetLayoutSupportKHR :: DescriptorSetLayoutSupport;
PFN_GetDescriptorSetLayoutSupportKHR :: #type proc();
PFN_CmdDrawIndirectCountKHR :: #type proc();
PFN_CmdDrawIndexedIndirectCountKHR :: #type proc();
PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR :: PhysicalDeviceShaderSubgroupExtendedTypesFeatures;
PhysicalDevice8BitStorageFeaturesKHR :: PhysicalDevice8BitStorageFeatures;
PhysicalDeviceShaderAtomicInt64FeaturesKHR :: PhysicalDeviceShaderAtomicInt64Features;
DriverIdKHR :: DriverId;
ConformanceVersionKHR :: ConformanceVersion;
PhysicalDeviceDriverPropertiesKHR :: PhysicalDeviceDriverProperties;
ShaderFloatControlsIndependenceKHR :: ShaderFloatControlsIndependence;
PhysicalDeviceFloatControlsPropertiesKHR :: PhysicalDeviceFloatControlsProperties;
ResolveModeFlagBitsKHR :: ResolveModeFlagBits;
ResolveModeFlagsKHR :: ResolveModeFlags;
SubpassDescriptionDepthStencilResolveKHR :: SubpassDescriptionDepthStencilResolve;
PhysicalDeviceDepthStencilResolvePropertiesKHR :: PhysicalDeviceDepthStencilResolveProperties;
SemaphoreTypeKHR :: SemaphoreType;
SemaphoreWaitFlagBitsKHR :: SemaphoreWaitFlagBits;
SemaphoreWaitFlagsKHR :: SemaphoreWaitFlags;
PhysicalDeviceTimelineSemaphoreFeaturesKHR :: PhysicalDeviceTimelineSemaphoreFeatures;
PhysicalDeviceTimelineSemaphorePropertiesKHR :: PhysicalDeviceTimelineSemaphoreProperties;
SemaphoreTypeCreateInfoKHR :: SemaphoreTypeCreateInfo;
TimelineSemaphoreSubmitInfoKHR :: TimelineSemaphoreSubmitInfo;
SemaphoreWaitInfoKHR :: SemaphoreWaitInfo;
SemaphoreSignalInfoKHR :: SemaphoreSignalInfo;
PFN_GetSemaphoreCounterValueKHR :: #type proc();
PFN_WaitSemaphoresKHR :: #type proc();
PFN_SignalSemaphoreKHR :: #type proc();
PhysicalDeviceVulkanMemoryModelFeaturesKHR :: PhysicalDeviceVulkanMemoryModelFeatures;
PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR :: PhysicalDeviceSeparateDepthStencilLayoutsFeatures;
AttachmentReferenceStencilLayoutKHR :: AttachmentReferenceStencilLayout;
AttachmentDescriptionStencilLayoutKHR :: AttachmentDescriptionStencilLayout;
PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR :: PhysicalDeviceUniformBufferStandardLayoutFeatures;
PhysicalDeviceBufferDeviceAddressFeaturesKHR :: PhysicalDeviceBufferDeviceAddressFeatures;
BufferDeviceAddressInfoKHR :: BufferDeviceAddressInfo;
BufferOpaqueCaptureAddressCreateInfoKHR :: BufferOpaqueCaptureAddressCreateInfo;
MemoryOpaqueCaptureAddressAllocateInfoKHR :: MemoryOpaqueCaptureAddressAllocateInfo;
DeviceMemoryOpaqueCaptureAddressInfoKHR :: DeviceMemoryOpaqueCaptureAddressInfo;
PFN_GetBufferDeviceAddressKHR :: #type proc();
PFN_GetBufferOpaqueCaptureAddressKHR :: #type proc();
PFN_GetDeviceMemoryOpaqueCaptureAddressKHR :: #type proc();
PFN_GetPipelineExecutablePropertiesKHR :: #type proc();
PFN_GetPipelineExecutableStatisticsKHR :: #type proc();
PFN_GetPipelineExecutableInternalRepresentationsKHR :: #type proc();
DebugReportCallbackEXT :: ^DebugReportCallbackEXTT;
DebugReportFlagsEXT :: Flags;
PFN_DebugReportCallbackEXT :: #type proc();
PFN_CreateDebugReportCallbackEXT :: #type proc();
PFN_DestroyDebugReportCallbackEXT :: #type proc();
PFN_DebugReportMessageEXT :: #type proc();
PFN_DebugMarkerSetObjectTagEXT :: #type proc();
PFN_DebugMarkerSetObjectNameEXT :: #type proc();
PFN_CmdDebugMarkerBeginEXT :: #type proc();
PFN_CmdDebugMarkerEndEXT :: #type proc();
PFN_CmdDebugMarkerInsertEXT :: #type proc();
PipelineRasterizationStateStreamCreateFlagsEXT :: Flags;
PFN_CmdBindTransformFeedbackBuffersEXT :: #type proc();
PFN_CmdBeginTransformFeedbackEXT :: #type proc();
PFN_CmdEndTransformFeedbackEXT :: #type proc();
PFN_CmdBeginQueryIndexedEXT :: #type proc();
PFN_CmdEndQueryIndexedEXT :: #type proc();
PFN_CmdDrawIndirectByteCountEXT :: #type proc();
PFN_GetImageViewHandleNVX :: #type proc();
PFN_GetImageViewAddressNVX :: #type proc();
PFN_CmdDrawIndirectCountAMD :: #type proc();
PFN_CmdDrawIndexedIndirectCountAMD :: #type proc();
PFN_GetShaderInfoAMD :: #type proc();
ExternalMemoryHandleTypeFlagsNV :: Flags;
ExternalMemoryFeatureFlagsNV :: Flags;
PFN_GetPhysicalDeviceExternalImageFormatPropertiesNV :: #type proc();
ConditionalRenderingFlagsEXT :: Flags;
PFN_CmdBeginConditionalRenderingEXT :: #type proc();
PFN_CmdEndConditionalRenderingEXT :: #type proc();
PFN_CmdSetViewportWScalingNV :: #type proc();
PFN_ReleaseDisplayEXT :: #type proc();
SurfaceCounterFlagsEXT :: Flags;
PFN_GetPhysicalDeviceSurfaceCapabilities2EXT :: #type proc();
PFN_DisplayPowerControlEXT :: #type proc();
PFN_RegisterDeviceEventEXT :: #type proc();
PFN_RegisterDisplayEventEXT :: #type proc();
PFN_GetSwapchainCounterEXT :: #type proc();
PFN_GetRefreshCycleDurationGOOGLE :: #type proc();
PFN_GetPastPresentationTimingGOOGLE :: #type proc();
PipelineViewportSwizzleStateCreateFlagsNV :: Flags;
PipelineDiscardRectangleStateCreateFlagsEXT :: Flags;
PFN_CmdSetDiscardRectangleEXT :: #type proc();
PipelineRasterizationConservativeStateCreateFlagsEXT :: Flags;
PipelineRasterizationDepthClipStateCreateFlagsEXT :: Flags;
PFN_SetHdrMetadataEXT :: #type proc();
DebugUtilsMessengerEXT :: ^DebugUtilsMessengerEXTT;
DebugUtilsMessengerCallbackDataFlagsEXT :: Flags;
DebugUtilsMessageTypeFlagsEXT :: Flags;
DebugUtilsMessengerCreateFlagsEXT :: Flags;
DebugUtilsMessageSeverityFlagsEXT :: Flags;
PFN_DebugUtilsMessengerCallbackEXT :: #type proc();
PFN_SetDebugUtilsObjectNameEXT :: #type proc();
PFN_SetDebugUtilsObjectTagEXT :: #type proc();
PFN_QueueBeginDebugUtilsLabelEXT :: #type proc();
PFN_QueueEndDebugUtilsLabelEXT :: #type proc();
PFN_QueueInsertDebugUtilsLabelEXT :: #type proc();
PFN_CmdBeginDebugUtilsLabelEXT :: #type proc();
PFN_CmdEndDebugUtilsLabelEXT :: #type proc();
PFN_CmdInsertDebugUtilsLabelEXT :: #type proc();
PFN_CreateDebugUtilsMessengerEXT :: #type proc();
PFN_DestroyDebugUtilsMessengerEXT :: #type proc();
PFN_SubmitDebugUtilsMessageEXT :: #type proc();
SamplerReductionModeEXT :: SamplerReductionMode;
SamplerReductionModeCreateInfoEXT :: SamplerReductionModeCreateInfo;
PhysicalDeviceSamplerFilterMinmaxPropertiesEXT :: PhysicalDeviceSamplerFilterMinmaxProperties;
PFN_CmdSetSampleLocationsEXT :: #type proc();
PFN_GetPhysicalDeviceMultisamplePropertiesEXT :: #type proc();
PipelineCoverageToColorStateCreateFlagsNV :: Flags;
PipelineCoverageModulationStateCreateFlagsNV :: Flags;
PFN_GetImageDrmFormatModifierPropertiesEXT :: #type proc();
ValidationCacheEXT :: ^ValidationCacheEXTT;
ValidationCacheCreateFlagsEXT :: Flags;
PFN_CreateValidationCacheEXT :: #type proc();
PFN_DestroyValidationCacheEXT :: #type proc();
PFN_MergeValidationCachesEXT :: #type proc();
PFN_GetValidationCacheDataEXT :: #type proc();
DescriptorBindingFlagBitsEXT :: DescriptorBindingFlagBits;
DescriptorBindingFlagsEXT :: DescriptorBindingFlags;
DescriptorSetLayoutBindingFlagsCreateInfoEXT :: DescriptorSetLayoutBindingFlagsCreateInfo;
PhysicalDeviceDescriptorIndexingFeaturesEXT :: PhysicalDeviceDescriptorIndexingFeatures;
PhysicalDeviceDescriptorIndexingPropertiesEXT :: PhysicalDeviceDescriptorIndexingProperties;
DescriptorSetVariableDescriptorCountAllocateInfoEXT :: DescriptorSetVariableDescriptorCountAllocateInfo;
DescriptorSetVariableDescriptorCountLayoutSupportEXT :: DescriptorSetVariableDescriptorCountLayoutSupport;
PFN_CmdBindShadingRateImageNV :: #type proc();
PFN_CmdSetViewportShadingRatePaletteNV :: #type proc();
PFN_CmdSetCoarseSampleOrderNV :: #type proc();
AccelerationStructureKHR :: ^AccelerationStructureKHRT;
AccelerationStructureNV :: AccelerationStructureKHR;
RayTracingShaderGroupTypeNV :: RayTracingShaderGroupTypeKHR;
GeometryTypeNV :: GeometryTypeKHR;
AccelerationStructureTypeNV :: AccelerationStructureTypeKHR;
CopyAccelerationStructureModeNV :: CopyAccelerationStructureModeKHR;
AccelerationStructureMemoryRequirementsTypeNV :: AccelerationStructureMemoryRequirementsTypeKHR;
GeometryFlagsKHR :: Flags;
GeometryFlagsNV :: GeometryFlagsKHR;
GeometryFlagBitsNV :: GeometryFlagBitsKHR;
GeometryInstanceFlagsKHR :: Flags;
GeometryInstanceFlagsNV :: GeometryInstanceFlagsKHR;
GeometryInstanceFlagBitsNV :: GeometryInstanceFlagBitsKHR;
BuildAccelerationStructureFlagsKHR :: Flags;
BuildAccelerationStructureFlagsNV :: BuildAccelerationStructureFlagsKHR;
BuildAccelerationStructureFlagBitsNV :: BuildAccelerationStructureFlagBitsKHR;
BindAccelerationStructureMemoryInfoNV :: BindAccelerationStructureMemoryInfoKHR;
WriteDescriptorSetAccelerationStructureNV :: WriteDescriptorSetAccelerationStructureKHR;
TransformMatrixNV :: TransformMatrixKHR;
AabbPositionsNV :: AabbPositionsKHR;
AccelerationStructureInstanceNV :: AccelerationStructureInstanceKHR;
PFN_CreateAccelerationStructureNV :: #type proc();
PFN_DestroyAccelerationStructureKHR :: #type proc();
PFN_DestroyAccelerationStructureNV :: #type proc();
PFN_GetAccelerationStructureMemoryRequirementsNV :: #type proc();
PFN_BindAccelerationStructureMemoryKHR :: #type proc();
PFN_BindAccelerationStructureMemoryNV :: #type proc();
PFN_CmdBuildAccelerationStructureNV :: #type proc();
PFN_CmdCopyAccelerationStructureNV :: #type proc();
PFN_CmdTraceRaysNV :: #type proc();
PFN_CreateRayTracingPipelinesNV :: #type proc();
PFN_GetRayTracingShaderGroupHandlesKHR :: #type proc();
PFN_GetRayTracingShaderGroupHandlesNV :: #type proc();
PFN_GetAccelerationStructureHandleNV :: #type proc();
PFN_CmdWriteAccelerationStructuresPropertiesKHR :: #type proc();
PFN_CmdWriteAccelerationStructuresPropertiesNV :: #type proc();
PFN_CompileDeferredNV :: #type proc();
PFN_GetMemoryHostPointerPropertiesEXT :: #type proc();
PFN_CmdWriteBufferMarkerAMD :: #type proc();
PipelineCompilerControlFlagsAMD :: Flags;
PFN_GetPhysicalDeviceCalibrateableTimeDomainsEXT :: #type proc();
PFN_GetCalibratedTimestampsEXT :: #type proc();
PipelineCreationFeedbackFlagsEXT :: Flags;
PFN_CmdDrawMeshTasksNV :: #type proc();
PFN_CmdDrawMeshTasksIndirectNV :: #type proc();
PFN_CmdDrawMeshTasksIndirectCountNV :: #type proc();
PFN_CmdSetExclusiveScissorNV :: #type proc();
PFN_CmdSetCheckpointNV :: #type proc();
PFN_GetQueueCheckpointDataNV :: #type proc();
PerformanceConfigurationINTEL :: ^PerformanceConfigurationINTELT;
QueryPoolCreateInfoINTEL :: QueryPoolPerformanceQueryCreateInfoINTEL;
PFN_InitializePerformanceApiINTEL :: #type proc();
PFN_UninitializePerformanceApiINTEL :: #type proc();
PFN_CmdSetPerformanceMarkerINTEL :: #type proc();
PFN_CmdSetPerformanceStreamMarkerINTEL :: #type proc();
PFN_CmdSetPerformanceOverrideINTEL :: #type proc();
PFN_AcquirePerformanceConfigurationINTEL :: #type proc();
PFN_ReleasePerformanceConfigurationINTEL :: #type proc();
PFN_QueueSetPerformanceConfigurationINTEL :: #type proc();
PFN_GetPerformanceParameterINTEL :: #type proc();
PFN_SetLocalDimmingAMD :: #type proc();
PhysicalDeviceScalarBlockLayoutFeaturesEXT :: PhysicalDeviceScalarBlockLayoutFeatures;
ShaderCorePropertiesFlagsAMD :: Flags;
PhysicalDeviceBufferAddressFeaturesEXT :: PhysicalDeviceBufferDeviceAddressFeaturesEXT;
BufferDeviceAddressInfoEXT :: BufferDeviceAddressInfo;
PFN_GetBufferDeviceAddressEXT :: #type proc();
ToolPurposeFlagsEXT :: Flags;
PFN_GetPhysicalDeviceToolPropertiesEXT :: #type proc();
ImageStencilUsageCreateInfoEXT :: ImageStencilUsageCreateInfo;
PFN_GetPhysicalDeviceCooperativeMatrixPropertiesNV :: #type proc();
PipelineCoverageReductionStateCreateFlagsNV :: Flags;
PFN_GetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV :: #type proc();
HeadlessSurfaceCreateFlagsEXT :: Flags;
PFN_CreateHeadlessSurfaceEXT :: #type proc();
PFN_CmdSetLineStippleEXT :: #type proc();
PhysicalDeviceHostQueryResetFeaturesEXT :: PhysicalDeviceHostQueryResetFeatures;
PFN_ResetQueryPoolEXT :: #type proc();
IndirectCommandsLayoutNV :: ^IndirectCommandsLayoutNVT;
IndirectStateFlagsNV :: Flags;
IndirectCommandsLayoutUsageFlagsNV :: Flags;
PFN_GetGeneratedCommandsMemoryRequirementsNV :: #type proc();
PFN_CmdPreprocessGeneratedCommandsNV :: #type proc();
PFN_CmdExecuteGeneratedCommandsNV :: #type proc();
PFN_CmdBindPipelineShaderGroupNV :: #type proc();
PFN_CreateIndirectCommandsLayoutNV :: #type proc();
PFN_DestroyIndirectCommandsLayoutNV :: #type proc();
PrivateDataSlotEXT :: ^PrivateDataSlotEXTT;
PrivateDataSlotCreateFlagsEXT :: Flags;
PFN_CreatePrivateDataSlotEXT :: #type proc();
PFN_DestroyPrivateDataSlotEXT :: #type proc();
PFN_SetPrivateDataEXT :: #type proc();
PFN_GetPrivateDataEXT :: #type proc();
DeviceDiagnosticsConfigFlagsNV :: Flags;

PipelineCacheHeaderVersion :: enum i32 {
    One = 1,
};

Result :: enum i32 {
    Success = 0,
    NotReady = 1,
    Timeout = 2,
    EventSet = 3,
    EventReset = 4,
    Incomplete = 5,
    ErrorOutOfHostMemory = -1,
    ErrorOutOfDeviceMemory = -2,
    ErrorInitializationFailed = -3,
    ErrorDeviceLost = -4,
    ErrorMemoryMapFailed = -5,
    ErrorLayerNotPresent = -6,
    ErrorExtensionNotPresent = -7,
    ErrorFeatureNotPresent = -8,
    ErrorIncompatibleDriver = -9,
    ErrorTooManyObjects = -10,
    ErrorFormatNotSupported = -11,
    ErrorFragmentedPool = -12,
    ErrorUnknown = -13,
    ErrorOutOfPoolMemory = -1000069000,
    ErrorInvalidExternalHandle = -1000072003,
    ErrorFragmentation = -1000161000,
    ErrorInvalidOpaqueCaptureAddress = -1000257000,
    ErrorSurfaceLostKhr = -1000000000,
    ErrorNativeWindowInUseKhr = -1000000001,
    SuboptimalKhr = 1000001003,
    ErrorOutOfDateKhr = -1000001004,
    ErrorIncompatibleDisplayKhr = -1000003001,
    ErrorValidationFailedExt = -1000011001,
    ErrorInvalidShaderNv = -1000012000,
    ErrorIncompatibleVersionKhr = -1000150000,
    ErrorInvalidDrmFormatModifierPlaneLayoutExt = -1000158000,
    ErrorNotPermittedExt = -1000174001,
    ErrorFullScreenExclusiveModeLostExt = -1000255000,
    ThreadIdleKhr = 1000268000,
    ThreadDoneKhr = 1000268001,
    OperationDeferredKhr = 1000268002,
    OperationNotDeferredKhr = 1000268003,
    PipelineCompileRequiredExt = 1000297000,
    ErrorOutOfPoolMemoryKhr = -1000069000,
    ErrorInvalidExternalHandleKhr = -1000072003,
    ErrorFragmentationExt = -1000161000,
    ErrorInvalidDeviceAddressExt = -1000257000,
    ErrorInvalidOpaqueCaptureAddressKhr = -1000257000,
    ErrorPipelineCompileRequiredExt = 1000297000,
};

StructureType :: enum i32 {
    ApplicationInfo = 0,
    InstanceCreateInfo = 1,
    DeviceQueueCreateInfo = 2,
    DeviceCreateInfo = 3,
    SubmitInfo = 4,
    MemoryAllocateInfo = 5,
    MappedMemoryRange = 6,
    BindSparseInfo = 7,
    FenceCreateInfo = 8,
    SemaphoreCreateInfo = 9,
    EventCreateInfo = 10,
    QueryPoolCreateInfo = 11,
    BufferCreateInfo = 12,
    BufferViewCreateInfo = 13,
    ImageCreateInfo = 14,
    ImageViewCreateInfo = 15,
    ShaderModuleCreateInfo = 16,
    PipelineCacheCreateInfo = 17,
    PipelineShaderStageCreateInfo = 18,
    PipelineVertexInputStateCreateInfo = 19,
    PipelineInputAssemblyStateCreateInfo = 20,
    PipelineTessellationStateCreateInfo = 21,
    PipelineViewportStateCreateInfo = 22,
    PipelineRasterizationStateCreateInfo = 23,
    PipelineMultisampleStateCreateInfo = 24,
    PipelineDepthStencilStateCreateInfo = 25,
    PipelineColorBlendStateCreateInfo = 26,
    PipelineDynamicStateCreateInfo = 27,
    GraphicsPipelineCreateInfo = 28,
    ComputePipelineCreateInfo = 29,
    PipelineLayoutCreateInfo = 30,
    SamplerCreateInfo = 31,
    DescriptorSetLayoutCreateInfo = 32,
    DescriptorPoolCreateInfo = 33,
    DescriptorSetAllocateInfo = 34,
    WriteDescriptorSet = 35,
    CopyDescriptorSet = 36,
    FramebufferCreateInfo = 37,
    RenderPassCreateInfo = 38,
    CommandPoolCreateInfo = 39,
    CommandBufferAllocateInfo = 40,
    CommandBufferInheritanceInfo = 41,
    CommandBufferBeginInfo = 42,
    RenderPassBeginInfo = 43,
    BufferMemoryBarrier = 44,
    ImageMemoryBarrier = 45,
    MemoryBarrier = 46,
    LoaderInstanceCreateInfo = 47,
    LoaderDeviceCreateInfo = 48,
    PhysicalDeviceSubgroupProperties = 1000094000,
    BindBufferMemoryInfo = 1000157000,
    BindImageMemoryInfo = 1000157001,
    PhysicalDevice16BitStorageFeatures = 1000083000,
    MemoryDedicatedRequirements = 1000127000,
    MemoryDedicatedAllocateInfo = 1000127001,
    MemoryAllocateFlagsInfo = 1000060000,
    DeviceGroupRenderPassBeginInfo = 1000060003,
    DeviceGroupCommandBufferBeginInfo = 1000060004,
    DeviceGroupSubmitInfo = 1000060005,
    DeviceGroupBindSparseInfo = 1000060006,
    BindBufferMemoryDeviceGroupInfo = 1000060013,
    BindImageMemoryDeviceGroupInfo = 1000060014,
    PhysicalDeviceGroupProperties = 1000070000,
    DeviceGroupDeviceCreateInfo = 1000070001,
    BufferMemoryRequirementsInfo2 = 1000146000,
    ImageMemoryRequirementsInfo2 = 1000146001,
    ImageSparseMemoryRequirementsInfo2 = 1000146002,
    MemoryRequirements2 = 1000146003,
    SparseImageMemoryRequirements2 = 1000146004,
    PhysicalDeviceFeatures2 = 1000059000,
    PhysicalDeviceProperties2 = 1000059001,
    FormatProperties2 = 1000059002,
    ImageFormatProperties2 = 1000059003,
    PhysicalDeviceImageFormatInfo2 = 1000059004,
    QueueFamilyProperties2 = 1000059005,
    PhysicalDeviceMemoryProperties2 = 1000059006,
    SparseImageFormatProperties2 = 1000059007,
    PhysicalDeviceSparseImageFormatInfo2 = 1000059008,
    PhysicalDevicePointClippingProperties = 1000117000,
    RenderPassInputAttachmentAspectCreateInfo = 1000117001,
    ImageViewUsageCreateInfo = 1000117002,
    PipelineTessellationDomainOriginStateCreateInfo = 1000117003,
    RenderPassMultiviewCreateInfo = 1000053000,
    PhysicalDeviceMultiviewFeatures = 1000053001,
    PhysicalDeviceMultiviewProperties = 1000053002,
    PhysicalDeviceVariablePointersFeatures = 1000120000,
    ProtectedSubmitInfo = 1000145000,
    PhysicalDeviceProtectedMemoryFeatures = 1000145001,
    PhysicalDeviceProtectedMemoryProperties = 1000145002,
    DeviceQueueInfo2 = 1000145003,
    SamplerYcbcrConversionCreateInfo = 1000156000,
    SamplerYcbcrConversionInfo = 1000156001,
    BindImagePlaneMemoryInfo = 1000156002,
    ImagePlaneMemoryRequirementsInfo = 1000156003,
    PhysicalDeviceSamplerYcbcrConversionFeatures = 1000156004,
    SamplerYcbcrConversionImageFormatProperties = 1000156005,
    DescriptorUpdateTemplateCreateInfo = 1000085000,
    PhysicalDeviceExternalImageFormatInfo = 1000071000,
    ExternalImageFormatProperties = 1000071001,
    PhysicalDeviceExternalBufferInfo = 1000071002,
    ExternalBufferProperties = 1000071003,
    PhysicalDeviceIdProperties = 1000071004,
    ExternalMemoryBufferCreateInfo = 1000072000,
    ExternalMemoryImageCreateInfo = 1000072001,
    ExportMemoryAllocateInfo = 1000072002,
    PhysicalDeviceExternalFenceInfo = 1000112000,
    ExternalFenceProperties = 1000112001,
    ExportFenceCreateInfo = 1000113000,
    ExportSemaphoreCreateInfo = 1000077000,
    PhysicalDeviceExternalSemaphoreInfo = 1000076000,
    ExternalSemaphoreProperties = 1000076001,
    PhysicalDeviceMaintenance3_properties = 1000168000,
    DescriptorSetLayoutSupport = 1000168001,
    PhysicalDeviceShaderDrawParametersFeatures = 1000063000,
    PhysicalDeviceVulkan1_1Features = 49,
    PhysicalDeviceVulkan1_1Properties = 50,
    PhysicalDeviceVulkan1_2Features = 51,
    PhysicalDeviceVulkan1_2Properties = 52,
    ImageFormatListCreateInfo = 1000147000,
    AttachmentDescription2 = 1000109000,
    AttachmentReference2 = 1000109001,
    SubpassDescription2 = 1000109002,
    SubpassDependency2 = 1000109003,
    RenderPassCreateInfo2 = 1000109004,
    SubpassBeginInfo = 1000109005,
    SubpassEndInfo = 1000109006,
    PhysicalDevice8BitStorageFeatures = 1000177000,
    PhysicalDeviceDriverProperties = 1000196000,
    PhysicalDeviceShaderAtomicInt64Features = 1000180000,
    PhysicalDeviceShaderFloat16Int8Features = 1000082000,
    PhysicalDeviceFloatControlsProperties = 1000197000,
    DescriptorSetLayoutBindingFlagsCreateInfo = 1000161000,
    PhysicalDeviceDescriptorIndexingFeatures = 1000161001,
    PhysicalDeviceDescriptorIndexingProperties = 1000161002,
    DescriptorSetVariableDescriptorCountAllocateInfo = 1000161003,
    DescriptorSetVariableDescriptorCountLayoutSupport = 1000161004,
    PhysicalDeviceDepthStencilResolveProperties = 1000199000,
    SubpassDescriptionDepthStencilResolve = 1000199001,
    PhysicalDeviceScalarBlockLayoutFeatures = 1000221000,
    ImageStencilUsageCreateInfo = 1000246000,
    PhysicalDeviceSamplerFilterMinmaxProperties = 1000130000,
    SamplerReductionModeCreateInfo = 1000130001,
    PhysicalDeviceVulkanMemoryModelFeatures = 1000211000,
    PhysicalDeviceImagelessFramebufferFeatures = 1000108000,
    FramebufferAttachmentsCreateInfo = 1000108001,
    FramebufferAttachmentImageInfo = 1000108002,
    RenderPassAttachmentBeginInfo = 1000108003,
    PhysicalDeviceUniformBufferStandardLayoutFeatures = 1000253000,
    PhysicalDeviceShaderSubgroupExtendedTypesFeatures = 1000175000,
    PhysicalDeviceSeparateDepthStencilLayoutsFeatures = 1000241000,
    AttachmentReferenceStencilLayout = 1000241001,
    AttachmentDescriptionStencilLayout = 1000241002,
    PhysicalDeviceHostQueryResetFeatures = 1000261000,
    PhysicalDeviceTimelineSemaphoreFeatures = 1000207000,
    PhysicalDeviceTimelineSemaphoreProperties = 1000207001,
    SemaphoreTypeCreateInfo = 1000207002,
    TimelineSemaphoreSubmitInfo = 1000207003,
    SemaphoreWaitInfo = 1000207004,
    SemaphoreSignalInfo = 1000207005,
    PhysicalDeviceBufferDeviceAddressFeatures = 1000257000,
    BufferDeviceAddressInfo = 1000244001,
    BufferOpaqueCaptureAddressCreateInfo = 1000257002,
    MemoryOpaqueCaptureAddressAllocateInfo = 1000257003,
    DeviceMemoryOpaqueCaptureAddressInfo = 1000257004,
    SwapchainCreateInfoKhr = 1000001000,
    PresentInfoKhr = 1000001001,
    DeviceGroupPresentCapabilitiesKhr = 1000060007,
    ImageSwapchainCreateInfoKhr = 1000060008,
    BindImageMemorySwapchainInfoKhr = 1000060009,
    AcquireNextImageInfoKhr = 1000060010,
    DeviceGroupPresentInfoKhr = 1000060011,
    DeviceGroupSwapchainCreateInfoKhr = 1000060012,
    DisplayModeCreateInfoKhr = 1000002000,
    DisplaySurfaceCreateInfoKhr = 1000002001,
    DisplayPresentInfoKhr = 1000003000,
    XlibSurfaceCreateInfoKhr = 1000004000,
    XcbSurfaceCreateInfoKhr = 1000005000,
    WaylandSurfaceCreateInfoKhr = 1000006000,
    AndroidSurfaceCreateInfoKhr = 1000008000,
    Win32SurfaceCreateInfoKhr = 1000009000,
    DebugReportCallbackCreateInfoExt = 1000011000,
    PipelineRasterizationStateRasterizationOrderAmd = 1000018000,
    DebugMarkerObjectNameInfoExt = 1000022000,
    DebugMarkerObjectTagInfoExt = 1000022001,
    DebugMarkerMarkerInfoExt = 1000022002,
    DedicatedAllocationImageCreateInfoNv = 1000026000,
    DedicatedAllocationBufferCreateInfoNv = 1000026001,
    DedicatedAllocationMemoryAllocateInfoNv = 1000026002,
    PhysicalDeviceTransformFeedbackFeaturesExt = 1000028000,
    PhysicalDeviceTransformFeedbackPropertiesExt = 1000028001,
    PipelineRasterizationStateStreamCreateInfoExt = 1000028002,
    ImageViewHandleInfoNvx = 1000030000,
    ImageViewAddressPropertiesNvx = 1000030001,
    TextureLodGatherFormatPropertiesAmd = 1000041000,
    StreamDescriptorSurfaceCreateInfoGgp = 1000049000,
    PhysicalDeviceCornerSampledImageFeaturesNv = 1000050000,
    ExternalMemoryImageCreateInfoNv = 1000056000,
    ExportMemoryAllocateInfoNv = 1000056001,
    ImportMemoryWin32HandleInfoNv = 1000057000,
    ExportMemoryWin32HandleInfoNv = 1000057001,
    Win32KeyedMutexAcquireReleaseInfoNv = 1000058000,
    ValidationFlagsExt = 1000061000,
    ViSurfaceCreateInfoNn = 1000062000,
    PhysicalDeviceTextureCompressionAstcHdrFeaturesExt = 1000066000,
    ImageViewAstcDecodeModeExt = 1000067000,
    PhysicalDeviceAstcDecodeFeaturesExt = 1000067001,
    ImportMemoryWin32HandleInfoKhr = 1000073000,
    ExportMemoryWin32HandleInfoKhr = 1000073001,
    MemoryWin32HandlePropertiesKhr = 1000073002,
    MemoryGetWin32HandleInfoKhr = 1000073003,
    ImportMemoryFdInfoKhr = 1000074000,
    MemoryFdPropertiesKhr = 1000074001,
    MemoryGetFdInfoKhr = 1000074002,
    Win32KeyedMutexAcquireReleaseInfoKhr = 1000075000,
    ImportSemaphoreWin32HandleInfoKhr = 1000078000,
    ExportSemaphoreWin32HandleInfoKhr = 1000078001,
    D3D12FenceSubmitInfoKhr = 1000078002,
    SemaphoreGetWin32HandleInfoKhr = 1000078003,
    ImportSemaphoreFdInfoKhr = 1000079000,
    SemaphoreGetFdInfoKhr = 1000079001,
    PhysicalDevicePushDescriptorPropertiesKhr = 1000080000,
    CommandBufferInheritanceConditionalRenderingInfoExt = 1000081000,
    PhysicalDeviceConditionalRenderingFeaturesExt = 1000081001,
    ConditionalRenderingBeginInfoExt = 1000081002,
    PresentRegionsKhr = 1000084000,
    PipelineViewportW_scalingStateCreateInfoNv = 1000087000,
    SurfaceCapabilities2_ext = 1000090000,
    DisplayPowerInfoExt = 1000091000,
    DeviceEventInfoExt = 1000091001,
    DisplayEventInfoExt = 1000091002,
    SwapchainCounterCreateInfoExt = 1000091003,
    PresentTimesInfoGoogle = 1000092000,
    PhysicalDeviceMultiviewPerViewAttributesPropertiesNvx = 1000097000,
    PipelineViewportSwizzleStateCreateInfoNv = 1000098000,
    PhysicalDeviceDiscardRectanglePropertiesExt = 1000099000,
    PipelineDiscardRectangleStateCreateInfoExt = 1000099001,
    PhysicalDeviceConservativeRasterizationPropertiesExt = 1000101000,
    PipelineRasterizationConservativeStateCreateInfoExt = 1000101001,
    PhysicalDeviceDepthClipEnableFeaturesExt = 1000102000,
    PipelineRasterizationDepthClipStateCreateInfoExt = 1000102001,
    HdrMetadataExt = 1000105000,
    SharedPresentSurfaceCapabilitiesKhr = 1000111000,
    ImportFenceWin32HandleInfoKhr = 1000114000,
    ExportFenceWin32HandleInfoKhr = 1000114001,
    FenceGetWin32HandleInfoKhr = 1000114002,
    ImportFenceFdInfoKhr = 1000115000,
    FenceGetFdInfoKhr = 1000115001,
    PhysicalDevicePerformanceQueryFeaturesKhr = 1000116000,
    PhysicalDevicePerformanceQueryPropertiesKhr = 1000116001,
    QueryPoolPerformanceCreateInfoKhr = 1000116002,
    PerformanceQuerySubmitInfoKhr = 1000116003,
    AcquireProfilingLockInfoKhr = 1000116004,
    PerformanceCounterKhr = 1000116005,
    PerformanceCounterDescriptionKhr = 1000116006,
    PhysicalDeviceSurfaceInfo2_khr = 1000119000,
    SurfaceCapabilities2_khr = 1000119001,
    SurfaceFormat2_khr = 1000119002,
    DisplayProperties2_khr = 1000121000,
    DisplayPlaneProperties2_khr = 1000121001,
    DisplayModeProperties2_khr = 1000121002,
    DisplayPlaneInfo2_khr = 1000121003,
    DisplayPlaneCapabilities2_khr = 1000121004,
    IosSurfaceCreateInfoMvk = 1000122000,
    MacosSurfaceCreateInfoMvk = 1000123000,
    DebugUtilsObjectNameInfoExt = 1000128000,
    DebugUtilsObjectTagInfoExt = 1000128001,
    DebugUtilsLabelExt = 1000128002,
    DebugUtilsMessengerCallbackDataExt = 1000128003,
    DebugUtilsMessengerCreateInfoExt = 1000128004,
    AndroidHardwareBufferUsageAndroid = 1000129000,
    AndroidHardwareBufferPropertiesAndroid = 1000129001,
    AndroidHardwareBufferFormatPropertiesAndroid = 1000129002,
    ImportAndroidHardwareBufferInfoAndroid = 1000129003,
    MemoryGetAndroidHardwareBufferInfoAndroid = 1000129004,
    ExternalFormatAndroid = 1000129005,
    PhysicalDeviceInlineUniformBlockFeaturesExt = 1000138000,
    PhysicalDeviceInlineUniformBlockPropertiesExt = 1000138001,
    WriteDescriptorSetInlineUniformBlockExt = 1000138002,
    DescriptorPoolInlineUniformBlockCreateInfoExt = 1000138003,
    SampleLocationsInfoExt = 1000143000,
    RenderPassSampleLocationsBeginInfoExt = 1000143001,
    PipelineSampleLocationsStateCreateInfoExt = 1000143002,
    PhysicalDeviceSampleLocationsPropertiesExt = 1000143003,
    MultisamplePropertiesExt = 1000143004,
    PhysicalDeviceBlendOperationAdvancedFeaturesExt = 1000148000,
    PhysicalDeviceBlendOperationAdvancedPropertiesExt = 1000148001,
    PipelineColorBlendAdvancedStateCreateInfoExt = 1000148002,
    PipelineCoverageToColorStateCreateInfoNv = 1000149000,
    BindAccelerationStructureMemoryInfoKhr = 1000165006,
    WriteDescriptorSetAccelerationStructureKhr = 1000165007,
    AccelerationStructureBuildGeometryInfoKhr = 1000150000,
    AccelerationStructureCreateGeometryTypeInfoKhr = 1000150001,
    AccelerationStructureDeviceAddressInfoKhr = 1000150002,
    AccelerationStructureGeometryAabbsDataKhr = 1000150003,
    AccelerationStructureGeometryInstancesDataKhr = 1000150004,
    AccelerationStructureGeometryTrianglesDataKhr = 1000150005,
    AccelerationStructureGeometryKhr = 1000150006,
    AccelerationStructureMemoryRequirementsInfoKhr = 1000150008,
    AccelerationStructureVersionKhr = 1000150009,
    CopyAccelerationStructureInfoKhr = 1000150010,
    CopyAccelerationStructureToMemoryInfoKhr = 1000150011,
    CopyMemoryToAccelerationStructureInfoKhr = 1000150012,
    PhysicalDeviceRayTracingFeaturesKhr = 1000150013,
    PhysicalDeviceRayTracingPropertiesKhr = 1000150014,
    RayTracingPipelineCreateInfoKhr = 1000150015,
    RayTracingShaderGroupCreateInfoKhr = 1000150016,
    AccelerationStructureCreateInfoKhr = 1000150017,
    RayTracingPipelineInterfaceCreateInfoKhr = 1000150018,
    PipelineCoverageModulationStateCreateInfoNv = 1000152000,
    PhysicalDeviceShaderSmBuiltinsFeaturesNv = 1000154000,
    PhysicalDeviceShaderSmBuiltinsPropertiesNv = 1000154001,
    DrmFormatModifierPropertiesListExt = 1000158000,
    DrmFormatModifierPropertiesExt = 1000158001,
    PhysicalDeviceImageDrmFormatModifierInfoExt = 1000158002,
    ImageDrmFormatModifierListCreateInfoExt = 1000158003,
    ImageDrmFormatModifierExplicitCreateInfoExt = 1000158004,
    ImageDrmFormatModifierPropertiesExt = 1000158005,
    ValidationCacheCreateInfoExt = 1000160000,
    ShaderModuleValidationCacheCreateInfoExt = 1000160001,
    PipelineViewportShadingRateImageStateCreateInfoNv = 1000164000,
    PhysicalDeviceShadingRateImageFeaturesNv = 1000164001,
    PhysicalDeviceShadingRateImagePropertiesNv = 1000164002,
    PipelineViewportCoarseSampleOrderStateCreateInfoNv = 1000164005,
    RayTracingPipelineCreateInfoNv = 1000165000,
    AccelerationStructureCreateInfoNv = 1000165001,
    GeometryNv = 1000165003,
    GeometryTrianglesNv = 1000165004,
    GeometryAabbNv = 1000165005,
    AccelerationStructureMemoryRequirementsInfoNv = 1000165008,
    PhysicalDeviceRayTracingPropertiesNv = 1000165009,
    RayTracingShaderGroupCreateInfoNv = 1000165011,
    AccelerationStructureInfoNv = 1000165012,
    PhysicalDeviceRepresentativeFragmentTestFeaturesNv = 1000166000,
    PipelineRepresentativeFragmentTestStateCreateInfoNv = 1000166001,
    PhysicalDeviceImageViewImageFormatInfoExt = 1000170000,
    FilterCubicImageViewImageFormatPropertiesExt = 1000170001,
    DeviceQueueGlobalPriorityCreateInfoExt = 1000174000,
    ImportMemoryHostPointerInfoExt = 1000178000,
    MemoryHostPointerPropertiesExt = 1000178001,
    PhysicalDeviceExternalMemoryHostPropertiesExt = 1000178002,
    PhysicalDeviceShaderClockFeaturesKhr = 1000181000,
    PipelineCompilerControlCreateInfoAmd = 1000183000,
    CalibratedTimestampInfoExt = 1000184000,
    PhysicalDeviceShaderCorePropertiesAmd = 1000185000,
    DeviceMemoryOverallocationCreateInfoAmd = 1000189000,
    PhysicalDeviceVertexAttributeDivisorPropertiesExt = 1000190000,
    PipelineVertexInputDivisorStateCreateInfoExt = 1000190001,
    PhysicalDeviceVertexAttributeDivisorFeaturesExt = 1000190002,
    PresentFrameTokenGgp = 1000191000,
    PipelineCreationFeedbackCreateInfoExt = 1000192000,
    PhysicalDeviceComputeShaderDerivativesFeaturesNv = 1000201000,
    PhysicalDeviceMeshShaderFeaturesNv = 1000202000,
    PhysicalDeviceMeshShaderPropertiesNv = 1000202001,
    PhysicalDeviceFragmentShaderBarycentricFeaturesNv = 1000203000,
    PhysicalDeviceShaderImageFootprintFeaturesNv = 1000204000,
    PipelineViewportExclusiveScissorStateCreateInfoNv = 1000205000,
    PhysicalDeviceExclusiveScissorFeaturesNv = 1000205002,
    CheckpointDataNv = 1000206000,
    QueueFamilyCheckpointPropertiesNv = 1000206001,
    PhysicalDeviceShaderIntegerFunctions2_featuresIntel = 1000209000,
    QueryPoolPerformanceQueryCreateInfoIntel = 1000210000,
    InitializePerformanceApiInfoIntel = 1000210001,
    PerformanceMarkerInfoIntel = 1000210002,
    PerformanceStreamMarkerInfoIntel = 1000210003,
    PerformanceOverrideInfoIntel = 1000210004,
    PerformanceConfigurationAcquireInfoIntel = 1000210005,
    PhysicalDevicePciBusInfoPropertiesExt = 1000212000,
    DisplayNativeHdrSurfaceCapabilitiesAmd = 1000213000,
    SwapchainDisplayNativeHdrCreateInfoAmd = 1000213001,
    ImagepipeSurfaceCreateInfoFuchsia = 1000214000,
    MetalSurfaceCreateInfoExt = 1000217000,
    PhysicalDeviceFragmentDensityMapFeaturesExt = 1000218000,
    PhysicalDeviceFragmentDensityMapPropertiesExt = 1000218001,
    RenderPassFragmentDensityMapCreateInfoExt = 1000218002,
    PhysicalDeviceSubgroupSizeControlPropertiesExt = 1000225000,
    PipelineShaderStageRequiredSubgroupSizeCreateInfoExt = 1000225001,
    PhysicalDeviceSubgroupSizeControlFeaturesExt = 1000225002,
    PhysicalDeviceShaderCoreProperties2_amd = 1000227000,
    PhysicalDeviceCoherentMemoryFeaturesAmd = 1000229000,
    PhysicalDeviceMemoryBudgetPropertiesExt = 1000237000,
    PhysicalDeviceMemoryPriorityFeaturesExt = 1000238000,
    MemoryPriorityAllocateInfoExt = 1000238001,
    SurfaceProtectedCapabilitiesKhr = 1000239000,
    PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNv = 1000240000,
    PhysicalDeviceBufferDeviceAddressFeaturesExt = 1000244000,
    BufferDeviceAddressCreateInfoExt = 1000244002,
    PhysicalDeviceToolPropertiesExt = 1000245000,
    ValidationFeaturesExt = 1000247000,
    PhysicalDeviceCooperativeMatrixFeaturesNv = 1000249000,
    CooperativeMatrixPropertiesNv = 1000249001,
    PhysicalDeviceCooperativeMatrixPropertiesNv = 1000249002,
    PhysicalDeviceCoverageReductionModeFeaturesNv = 1000250000,
    PipelineCoverageReductionStateCreateInfoNv = 1000250001,
    FramebufferMixedSamplesCombinationNv = 1000250002,
    PhysicalDeviceFragmentShaderInterlockFeaturesExt = 1000251000,
    PhysicalDeviceYcbcrImageArraysFeaturesExt = 1000252000,
    SurfaceFullScreenExclusiveInfoExt = 1000255000,
    SurfaceCapabilitiesFullScreenExclusiveExt = 1000255002,
    SurfaceFullScreenExclusiveWin32InfoExt = 1000255001,
    HeadlessSurfaceCreateInfoExt = 1000256000,
    PhysicalDeviceLineRasterizationFeaturesExt = 1000259000,
    PipelineRasterizationLineStateCreateInfoExt = 1000259001,
    PhysicalDeviceLineRasterizationPropertiesExt = 1000259002,
    PhysicalDeviceIndexTypeUint8FeaturesExt = 1000265000,
    DeferredOperationInfoKhr = 1000268000,
    PhysicalDevicePipelineExecutablePropertiesFeaturesKhr = 1000269000,
    PipelineInfoKhr = 1000269001,
    PipelineExecutablePropertiesKhr = 1000269002,
    PipelineExecutableInfoKhr = 1000269003,
    PipelineExecutableStatisticKhr = 1000269004,
    PipelineExecutableInternalRepresentationKhr = 1000269005,
    PhysicalDeviceShaderDemoteToHelperInvocationFeaturesExt = 1000276000,
    PhysicalDeviceDeviceGeneratedCommandsPropertiesNv = 1000277000,
    GraphicsShaderGroupCreateInfoNv = 1000277001,
    GraphicsPipelineShaderGroupsCreateInfoNv = 1000277002,
    IndirectCommandsLayoutTokenNv = 1000277003,
    IndirectCommandsLayoutCreateInfoNv = 1000277004,
    GeneratedCommandsInfoNv = 1000277005,
    GeneratedCommandsMemoryRequirementsInfoNv = 1000277006,
    PhysicalDeviceDeviceGeneratedCommandsFeaturesNv = 1000277007,
    PhysicalDeviceTexelBufferAlignmentFeaturesExt = 1000281000,
    PhysicalDeviceTexelBufferAlignmentPropertiesExt = 1000281001,
    CommandBufferInheritanceRenderPassTransformInfoQcom = 1000282000,
    RenderPassTransformBeginInfoQcom = 1000282001,
    PhysicalDeviceRobustness2_featuresExt = 1000286000,
    PhysicalDeviceRobustness2_propertiesExt = 1000286001,
    SamplerCustomBorderColorCreateInfoExt = 1000287000,
    PhysicalDeviceCustomBorderColorPropertiesExt = 1000287001,
    PhysicalDeviceCustomBorderColorFeaturesExt = 1000287002,
    PipelineLibraryCreateInfoKhr = 1000290000,
    PhysicalDevicePrivateDataFeaturesExt = 1000295000,
    DevicePrivateDataCreateInfoExt = 1000295001,
    PrivateDataSlotCreateInfoExt = 1000295002,
    PhysicalDevicePipelineCreationCacheControlFeaturesExt = 1000297000,
    PhysicalDeviceDiagnosticsConfigFeaturesNv = 1000300000,
    DeviceDiagnosticsConfigCreateInfoNv = 1000300001,
    PhysicalDeviceVariablePointerFeatures = 1000120000,
    PhysicalDeviceShaderDrawParameterFeatures = 1000063000,
    DebugReportCreateInfoExt = 1000011000,
    RenderPassMultiviewCreateInfoKhr = 1000053000,
    PhysicalDeviceMultiviewFeaturesKhr = 1000053001,
    PhysicalDeviceMultiviewPropertiesKhr = 1000053002,
    PhysicalDeviceFeatures2_khr = 1000059000,
    PhysicalDeviceProperties2_khr = 1000059001,
    FormatProperties2_khr = 1000059002,
    ImageFormatProperties2_khr = 1000059003,
    PhysicalDeviceImageFormatInfo2_khr = 1000059004,
    QueueFamilyProperties2_khr = 1000059005,
    PhysicalDeviceMemoryProperties2_khr = 1000059006,
    SparseImageFormatProperties2_khr = 1000059007,
    PhysicalDeviceSparseImageFormatInfo2_khr = 1000059008,
    MemoryAllocateFlagsInfoKhr = 1000060000,
    DeviceGroupRenderPassBeginInfoKhr = 1000060003,
    DeviceGroupCommandBufferBeginInfoKhr = 1000060004,
    DeviceGroupSubmitInfoKhr = 1000060005,
    DeviceGroupBindSparseInfoKhr = 1000060006,
    BindBufferMemoryDeviceGroupInfoKhr = 1000060013,
    BindImageMemoryDeviceGroupInfoKhr = 1000060014,
    PhysicalDeviceGroupPropertiesKhr = 1000070000,
    DeviceGroupDeviceCreateInfoKhr = 1000070001,
    PhysicalDeviceExternalImageFormatInfoKhr = 1000071000,
    ExternalImageFormatPropertiesKhr = 1000071001,
    PhysicalDeviceExternalBufferInfoKhr = 1000071002,
    ExternalBufferPropertiesKhr = 1000071003,
    PhysicalDeviceIdPropertiesKhr = 1000071004,
    ExternalMemoryBufferCreateInfoKhr = 1000072000,
    ExternalMemoryImageCreateInfoKhr = 1000072001,
    ExportMemoryAllocateInfoKhr = 1000072002,
    PhysicalDeviceExternalSemaphoreInfoKhr = 1000076000,
    ExternalSemaphorePropertiesKhr = 1000076001,
    ExportSemaphoreCreateInfoKhr = 1000077000,
    PhysicalDeviceShaderFloat16Int8FeaturesKhr = 1000082000,
    PhysicalDeviceFloat16Int8FeaturesKhr = 1000082000,
    PhysicalDevice16BitStorageFeaturesKhr = 1000083000,
    DescriptorUpdateTemplateCreateInfoKhr = 1000085000,
    SurfaceCapabilities2Ext = 1000090000,
    PhysicalDeviceImagelessFramebufferFeaturesKhr = 1000108000,
    FramebufferAttachmentsCreateInfoKhr = 1000108001,
    FramebufferAttachmentImageInfoKhr = 1000108002,
    RenderPassAttachmentBeginInfoKhr = 1000108003,
    AttachmentDescription2_khr = 1000109000,
    AttachmentReference2_khr = 1000109001,
    SubpassDescription2_khr = 1000109002,
    SubpassDependency2_khr = 1000109003,
    RenderPassCreateInfo2_khr = 1000109004,
    SubpassBeginInfoKhr = 1000109005,
    SubpassEndInfoKhr = 1000109006,
    PhysicalDeviceExternalFenceInfoKhr = 1000112000,
    ExternalFencePropertiesKhr = 1000112001,
    ExportFenceCreateInfoKhr = 1000113000,
    PhysicalDevicePointClippingPropertiesKhr = 1000117000,
    RenderPassInputAttachmentAspectCreateInfoKhr = 1000117001,
    ImageViewUsageCreateInfoKhr = 1000117002,
    PipelineTessellationDomainOriginStateCreateInfoKhr = 1000117003,
    PhysicalDeviceVariablePointersFeaturesKhr = 1000120000,
    PhysicalDeviceVariablePointerFeaturesKhr = 1000120000,
    MemoryDedicatedRequirementsKhr = 1000127000,
    MemoryDedicatedAllocateInfoKhr = 1000127001,
    PhysicalDeviceSamplerFilterMinmaxPropertiesExt = 1000130000,
    SamplerReductionModeCreateInfoExt = 1000130001,
    BufferMemoryRequirementsInfo2_khr = 1000146000,
    ImageMemoryRequirementsInfo2_khr = 1000146001,
    ImageSparseMemoryRequirementsInfo2_khr = 1000146002,
    MemoryRequirements2_khr = 1000146003,
    SparseImageMemoryRequirements2_khr = 1000146004,
    ImageFormatListCreateInfoKhr = 1000147000,
    SamplerYcbcrConversionCreateInfoKhr = 1000156000,
    SamplerYcbcrConversionInfoKhr = 1000156001,
    BindImagePlaneMemoryInfoKhr = 1000156002,
    ImagePlaneMemoryRequirementsInfoKhr = 1000156003,
    PhysicalDeviceSamplerYcbcrConversionFeaturesKhr = 1000156004,
    SamplerYcbcrConversionImageFormatPropertiesKhr = 1000156005,
    BindBufferMemoryInfoKhr = 1000157000,
    BindImageMemoryInfoKhr = 1000157001,
    DescriptorSetLayoutBindingFlagsCreateInfoExt = 1000161000,
    PhysicalDeviceDescriptorIndexingFeaturesExt = 1000161001,
    PhysicalDeviceDescriptorIndexingPropertiesExt = 1000161002,
    DescriptorSetVariableDescriptorCountAllocateInfoExt = 1000161003,
    DescriptorSetVariableDescriptorCountLayoutSupportExt = 1000161004,
    BindAccelerationStructureMemoryInfoNv = 1000165006,
    WriteDescriptorSetAccelerationStructureNv = 1000165007,
    PhysicalDeviceMaintenance3_propertiesKhr = 1000168000,
    DescriptorSetLayoutSupportKhr = 1000168001,
    PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKhr = 1000175000,
    PhysicalDevice8BitStorageFeaturesKhr = 1000177000,
    PhysicalDeviceShaderAtomicInt64FeaturesKhr = 1000180000,
    PhysicalDeviceDriverPropertiesKhr = 1000196000,
    PhysicalDeviceFloatControlsPropertiesKhr = 1000197000,
    PhysicalDeviceDepthStencilResolvePropertiesKhr = 1000199000,
    SubpassDescriptionDepthStencilResolveKhr = 1000199001,
    PhysicalDeviceTimelineSemaphoreFeaturesKhr = 1000207000,
    PhysicalDeviceTimelineSemaphorePropertiesKhr = 1000207001,
    SemaphoreTypeCreateInfoKhr = 1000207002,
    TimelineSemaphoreSubmitInfoKhr = 1000207003,
    SemaphoreWaitInfoKhr = 1000207004,
    SemaphoreSignalInfoKhr = 1000207005,
    QueryPoolCreateInfoIntel = 1000210000,
    PhysicalDeviceVulkanMemoryModelFeaturesKhr = 1000211000,
    PhysicalDeviceScalarBlockLayoutFeaturesExt = 1000221000,
    PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKhr = 1000241000,
    AttachmentReferenceStencilLayoutKhr = 1000241001,
    AttachmentDescriptionStencilLayoutKhr = 1000241002,
    PhysicalDeviceBufferAddressFeaturesExt = 1000244000,
    BufferDeviceAddressInfoExt = 1000244001,
    ImageStencilUsageCreateInfoExt = 1000246000,
    PhysicalDeviceUniformBufferStandardLayoutFeaturesKhr = 1000253000,
    PhysicalDeviceBufferDeviceAddressFeaturesKhr = 1000257000,
    BufferDeviceAddressInfoKhr = 1000244001,
    BufferOpaqueCaptureAddressCreateInfoKhr = 1000257002,
    MemoryOpaqueCaptureAddressAllocateInfoKhr = 1000257003,
    DeviceMemoryOpaqueCaptureAddressInfoKhr = 1000257004,
    PhysicalDeviceHostQueryResetFeaturesExt = 1000261000,
};

SystemAllocationScope :: enum i32 {
    Command = 0,
    Object = 1,
    Cache = 2,
    Device = 3,
    Instance = 4,
};

InternalAllocationType :: enum i32 {
    Executable = 0,
};

Format :: enum i32 {
    Undefined = 0,
    R4G4UnormPack8 = 1,
    R4G4B4A4UnormPack16 = 2,
    B4G4R4A4UnormPack16 = 3,
    R5G6B5UnormPack16 = 4,
    B5G6R5UnormPack16 = 5,
    R5G5B5A1UnormPack16 = 6,
    B5G5R5A1UnormPack16 = 7,
    A1R5G5B5UnormPack16 = 8,
    R8Unorm = 9,
    R8Snorm = 10,
    R8Uscaled = 11,
    R8Sscaled = 12,
    R8Uint = 13,
    R8Sint = 14,
    R8Srgb = 15,
    R8G8Unorm = 16,
    R8G8Snorm = 17,
    R8G8Uscaled = 18,
    R8G8Sscaled = 19,
    R8G8Uint = 20,
    R8G8Sint = 21,
    R8G8Srgb = 22,
    R8G8B8Unorm = 23,
    R8G8B8Snorm = 24,
    R8G8B8Uscaled = 25,
    R8G8B8Sscaled = 26,
    R8G8B8Uint = 27,
    R8G8B8Sint = 28,
    R8G8B8Srgb = 29,
    B8G8R8Unorm = 30,
    B8G8R8Snorm = 31,
    B8G8R8Uscaled = 32,
    B8G8R8Sscaled = 33,
    B8G8R8Uint = 34,
    B8G8R8Sint = 35,
    B8G8R8Srgb = 36,
    R8G8B8A8Unorm = 37,
    R8G8B8A8Snorm = 38,
    R8G8B8A8Uscaled = 39,
    R8G8B8A8Sscaled = 40,
    R8G8B8A8Uint = 41,
    R8G8B8A8Sint = 42,
    R8G8B8A8Srgb = 43,
    B8G8R8A8Unorm = 44,
    B8G8R8A8Snorm = 45,
    B8G8R8A8Uscaled = 46,
    B8G8R8A8Sscaled = 47,
    B8G8R8A8Uint = 48,
    B8G8R8A8Sint = 49,
    B8G8R8A8Srgb = 50,
    A8B8G8R8UnormPack32 = 51,
    A8B8G8R8SnormPack32 = 52,
    A8B8G8R8UscaledPack32 = 53,
    A8B8G8R8SscaledPack32 = 54,
    A8B8G8R8UintPack32 = 55,
    A8B8G8R8SintPack32 = 56,
    A8B8G8R8SrgbPack32 = 57,
    A2R10G10B10UnormPack32 = 58,
    A2R10G10B10SnormPack32 = 59,
    A2R10G10B10UscaledPack32 = 60,
    A2R10G10B10SscaledPack32 = 61,
    A2R10G10B10UintPack32 = 62,
    A2R10G10B10SintPack32 = 63,
    A2B10G10R10UnormPack32 = 64,
    A2B10G10R10SnormPack32 = 65,
    A2B10G10R10UscaledPack32 = 66,
    A2B10G10R10SscaledPack32 = 67,
    A2B10G10R10UintPack32 = 68,
    A2B10G10R10SintPack32 = 69,
    R16Unorm = 70,
    R16Snorm = 71,
    R16Uscaled = 72,
    R16Sscaled = 73,
    R16Uint = 74,
    R16Sint = 75,
    R16Sfloat = 76,
    R16G16Unorm = 77,
    R16G16Snorm = 78,
    R16G16Uscaled = 79,
    R16G16Sscaled = 80,
    R16G16Uint = 81,
    R16G16Sint = 82,
    R16G16Sfloat = 83,
    R16G16B16Unorm = 84,
    R16G16B16Snorm = 85,
    R16G16B16Uscaled = 86,
    R16G16B16Sscaled = 87,
    R16G16B16Uint = 88,
    R16G16B16Sint = 89,
    R16G16B16Sfloat = 90,
    R16G16B16A16Unorm = 91,
    R16G16B16A16Snorm = 92,
    R16G16B16A16Uscaled = 93,
    R16G16B16A16Sscaled = 94,
    R16G16B16A16Uint = 95,
    R16G16B16A16Sint = 96,
    R16G16B16A16Sfloat = 97,
    R32Uint = 98,
    R32Sint = 99,
    R32Sfloat = 100,
    R32G32Uint = 101,
    R32G32Sint = 102,
    R32G32Sfloat = 103,
    R32G32B32Uint = 104,
    R32G32B32Sint = 105,
    R32G32B32Sfloat = 106,
    R32G32B32A32Uint = 107,
    R32G32B32A32Sint = 108,
    R32G32B32A32Sfloat = 109,
    R64Uint = 110,
    R64Sint = 111,
    R64Sfloat = 112,
    R64G64Uint = 113,
    R64G64Sint = 114,
    R64G64Sfloat = 115,
    R64G64B64Uint = 116,
    R64G64B64Sint = 117,
    R64G64B64Sfloat = 118,
    R64G64B64A64Uint = 119,
    R64G64B64A64Sint = 120,
    R64G64B64A64Sfloat = 121,
    B10G11R11UfloatPack32 = 122,
    E5B9G9R9UfloatPack32 = 123,
    D16Unorm = 124,
    X8D24UnormPack32 = 125,
    D32Sfloat = 126,
    S8Uint = 127,
    D16UnormS8Uint = 128,
    D24UnormS8Uint = 129,
    D32SfloatS8Uint = 130,
    Bc1RgbUnormBlock = 131,
    Bc1RgbSrgbBlock = 132,
    Bc1RgbaUnormBlock = 133,
    Bc1RgbaSrgbBlock = 134,
    Bc2UnormBlock = 135,
    Bc2SrgbBlock = 136,
    Bc3UnormBlock = 137,
    Bc3SrgbBlock = 138,
    Bc4UnormBlock = 139,
    Bc4SnormBlock = 140,
    Bc5UnormBlock = 141,
    Bc5SnormBlock = 142,
    Bc6HUfloatBlock = 143,
    Bc6HSfloatBlock = 144,
    Bc7UnormBlock = 145,
    Bc7SrgbBlock = 146,
    Etc2R8G8B8UnormBlock = 147,
    Etc2R8G8B8SrgbBlock = 148,
    Etc2R8G8B8A1UnormBlock = 149,
    Etc2R8G8B8A1SrgbBlock = 150,
    Etc2R8G8B8A8UnormBlock = 151,
    Etc2R8G8B8A8SrgbBlock = 152,
    EacR11UnormBlock = 153,
    EacR11SnormBlock = 154,
    EacR11G11UnormBlock = 155,
    EacR11G11SnormBlock = 156,
    Astc4X4UnormBlock = 157,
    Astc4X4SrgbBlock = 158,
    Astc5X4UnormBlock = 159,
    Astc5X4SrgbBlock = 160,
    Astc5X5UnormBlock = 161,
    Astc5X5SrgbBlock = 162,
    Astc6X5UnormBlock = 163,
    Astc6X5SrgbBlock = 164,
    Astc6X6UnormBlock = 165,
    Astc6X6SrgbBlock = 166,
    Astc8X5UnormBlock = 167,
    Astc8X5SrgbBlock = 168,
    Astc8X6UnormBlock = 169,
    Astc8X6SrgbBlock = 170,
    Astc8X8UnormBlock = 171,
    Astc8X8SrgbBlock = 172,
    Astc10X5UnormBlock = 173,
    Astc10X5SrgbBlock = 174,
    Astc10X6UnormBlock = 175,
    Astc10X6SrgbBlock = 176,
    Astc10X8UnormBlock = 177,
    Astc10X8SrgbBlock = 178,
    Astc10X10UnormBlock = 179,
    Astc10X10SrgbBlock = 180,
    Astc12X10UnormBlock = 181,
    Astc12X10SrgbBlock = 182,
    Astc12X12UnormBlock = 183,
    Astc12X12SrgbBlock = 184,
    G8B8G8R8422Unorm = 1000156000,
    B8G8R8G8422Unorm = 1000156001,
    G8B8R83Plane420Unorm = 1000156002,
    G8B8R82Plane420Unorm = 1000156003,
    G8B8R83Plane422Unorm = 1000156004,
    G8B8R82Plane422Unorm = 1000156005,
    G8B8R83Plane444Unorm = 1000156006,
    R10X6UnormPack16 = 1000156007,
    R10X6G10X6Unorm2Pack16 = 1000156008,
    R10X6G10X6B10X6A10X6Unorm4Pack16 = 1000156009,
    G10X6B10X6G10X6R10X6422Unorm4Pack16 = 1000156010,
    B10X6G10X6R10X6G10X6422Unorm4Pack16 = 1000156011,
    G10X6B10X6R10X63Plane420Unorm3Pack16 = 1000156012,
    G10X6B10X6R10X62Plane420Unorm3Pack16 = 1000156013,
    G10X6B10X6R10X63Plane422Unorm3Pack16 = 1000156014,
    G10X6B10X6R10X62Plane422Unorm3Pack16 = 1000156015,
    G10X6B10X6R10X63Plane444Unorm3Pack16 = 1000156016,
    R12X4UnormPack16 = 1000156017,
    R12X4G12X4Unorm2Pack16 = 1000156018,
    R12X4G12X4B12X4A12X4Unorm4Pack16 = 1000156019,
    G12X4B12X4G12X4R12X4422Unorm4Pack16 = 1000156020,
    B12X4G12X4R12X4G12X4422Unorm4Pack16 = 1000156021,
    G12X4B12X4R12X43Plane420Unorm3Pack16 = 1000156022,
    G12X4B12X4R12X42Plane420Unorm3Pack16 = 1000156023,
    G12X4B12X4R12X43Plane422Unorm3Pack16 = 1000156024,
    G12X4B12X4R12X42Plane422Unorm3Pack16 = 1000156025,
    G12X4B12X4R12X43Plane444Unorm3Pack16 = 1000156026,
    G16B16G16R16422Unorm = 1000156027,
    B16G16R16G16422Unorm = 1000156028,
    G16B16R163Plane420Unorm = 1000156029,
    G16B16R162Plane420Unorm = 1000156030,
    G16B16R163Plane422Unorm = 1000156031,
    G16B16R162Plane422Unorm = 1000156032,
    G16B16R163Plane444Unorm = 1000156033,
    Pvrtc12BppUnormBlockImg = 1000054000,
    Pvrtc14BppUnormBlockImg = 1000054001,
    Pvrtc22BppUnormBlockImg = 1000054002,
    Pvrtc24BppUnormBlockImg = 1000054003,
    Pvrtc12BppSrgbBlockImg = 1000054004,
    Pvrtc14BppSrgbBlockImg = 1000054005,
    Pvrtc22BppSrgbBlockImg = 1000054006,
    Pvrtc24BppSrgbBlockImg = 1000054007,
    Astc4X4SfloatBlockExt = 1000066000,
    Astc5X4SfloatBlockExt = 1000066001,
    Astc5X5SfloatBlockExt = 1000066002,
    Astc6X5SfloatBlockExt = 1000066003,
    Astc6X6SfloatBlockExt = 1000066004,
    Astc8X5SfloatBlockExt = 1000066005,
    Astc8X6SfloatBlockExt = 1000066006,
    Astc8X8SfloatBlockExt = 1000066007,
    Astc10X5SfloatBlockExt = 1000066008,
    Astc10X6SfloatBlockExt = 1000066009,
    Astc10X8SfloatBlockExt = 1000066010,
    Astc10X10SfloatBlockExt = 1000066011,
    Astc12X10SfloatBlockExt = 1000066012,
    Astc12X12SfloatBlockExt = 1000066013,
    G8B8G8R8422UnormKhr = 1000156000,
    B8G8R8G8422UnormKhr = 1000156001,
    G8B8R83Plane420UnormKhr = 1000156002,
    G8B8R82Plane420UnormKhr = 1000156003,
    G8B8R83Plane422UnormKhr = 1000156004,
    G8B8R82Plane422UnormKhr = 1000156005,
    G8B8R83Plane444UnormKhr = 1000156006,
    R10X6UnormPack16Khr = 1000156007,
    R10X6G10X6Unorm2Pack16Khr = 1000156008,
    R10X6G10X6B10X6A10X6Unorm4Pack16Khr = 1000156009,
    G10X6B10X6G10X6R10X6422Unorm4Pack16Khr = 1000156010,
    B10X6G10X6R10X6G10X6422Unorm4Pack16Khr = 1000156011,
    G10X6B10X6R10X63Plane420Unorm3Pack16Khr = 1000156012,
    G10X6B10X6R10X62Plane420Unorm3Pack16Khr = 1000156013,
    G10X6B10X6R10X63Plane422Unorm3Pack16Khr = 1000156014,
    G10X6B10X6R10X62Plane422Unorm3Pack16Khr = 1000156015,
    G10X6B10X6R10X63Plane444Unorm3Pack16Khr = 1000156016,
    R12X4UnormPack16Khr = 1000156017,
    R12X4G12X4Unorm2Pack16Khr = 1000156018,
    R12X4G12X4B12X4A12X4Unorm4Pack16Khr = 1000156019,
    G12X4B12X4G12X4R12X4422Unorm4Pack16Khr = 1000156020,
    B12X4G12X4R12X4G12X4422Unorm4Pack16Khr = 1000156021,
    G12X4B12X4R12X43Plane420Unorm3Pack16Khr = 1000156022,
    G12X4B12X4R12X42Plane420Unorm3Pack16Khr = 1000156023,
    G12X4B12X4R12X43Plane422Unorm3Pack16Khr = 1000156024,
    G12X4B12X4R12X42Plane422Unorm3Pack16Khr = 1000156025,
    G12X4B12X4R12X43Plane444Unorm3Pack16Khr = 1000156026,
    G16B16G16R16422UnormKhr = 1000156027,
    B16G16R16G16422UnormKhr = 1000156028,
    G16B16R163Plane420UnormKhr = 1000156029,
    G16B16R162Plane420UnormKhr = 1000156030,
    G16B16R163Plane422UnormKhr = 1000156031,
    G16B16R162Plane422UnormKhr = 1000156032,
    G16B16R163Plane444UnormKhr = 1000156033,
};

ImageType :: enum i32 {
    _1D = 0,
    _2D = 1,
    _3D = 2,
};

ImageTiling :: enum i32 {
    Optimal = 0,
    Linear = 1,
    DrmFormatModifierExt = 1000158000,
};

PhysicalDeviceType :: enum i32 {
    Other = 0,
    IntegratedGpu = 1,
    DiscreteGpu = 2,
    VirtualGpu = 3,
    Cpu = 4,
};

QueryType :: enum i32 {
    Occlusion = 0,
    PipelineStatistics = 1,
    Timestamp = 2,
    TransformFeedbackStreamExt = 1000028004,
    PerformanceQueryKhr = 1000116000,
    AccelerationStructureCompactedSizeKhr = 1000165000,
    AccelerationStructureSerializationSizeKhr = 1000150000,
    PerformanceQueryIntel = 1000210000,
    AccelerationStructureCompactedSizeNv = 1000165000,
};

SharingMode :: enum i32 {
    Exclusive = 0,
    Concurrent = 1,
};

ImageLayout :: enum i32 {
    Undefined = 0,
    General = 1,
    ColorAttachmentOptimal = 2,
    DepthStencilAttachmentOptimal = 3,
    DepthStencilReadOnlyOptimal = 4,
    ShaderReadOnlyOptimal = 5,
    TransferSrcOptimal = 6,
    TransferDstOptimal = 7,
    Preinitialized = 8,
    DepthReadOnlyStencilAttachmentOptimal = 1000117000,
    DepthAttachmentStencilReadOnlyOptimal = 1000117001,
    DepthAttachmentOptimal = 1000241000,
    DepthReadOnlyOptimal = 1000241001,
    StencilAttachmentOptimal = 1000241002,
    StencilReadOnlyOptimal = 1000241003,
    PresentSrcKhr = 1000001002,
    SharedPresentKhr = 1000111000,
    ShadingRateOptimalNv = 1000164003,
    FragmentDensityMapOptimalExt = 1000218000,
    DepthReadOnlyStencilAttachmentOptimalKhr = 1000117000,
    DepthAttachmentStencilReadOnlyOptimalKhr = 1000117001,
    DepthAttachmentOptimalKhr = 1000241000,
    DepthReadOnlyOptimalKhr = 1000241001,
    StencilAttachmentOptimalKhr = 1000241002,
    StencilReadOnlyOptimalKhr = 1000241003,
};

ImageViewType :: enum i32 {
    _1D = 0,
    _2D = 1,
    _3D = 2,
    Cube = 3,
    _1DArray = 4,
    _2DArray = 5,
    CubeArray = 6,
};

ComponentSwizzle :: enum i32 {
    Identity = 0,
    Zero = 1,
    One = 2,
    R = 3,
    G = 4,
    B = 5,
    A = 6,
};

VertexInputRate :: enum i32 {
    Vertex = 0,
    Instance = 1,
};

PrimitiveTopology :: enum i32 {
    PointList = 0,
    LineList = 1,
    LineStrip = 2,
    TriangleList = 3,
    TriangleStrip = 4,
    TriangleFan = 5,
    LineListWithAdjacency = 6,
    LineStripWithAdjacency = 7,
    TriangleListWithAdjacency = 8,
    TriangleStripWithAdjacency = 9,
    PatchList = 10,
};

PolygonMode :: enum i32 {
    Fill = 0,
    Line = 1,
    Point = 2,
    FillRectangleNv = 1000153000,
};

FrontFace :: enum i32 {
    CounterClockwise = 0,
    Clockwise = 1,
};

CompareOp :: enum i32 {
    Never = 0,
    Less = 1,
    Equal = 2,
    LessOrEqual = 3,
    Greater = 4,
    NotEqual = 5,
    GreaterOrEqual = 6,
    Always = 7,
};

StencilOp :: enum i32 {
    Keep = 0,
    Zero = 1,
    Replace = 2,
    IncrementAndClamp = 3,
    DecrementAndClamp = 4,
    Invert = 5,
    IncrementAndWrap = 6,
    DecrementAndWrap = 7,
};

LogicOp :: enum i32 {
    Clear = 0,
    And = 1,
    AndReverse = 2,
    Copy = 3,
    AndInverted = 4,
    NoOp = 5,
    Xor = 6,
    Or = 7,
    Nor = 8,
    Equivalent = 9,
    Invert = 10,
    OrReverse = 11,
    CopyInverted = 12,
    OrInverted = 13,
    Nand = 14,
    Set = 15,
};

BlendFactor :: enum i32 {
    Zero = 0,
    One = 1,
    SrcColor = 2,
    OneMinusSrcColor = 3,
    DstColor = 4,
    OneMinusDstColor = 5,
    SrcAlpha = 6,
    OneMinusSrcAlpha = 7,
    DstAlpha = 8,
    OneMinusDstAlpha = 9,
    ConstantColor = 10,
    OneMinusConstantColor = 11,
    ConstantAlpha = 12,
    OneMinusConstantAlpha = 13,
    SrcAlphaSaturate = 14,
    Src1Color = 15,
    OneMinusSrc1Color = 16,
    Src1Alpha = 17,
    OneMinusSrc1Alpha = 18,
};

BlendOp :: enum i32 {
    Add = 0,
    Subtract = 1,
    ReverseSubtract = 2,
    Min = 3,
    Max = 4,
    ZeroExt = 1000148000,
    SrcExt = 1000148001,
    DstExt = 1000148002,
    SrcOverExt = 1000148003,
    DstOverExt = 1000148004,
    SrcInExt = 1000148005,
    DstInExt = 1000148006,
    SrcOutExt = 1000148007,
    DstOutExt = 1000148008,
    SrcAtopExt = 1000148009,
    DstAtopExt = 1000148010,
    XorExt = 1000148011,
    MultiplyExt = 1000148012,
    ScreenExt = 1000148013,
    OverlayExt = 1000148014,
    DarkenExt = 1000148015,
    LightenExt = 1000148016,
    ColordodgeExt = 1000148017,
    ColorburnExt = 1000148018,
    HardlightExt = 1000148019,
    SoftlightExt = 1000148020,
    DifferenceExt = 1000148021,
    ExclusionExt = 1000148022,
    InvertExt = 1000148023,
    InvertRgbExt = 1000148024,
    LineardodgeExt = 1000148025,
    LinearburnExt = 1000148026,
    VividlightExt = 1000148027,
    LinearlightExt = 1000148028,
    PinlightExt = 1000148029,
    HardmixExt = 1000148030,
    HslHueExt = 1000148031,
    HslSaturationExt = 1000148032,
    HslColorExt = 1000148033,
    HslLuminosityExt = 1000148034,
    PlusExt = 1000148035,
    PlusClampedExt = 1000148036,
    PlusClampedAlphaExt = 1000148037,
    PlusDarkerExt = 1000148038,
    MinusExt = 1000148039,
    MinusClampedExt = 1000148040,
    ContrastExt = 1000148041,
    InvertOvgExt = 1000148042,
    RedExt = 1000148043,
    GreenExt = 1000148044,
    BlueExt = 1000148045,
};

DynamicState :: enum i32 {
    Viewport = 0,
    Scissor = 1,
    LineWidth = 2,
    DepthBias = 3,
    BlendConstants = 4,
    DepthBounds = 5,
    StencilCompareMask = 6,
    StencilWriteMask = 7,
    StencilReference = 8,
    ViewportW_scalingNv = 1000087000,
    DiscardRectangleExt = 1000099000,
    SampleLocationsExt = 1000143000,
    ViewportShadingRatePaletteNv = 1000164004,
    ViewportCoarseSampleOrderNv = 1000164006,
    ExclusiveScissorNv = 1000205001,
    LineStippleExt = 1000259000,
};

Filter :: enum i32 {
    Nearest = 0,
    Linear = 1,
    CubicImg = 1000015000,
    CubicExt = 1000015000,
};

SamplerMipmapMode :: enum i32 {
    Nearest = 0,
    Linear = 1,
};

SamplerAddressMode :: enum i32 {
    Repeat = 0,
    MirroredRepeat = 1,
    ClampToEdge = 2,
    ClampToBorder = 3,
    MirrorClampToEdge = 4,
    MirrorClampToEdgeKhr = 4,
};

BorderColor :: enum i32 {
    FloatTransparentBlack = 0,
    IntTransparentBlack = 1,
    FloatOpaqueBlack = 2,
    IntOpaqueBlack = 3,
    FloatOpaqueWhite = 4,
    IntOpaqueWhite = 5,
    FloatCustomExt = 1000287003,
    IntCustomExt = 1000287004,
};

DescriptorType :: enum i32 {
    Sampler = 0,
    CombinedImageSampler = 1,
    SampledImage = 2,
    StorageImage = 3,
    UniformTexelBuffer = 4,
    StorageTexelBuffer = 5,
    UniformBuffer = 6,
    StorageBuffer = 7,
    UniformBufferDynamic = 8,
    StorageBufferDynamic = 9,
    InputAttachment = 10,
    InlineUniformBlockExt = 1000138000,
    AccelerationStructureKhr = 1000165000,
    AccelerationStructureNv = 1000165000,
};

AttachmentLoadOp :: enum i32 {
    Load = 0,
    Clear = 1,
    DontCare = 2,
};

AttachmentStoreOp :: enum i32 {
    Store = 0,
    DontCare = 1,
    NoneQcom = 1000301000,
};

PipelineBindPoint :: enum i32 {
    Graphics = 0,
    Compute = 1,
    RayTracingKhr = 1000165000,
    RayTracingNv = 1000165000,
};

CommandBufferLevel :: enum i32 {
    Primary = 0,
    Secondary = 1,
};

IndexType :: enum i32 {
    Uint16 = 0,
    Uint32 = 1,
    NoneKhr = 1000165000,
    Uint8Ext = 1000265000,
    NoneNv = 1000165000,
};

SubpassContents :: enum i32 {
    Inline = 0,
    SecondaryCommandBuffers = 1,
};

ObjectType :: enum i32 {
    Unknown = 0,
    Instance = 1,
    PhysicalDevice = 2,
    Device = 3,
    Queue = 4,
    Semaphore = 5,
    CommandBuffer = 6,
    Fence = 7,
    DeviceMemory = 8,
    Buffer = 9,
    Image = 10,
    Event = 11,
    QueryPool = 12,
    BufferView = 13,
    ImageView = 14,
    ShaderModule = 15,
    PipelineCache = 16,
    PipelineLayout = 17,
    RenderPass = 18,
    Pipeline = 19,
    DescriptorSetLayout = 20,
    Sampler = 21,
    DescriptorPool = 22,
    DescriptorSet = 23,
    Framebuffer = 24,
    CommandPool = 25,
    SamplerYcbcrConversion = 1000156000,
    DescriptorUpdateTemplate = 1000085000,
    SurfaceKhr = 1000000000,
    SwapchainKhr = 1000001000,
    DisplayKhr = 1000002000,
    DisplayModeKhr = 1000002001,
    DebugReportCallbackExt = 1000011000,
    DebugUtilsMessengerExt = 1000128000,
    AccelerationStructureKhr = 1000165000,
    ValidationCacheExt = 1000160000,
    PerformanceConfigurationIntel = 1000210000,
    DeferredOperationKhr = 1000268000,
    IndirectCommandsLayoutNv = 1000277000,
    PrivateDataSlotExt = 1000295000,
    DescriptorUpdateTemplateKhr = 1000085000,
    SamplerYcbcrConversionKhr = 1000156000,
    AccelerationStructureNv = 1000165000,
};

VendorId :: enum i32 {
    Viv = 65537,
    Vsi = 65538,
    Kazan = 65539,
    Codeplay = 65540,
    Mesa = 65541,
};

FormatFeatureFlagBits :: enum i32 {
    SampledImage = 1,
    StorageImage = 2,
    StorageImageAtomic = 4,
    UniformTexelBuffer = 8,
    StorageTexelBuffer = 16,
    StorageTexelBufferAtomic = 32,
    VertexBuffer = 64,
    ColorAttachment = 128,
    ColorAttachmentBlend = 256,
    DepthStencilAttachment = 512,
    BlitSrc = 1024,
    BlitDst = 2048,
    SampledImageFilterLinear = 4096,
    TransferSrc = 16384,
    TransferDst = 32768,
    MidpointChromaSamples = 131072,
    SampledImageYcbcrConversionLinearFilter = 262144,
    SampledImageYcbcrConversionSeparateReconstructionFilter = 524288,
    SampledImageYcbcrConversionChromaReconstructionExplicit = 1048576,
    SampledImageYcbcrConversionChromaReconstructionExplicitForceable = 2097152,
    Disjoint = 4194304,
    CositedChromaSamples = 8388608,
    SampledImageFilterMinmax = 65536,
    SampledImageFilterCubicImg = 8192,
    AccelerationStructureVertexBufferKhr = 536870912,
    FragmentDensityMapExt = 16777216,
    TransferSrcKhr = 16384,
    TransferDstKhr = 32768,
    SampledImageFilterMinmaxExt = 65536,
    MidpointChromaSamplesKhr = 131072,
    SampledImageYcbcrConversionLinearFilterKhr = 262144,
    SampledImageYcbcrConversionSeparateReconstructionFilterKhr = 524288,
    SampledImageYcbcrConversionChromaReconstructionExplicitKhr = 1048576,
    SampledImageYcbcrConversionChromaReconstructionExplicitForceableKhr = 2097152,
    DisjointKhr = 4194304,
    CositedChromaSamplesKhr = 8388608,
    SampledImageFilterCubicExt = 8192,
};

ImageUsageFlagBits :: enum i32 {
    TransferSrc = 1,
    TransferDst = 2,
    Sampled = 4,
    Storage = 8,
    ColorAttachment = 16,
    DepthStencilAttachment = 32,
    TransientAttachment = 64,
    InputAttachment = 128,
    ShadingRateImageNv = 256,
    FragmentDensityMapExt = 512,
};

ImageCreateFlagBits :: enum i32 {
    SparseBinding = 1,
    SparseResidency = 2,
    SparseAliased = 4,
    MutableFormat = 8,
    CubeCompatible = 16,
    Alias = 1024,
    SplitInstanceBindRegions = 64,
    _2DArrayCompatible = 32,
    BlockTexelViewCompatible = 128,
    ExtendedUsage = 256,
    Protected = 2048,
    Disjoint = 512,
    CornerSampledNv = 8192,
    SampleLocationsCompatibleDepthExt = 4096,
    SubsampledExt = 16384,
    SplitInstanceBindRegionsKhr = 64,
    _2DArrayCompatibleKhr = 32,
    BlockTexelViewCompatibleKhr = 128,
    ExtendedUsageKhr = 256,
    DisjointKhr = 512,
    AliasKhr = 1024,
};

SampleCountFlagBits :: enum i32 {
    _1 = 1,
    _2 = 2,
    _4 = 4,
    _8 = 8,
    _16 = 16,
    _32 = 32,
    _64 = 64,
};

QueueFlagBits :: enum i32 {
    Graphics = 1,
    Compute = 2,
    Transfer = 4,
    SparseBinding = 8,
    Protected = 16,
};

MemoryPropertyFlagBits :: enum i32 {
    DeviceLocal = 1,
    HostVisible = 2,
    HostCoherent = 4,
    HostCached = 8,
    LazilyAllocated = 16,
    Protected = 32,
    DeviceCoherentAmd = 64,
    DeviceUncachedAmd = 128,
};

MemoryHeapFlagBits :: enum i32 {
    DeviceLocal = 1,
    MultiInstance = 2,
    MultiInstanceKhr = 2,
};

DeviceQueueCreateFlagBits :: enum i32 {
    Protected = 1,
};

PipelineStageFlagBits :: enum i32 {
    TopOfPipe = 1,
    DrawIndirect = 2,
    VertexInput = 4,
    VertexShader = 8,
    TessellationControlShader = 16,
    TessellationEvaluationShader = 32,
    GeometryShader = 64,
    FragmentShader = 128,
    EarlyFragmentTests = 256,
    LateFragmentTests = 512,
    ColorAttachmentOutput = 1024,
    ComputeShader = 2048,
    Transfer = 4096,
    BottomOfPipe = 8192,
    Host = 16384,
    AllGraphics = 32768,
    AllCommands = 65536,
    TransformFeedbackExt = 16777216,
    ConditionalRenderingExt = 262144,
    RayTracingShaderKhr = 2097152,
    AccelerationStructureBuildKhr = 33554432,
    ShadingRateImageNv = 4194304,
    TaskShaderNv = 524288,
    MeshShaderNv = 1048576,
    FragmentDensityProcessExt = 8388608,
    CommandPreprocessNv = 131072,
    RayTracingShaderNv = 2097152,
    AccelerationStructureBuildNv = 33554432,
};

ImageAspectFlagBits :: enum i32 {
    Color = 1,
    Depth = 2,
    Stencil = 4,
    Metadata = 8,
    Plane0 = 16,
    Plane1 = 32,
    Plane2 = 64,
    MemoryPlane0_ext = 128,
    MemoryPlane1_ext = 256,
    MemoryPlane2_ext = 512,
    MemoryPlane3_ext = 1024,
    Plane0_khr = 16,
    Plane1_khr = 32,
    Plane2_khr = 64,
};

SparseImageFormatFlagBits :: enum i32 {
    SingleMiptail = 1,
    AlignedMipSize = 2,
    NonstandardBlockSize = 4,
};

SparseMemoryBindFlagBits :: enum i32 {
    Metadata = 1,
};

FenceCreateFlagBits :: enum i32 {
    Signaled = 1,
};

QueryPipelineStatisticFlagBits :: enum i32 {
    InputAssemblyVertices = 1,
    InputAssemblyPrimitives = 2,
    VertexShaderInvocations = 4,
    GeometryShaderInvocations = 8,
    GeometryShaderPrimitives = 16,
    ClippingInvocations = 32,
    ClippingPrimitives = 64,
    FragmentShaderInvocations = 128,
    TessellationControlShaderPatches = 256,
    TessellationEvaluationShaderInvocations = 512,
    ComputeShaderInvocations = 1024,
};

QueryResultFlagBits :: enum i32 {
    _64 = 1,
    Wait = 2,
    WithAvailability = 4,
    Partial = 8,
};

BufferCreateFlagBits :: enum i32 {
    SparseBinding = 1,
    SparseResidency = 2,
    SparseAliased = 4,
    Protected = 8,
    DeviceAddressCaptureReplay = 16,
    DeviceAddressCaptureReplayExt = 16,
    DeviceAddressCaptureReplayKhr = 16,
};

BufferUsageFlagBits :: enum i32 {
    TransferSrc = 1,
    TransferDst = 2,
    UniformTexelBuffer = 4,
    StorageTexelBuffer = 8,
    UniformBuffer = 16,
    StorageBuffer = 32,
    IndexBuffer = 64,
    VertexBuffer = 128,
    IndirectBuffer = 256,
    ShaderDeviceAddress = 131072,
    TransformFeedbackBufferExt = 2048,
    TransformFeedbackCounterBufferExt = 4096,
    ConditionalRenderingExt = 512,
    RayTracingKhr = 1024,
    RayTracingNv = 1024,
    ShaderDeviceAddressExt = 131072,
    ShaderDeviceAddressKhr = 131072,
};

ImageViewCreateFlagBits :: enum i32 {
    FragmentDensityMapDynamicExt = 1,
};

ShaderModuleCreateFlagBits :: enum i32 {
};

PipelineCacheCreateFlagBits :: enum i32 {
    ExternallySynchronizedExt = 1,
};

PipelineCreateFlagBits :: enum i32 {
    DisableOptimization = 1,
    AllowDerivatives = 2,
    Derivative = 4,
    ViewIndexFromDeviceIndex = 8,
    DispatchBase = 16,
    RayTracingNoNullAnyHitShadersKhr = 16384,
    RayTracingNoNullClosestHitShadersKhr = 32768,
    RayTracingNoNullMissShadersKhr = 65536,
    RayTracingNoNullIntersectionShadersKhr = 131072,
    RayTracingSkipTrianglesKhr = 4096,
    RayTracingSkipAabbsKhr = 8192,
    DeferCompileNv = 32,
    CaptureStatisticsKhr = 64,
    CaptureInternalRepresentationsKhr = 128,
    IndirectBindableNv = 262144,
    LibraryKhr = 2048,
    FailOnPipelineCompileRequiredExt = 256,
    EarlyReturnOnFailureExt = 512,
    ViewIndexFromDeviceIndexKhr = 8,
    DispatchBaseKhr = 16,
};

PipelineShaderStageCreateFlagBits :: enum i32 {
    AllowVaryingSubgroupSizeExt = 1,
    RequireFullSubgroupsExt = 2,
};

ShaderStageFlagBits :: enum i32 {
    Vertex = 1,
    TessellationControl = 2,
    TessellationEvaluation = 4,
    Geometry = 8,
    Fragment = 16,
    Compute = 32,
    AllGraphics = 31,
    All = 2147483647,
    RaygenKhr = 256,
    AnyHitKhr = 512,
    ClosestHitKhr = 1024,
    MissKhr = 2048,
    IntersectionKhr = 4096,
    CallableKhr = 8192,
    TaskNv = 64,
    MeshNv = 128,
    RaygenNv = 256,
    AnyHitNv = 512,
    ClosestHitNv = 1024,
    MissNv = 2048,
    IntersectionNv = 4096,
    CallableNv = 8192,
};

CullModeFlagBits :: enum i32 {
    None = 0,
    Front = 1,
    Back = 2,
    FrontAndBack = 3,
};

ColorComponentFlagBits :: enum i32 {
    R = 1,
    G = 2,
    B = 4,
    A = 8,
};

SamplerCreateFlagBits :: enum i32 {
    SubsampledExt = 1,
    SubsampledCoarseReconstructionExt = 2,
};

DescriptorSetLayoutCreateFlagBits :: enum i32 {
    UpdateAfterBindPool = 2,
    PushDescriptorKhr = 1,
    UpdateAfterBindPoolExt = 2,
};

DescriptorPoolCreateFlagBits :: enum i32 {
    FreeDescriptorSet = 1,
    UpdateAfterBind = 2,
    UpdateAfterBindExt = 2,
};

FramebufferCreateFlagBits :: enum i32 {
    Imageless = 1,
    ImagelessKhr = 1,
};

RenderPassCreateFlagBits :: enum i32 {
    TransformBitQcom = 2,
};

AttachmentDescriptionFlagBits :: enum i32 {
    MayAlias = 1,
};

SubpassDescriptionFlagBits :: enum i32 {
    PerViewAttributesNvx = 1,
    PerViewPositionX_onlyNvx = 2,
    FragmentRegionBitQcom = 4,
    ShaderResolveBitQcom = 8,
};

AccessFlagBits :: enum i32 {
    IndirectCommandRead = 1,
    IndexRead = 2,
    VertexAttributeRead = 4,
    UniformRead = 8,
    InputAttachmentRead = 16,
    ShaderRead = 32,
    ShaderWrite = 64,
    ColorAttachmentRead = 128,
    ColorAttachmentWrite = 256,
    DepthStencilAttachmentRead = 512,
    DepthStencilAttachmentWrite = 1024,
    TransferRead = 2048,
    TransferWrite = 4096,
    HostRead = 8192,
    HostWrite = 16384,
    MemoryRead = 32768,
    MemoryWrite = 65536,
    TransformFeedbackWriteExt = 33554432,
    TransformFeedbackCounterReadExt = 67108864,
    TransformFeedbackCounterWriteExt = 134217728,
    ConditionalRenderingReadExt = 1048576,
    ColorAttachmentReadNoncoherentExt = 524288,
    AccelerationStructureReadKhr = 2097152,
    AccelerationStructureWriteKhr = 4194304,
    ShadingRateImageReadNv = 8388608,
    FragmentDensityMapReadExt = 16777216,
    CommandPreprocessReadNv = 131072,
    CommandPreprocessWriteNv = 262144,
    AccelerationStructureReadNv = 2097152,
    AccelerationStructureWriteNv = 4194304,
};

DependencyFlagBits :: enum i32 {
    ByRegion = 1,
    DeviceGroup = 4,
    ViewLocal = 2,
    ViewLocalKhr = 2,
    DeviceGroupKhr = 4,
};

CommandPoolCreateFlagBits :: enum i32 {
    Transient = 1,
    ResetCommandBuffer = 2,
    Protected = 4,
};

CommandPoolResetFlagBits :: enum i32 {
    ReleaseResources = 1,
};

CommandBufferUsageFlagBits :: enum i32 {
    OneTimeSubmit = 1,
    RenderPassContinue = 2,
    SimultaneousUse = 4,
};

QueryControlFlagBits :: enum i32 {
    Precise = 1,
};

CommandBufferResetFlagBits :: enum i32 {
    ReleaseResources = 1,
};

StencilFaceFlagBits :: enum i32 {
    Front = 1,
    Back = 2,
    FrontAndBack = 3,
    StencilFrontAndBack = 3,
};

PointClippingBehavior :: enum i32 {
    AllClipPlanes = 0,
    UserClipPlanesOnly = 1,
    AllClipPlanesKhr = 0,
    UserClipPlanesOnlyKhr = 1,
};

TessellationDomainOrigin :: enum i32 {
    UpperLeft = 0,
    LowerLeft = 1,
    UpperLeftKhr = 0,
    LowerLeftKhr = 1,
};

SamplerYcbcrModelConversion :: enum i32 {
    RgbIdentity = 0,
    YcbcrIdentity = 1,
    Ycbcr709 = 2,
    Ycbcr601 = 3,
    Ycbcr2020 = 4,
    RgbIdentityKhr = 0,
    YcbcrIdentityKhr = 1,
    Ycbcr709Khr = 2,
    Ycbcr601Khr = 3,
    Ycbcr2020Khr = 4,
};

SamplerYcbcrRange :: enum i32 {
    ItuFull = 0,
    ItuNarrow = 1,
    ItuFullKhr = 0,
    ItuNarrowKhr = 1,
};

ChromaLocation :: enum i32 {
    CositedEven = 0,
    Midpoint = 1,
    CositedEvenKhr = 0,
    MidpointKhr = 1,
};

DescriptorUpdateTemplateType :: enum i32 {
    DescriptorSet = 0,
    PushDescriptorsKhr = 1,
    DescriptorSetKhr = 0,
};

SubgroupFeatureFlagBits :: enum i32 {
    Basic = 1,
    Vote = 2,
    Arithmetic = 4,
    Ballot = 8,
    Shuffle = 16,
    ShuffleRelative = 32,
    Clustered = 64,
    Quad = 128,
    PartitionedNv = 256,
};

PeerMemoryFeatureFlagBits :: enum i32 {
    CopySrc = 1,
    CopyDst = 2,
    GenericSrc = 4,
    GenericDst = 8,
    CopySrcKhr = 1,
    CopyDstKhr = 2,
    GenericSrcKhr = 4,
    GenericDstKhr = 8,
};

MemoryAllocateFlagBits :: enum i32 {
    DeviceMask = 1,
    DeviceAddress = 2,
    DeviceAddressCaptureReplay = 4,
    DeviceMaskKhr = 1,
    DeviceAddressKhr = 2,
    DeviceAddressCaptureReplayKhr = 4,
};

ExternalMemoryHandleTypeFlagBits :: enum i32 {
    OpaqueFd = 1,
    OpaqueWin32 = 2,
    OpaqueWin32Kmt = 4,
    D3D11Texture = 8,
    D3D11TextureKmt = 16,
    D3D12Heap = 32,
    D3D12Resource = 64,
    DmaBufExt = 512,
    AndroidHardwareBufferBitAndroid = 1024,
    HostAllocationExt = 128,
    HostMappedForeignMemoryExt = 256,
    OpaqueFdKhr = 1,
    OpaqueWin32Khr = 2,
    OpaqueWin32KmtKhr = 4,
    D3D11TextureKhr = 8,
    D3D11TextureKmtKhr = 16,
    D3D12HeapKhr = 32,
    D3D12ResourceKhr = 64,
};

ExternalMemoryFeatureFlagBits :: enum i32 {
    DedicatedOnly = 1,
    Exportable = 2,
    Importable = 4,
    DedicatedOnlyKhr = 1,
    ExportableKhr = 2,
    ImportableKhr = 4,
};

ExternalFenceHandleTypeFlagBits :: enum i32 {
    OpaqueFd = 1,
    OpaqueWin32 = 2,
    OpaqueWin32Kmt = 4,
    SyncFd = 8,
    OpaqueFdKhr = 1,
    OpaqueWin32Khr = 2,
    OpaqueWin32KmtKhr = 4,
    SyncFdKhr = 8,
};

ExternalFenceFeatureFlagBits :: enum i32 {
    Exportable = 1,
    Importable = 2,
    ExportableKhr = 1,
    ImportableKhr = 2,
};

FenceImportFlagBits :: enum i32 {
    Temporary = 1,
    TemporaryKhr = 1,
};

SemaphoreImportFlagBits :: enum i32 {
    Temporary = 1,
    TemporaryKhr = 1,
};

ExternalSemaphoreHandleTypeFlagBits :: enum i32 {
    OpaqueFd = 1,
    OpaqueWin32 = 2,
    OpaqueWin32Kmt = 4,
    D3D12Fence = 8,
    SyncFd = 16,
    OpaqueFdKhr = 1,
    OpaqueWin32Khr = 2,
    OpaqueWin32KmtKhr = 4,
    D3D12FenceKhr = 8,
    SyncFdKhr = 16,
};

ExternalSemaphoreFeatureFlagBits :: enum i32 {
    Exportable = 1,
    Importable = 2,
    ExportableKhr = 1,
    ImportableKhr = 2,
};

DriverId :: enum i32 {
    AmdProprietary = 1,
    AmdOpenSource = 2,
    MesaRadv = 3,
    NvidiaProprietary = 4,
    IntelProprietaryWindows = 5,
    IntelOpenSourceMesa = 6,
    ImaginationProprietary = 7,
    QualcommProprietary = 8,
    ArmProprietary = 9,
    GoogleSwiftshader = 10,
    GgpProprietary = 11,
    BroadcomProprietary = 12,
    MesaLlvmpipe = 13,
    AmdProprietaryKhr = 1,
    AmdOpenSourceKhr = 2,
    MesaRadvKhr = 3,
    NvidiaProprietaryKhr = 4,
    IntelProprietaryWindowsKhr = 5,
    IntelOpenSourceMesaKhr = 6,
    ImaginationProprietaryKhr = 7,
    QualcommProprietaryKhr = 8,
    ArmProprietaryKhr = 9,
    GoogleSwiftshaderKhr = 10,
    GgpProprietaryKhr = 11,
    BroadcomProprietaryKhr = 12,
};

ShaderFloatControlsIndependence :: enum i32 {
    _32BitOnly = 0,
    All = 1,
    None = 2,
    _32BitOnlyKhr = 0,
    AllKhr = 1,
    NoneKhr = 2,
};

SamplerReductionMode :: enum i32 {
    WeightedAverage = 0,
    Min = 1,
    Max = 2,
    WeightedAverageExt = 0,
    MinExt = 1,
    MaxExt = 2,
};

SemaphoreType :: enum i32 {
    Binary = 0,
    Timeline = 1,
    BinaryKhr = 0,
    TimelineKhr = 1,
};

ResolveModeFlagBits :: enum i32 {
    None = 0,
    SampleZero = 1,
    Average = 2,
    Min = 4,
    Max = 8,
    NoneKhr = 0,
    SampleZeroKhr = 1,
    AverageKhr = 2,
    MinKhr = 4,
    MaxKhr = 8,
};

DescriptorBindingFlagBits :: enum i32 {
    UpdateAfterBind = 1,
    UpdateUnusedWhilePending = 2,
    PartiallyBound = 4,
    VariableDescriptorCount = 8,
    UpdateAfterBindExt = 1,
    UpdateUnusedWhilePendingExt = 2,
    PartiallyBoundExt = 4,
    VariableDescriptorCountExt = 8,
};

SemaphoreWaitFlagBits :: enum i32 {
    Any = 1,
    AnyKhr = 1,
};

PresentModeKHR :: enum i32 {
    Immediate = 0,
    Mailbox = 1,
    Fifo = 2,
    FifoRelaxed = 3,
    SharedDemandRefresh = 1000111000,
    SharedContinuousRefresh = 1000111001,
};

ColorSpaceKHR :: enum i32 {
    SrgbNonlinear = 0,
    DisplayP3NonlinearExt = 1000104001,
    ExtendedSrgbLinearExt = 1000104002,
    DisplayP3LinearExt = 1000104003,
    DciP3NonlinearExt = 1000104004,
    Bt709LinearExt = 1000104005,
    Bt709NonlinearExt = 1000104006,
    Bt2020LinearExt = 1000104007,
    Hdr10St2084Ext = 1000104008,
    DolbyvisionExt = 1000104009,
    Hdr10HlgExt = 1000104010,
    AdobergbLinearExt = 1000104011,
    AdobergbNonlinearExt = 1000104012,
    PassThroughExt = 1000104013,
    ExtendedSrgbNonlinearExt = 1000104014,
    DisplayNativeAmd = 1000213000,
    ColorspaceSrgbNonlinear = 0,
    DciP3LinearExt = 1000104003,
};

SurfaceTransformFlagBitsKHR :: enum i32 {
    Identity = 1,
    Rotate90 = 2,
    Rotate180 = 4,
    Rotate270 = 8,
    HorizontalMirror = 16,
    HorizontalMirrorRotate90 = 32,
    HorizontalMirrorRotate180 = 64,
    HorizontalMirrorRotate270 = 128,
    Inherit = 256,
};

CompositeAlphaFlagBitsKHR :: enum i32 {
    Opaque = 1,
    PreMultiplied = 2,
    PostMultiplied = 4,
    Inherit = 8,
};

SwapchainCreateFlagBitsKHR :: enum i32 {
    SplitInstanceBindRegions = 1,
    Protected = 2,
    MutableFormat = 4,
};

DeviceGroupPresentModeFlagBitsKHR :: enum i32 {
    Local = 1,
    Remote = 2,
    Sum = 4,
    LocalMultiDevice = 8,
};

DisplayPlaneAlphaFlagBitsKHR :: enum i32 {
    Opaque = 1,
    Global = 2,
    PerPixel = 4,
    PerPixelPremultiplied = 8,
};

PerformanceCounterUnitKHR :: enum i32 {
    Generic = 0,
    Percentage = 1,
    Nanoseconds = 2,
    Bytes = 3,
    BytesPerSecond = 4,
    Kelvin = 5,
    Watts = 6,
    Volts = 7,
    Amps = 8,
    Hertz = 9,
    Cycles = 10,
};

PerformanceCounterScopeKHR :: enum i32 {
    CommandBuffer = 0,
    RenderPass = 1,
    Command = 2,
    QueryScopeCommandBuffer = 0,
    QueryScopeRenderPass = 1,
    QueryScopeCommand = 2,
};

PerformanceCounterStorageKHR :: enum i32 {
    Int32 = 0,
    Int64 = 1,
    Uint32 = 2,
    Uint64 = 3,
    Float32 = 4,
    Float64 = 5,
};

PerformanceCounterDescriptionFlagBitsKHR :: enum i32 {
    PerformanceImpacting = 1,
    ConcurrentlyImpacted = 2,
};

AcquireProfilingLockFlagBitsKHR :: enum i32 {
};

PipelineExecutableStatisticFormatKHR :: enum i32 {
    Bool32 = 0,
    Int64 = 1,
    Uint64 = 2,
    Float64 = 3,
};

DebugReportObjectTypeEXT :: enum i32 {
    Unknown = 0,
    Instance = 1,
    PhysicalDevice = 2,
    Device = 3,
    Queue = 4,
    Semaphore = 5,
    CommandBuffer = 6,
    Fence = 7,
    DeviceMemory = 8,
    Buffer = 9,
    Image = 10,
    Event = 11,
    QueryPool = 12,
    BufferView = 13,
    ImageView = 14,
    ShaderModule = 15,
    PipelineCache = 16,
    PipelineLayout = 17,
    RenderPass = 18,
    Pipeline = 19,
    DescriptorSetLayout = 20,
    Sampler = 21,
    DescriptorPool = 22,
    DescriptorSet = 23,
    Framebuffer = 24,
    CommandPool = 25,
    SurfaceKhr = 26,
    SwapchainKhr = 27,
    DebugReportCallback = 28,
    DisplayKhr = 29,
    DisplayModeKhr = 30,
    ValidationCache = 33,
    SamplerYcbcrConversion = 1000156000,
    DescriptorUpdateTemplate = 1000085000,
    AccelerationStructureKhr = 1000165000,
    DebugReport = 28,
    DescriptorUpdateTemplateKhr = 1000085000,
    SamplerYcbcrConversionKhr = 1000156000,
    AccelerationStructureNv = 1000165000,
};

DebugReportFlagBitsEXT :: enum i32 {
    Information = 1,
    Warning = 2,
    PerformanceWarning = 4,
    Error = 8,
    Debug = 16,
};

RasterizationOrderAMD :: enum i32 {
    Strict = 0,
    Relaxed = 1,
};

ShaderInfoTypeAMD :: enum i32 {
    Statistics = 0,
    Binary = 1,
    Disassembly = 2,
};

ExternalMemoryHandleTypeFlagBitsNV :: enum i32 {
    OpaqueWin32 = 1,
    OpaqueWin32Kmt = 2,
    D3D11Image = 4,
    D3D11ImageKmt = 8,
};

ExternalMemoryFeatureFlagBitsNV :: enum i32 {
    DedicatedOnly = 1,
    Exportable = 2,
    Importable = 4,
};

ValidationCheckEXT :: enum i32 {
    All = 0,
    Shaders = 1,
};

ConditionalRenderingFlagBitsEXT :: enum i32 {
    Inverted = 1,
};

SurfaceCounterFlagBitsEXT :: enum i32 {
    Vblank = 1,
};

DisplayPowerStateEXT :: enum i32 {
    Off = 0,
    Suspend = 1,
    On = 2,
};

DeviceEventTypeEXT :: enum i32 {
    DisplayHotplug = 0,
};

DisplayEventTypeEXT :: enum i32 {
    FirstPixelOut = 0,
};

ViewportCoordinateSwizzleNV :: enum i32 {
    PositiveX = 0,
    NegativeX = 1,
    PositiveY = 2,
    NegativeY = 3,
    PositiveZ = 4,
    NegativeZ = 5,
    PositiveW = 6,
    NegativeW = 7,
};

DiscardRectangleModeEXT :: enum i32 {
    Inclusive = 0,
    Exclusive = 1,
};

ConservativeRasterizationModeEXT :: enum i32 {
    Disabled = 0,
    Overestimate = 1,
    Underestimate = 2,
};

DebugUtilsMessageSeverityFlagBitsEXT :: enum i32 {
    Verbose = 1,
    Info = 16,
    Warning = 256,
    Error = 4096,
};

DebugUtilsMessageTypeFlagBitsEXT :: enum i32 {
    General = 1,
    Validation = 2,
    Performance = 4,
};

BlendOverlapEXT :: enum i32 {
    Uncorrelated = 0,
    Disjoint = 1,
    Conjoint = 2,
};

CoverageModulationModeNV :: enum i32 {
    None = 0,
    Rgb = 1,
    Alpha = 2,
    Rgba = 3,
};

ValidationCacheHeaderVersionEXT :: enum i32 {
    One = 1,
};

ShadingRatePaletteEntryNV :: enum i32 {
    NoInvocations = 0,
    _16InvocationsPerPixel = 1,
    _8_invocationsPerPixel = 2,
    _4_invocationsPerPixel = 3,
    _2_invocationsPerPixel = 4,
    _1_invocationPerPixel = 5,
    _1_invocationPer2X1Pixels = 6,
    _1_invocationPer1X2Pixels = 7,
    _1_invocationPer2X2Pixels = 8,
    _1_invocationPer4X2Pixels = 9,
    _1_invocationPer2X4Pixels = 10,
    _1_invocationPer4X4Pixels = 11,
};

CoarseSampleOrderTypeNV :: enum i32 {
    Default = 0,
    Custom = 1,
    PixelMajor = 2,
    SampleMajor = 3,
};

RayTracingShaderGroupTypeKHR :: enum i32 {
    General = 0,
    TrianglesHitGroup = 1,
    ProceduralHitGroup = 2,
    GeneralNv = 0,
    TrianglesHitGroupNv = 1,
    ProceduralHitGroupNv = 2,
};

GeometryTypeKHR :: enum i32 {
    Triangles = 0,
    Aabbs = 1,
    Instances = 1000150000,
    TrianglesNv = 0,
    AabbsNv = 1,
};

AccelerationStructureTypeKHR :: enum i32 {
    TopLevel = 0,
    BottomLevel = 1,
    TopLevelNv = 0,
    BottomLevelNv = 1,
};

CopyAccelerationStructureModeKHR :: enum i32 {
    Clone = 0,
    Compact = 1,
    Serialize = 2,
    Deserialize = 3,
    CloneNv = 0,
    CompactNv = 1,
};

AccelerationStructureMemoryRequirementsTypeKHR :: enum i32 {
    Object = 0,
    BuildScratch = 1,
    UpdateScratch = 2,
    ObjectNv = 0,
    BuildScratchNv = 1,
    UpdateScratchNv = 2,
};

GeometryFlagBitsKHR :: enum i32 {
    Opaque = 1,
    NoDuplicateAnyHitInvocation = 2,
    OpaqueNv = 1,
    NoDuplicateAnyHitInvocationNv = 2,
};

GeometryInstanceFlagBitsKHR :: enum i32 {
    TriangleFacingCullDisable = 1,
    TriangleFrontCounterclockwise = 2,
    ForceOpaque = 4,
    ForceNoOpaque = 8,
    TriangleCullDisableNv = 1,
    TriangleFrontCounterclockwiseNv = 2,
    ForceOpaqueNv = 4,
    ForceNoOpaqueNv = 8,
};

BuildAccelerationStructureFlagBitsKHR :: enum i32 {
    AllowUpdate = 1,
    AllowCompaction = 2,
    PreferFastTrace = 4,
    PreferFastBuild = 8,
    LowMemory = 16,
    AllowUpdateNv = 1,
    AllowCompactionNv = 2,
    PreferFastTraceNv = 4,
    PreferFastBuildNv = 8,
    LowMemoryNv = 16,
};

QueueGlobalPriorityEXT :: enum i32 {
    Low = 128,
    Medium = 256,
    High = 512,
    Realtime = 1024,
};

PipelineCompilerControlFlagBitsAMD :: enum i32 {
};

TimeDomainEXT :: enum i32 {
    Device = 0,
    ClockMonotonic = 1,
    ClockMonotonicRaw = 2,
    QueryPerformanceCounter = 3,
};

MemoryOverallocationBehaviorAMD :: enum i32 {
    Default = 0,
    Allowed = 1,
    Disallowed = 2,
};

PipelineCreationFeedbackFlagBitsEXT :: enum i32 {
    Valid = 1,
    ApplicationPipelineCacheHit = 2,
    BasePipelineAcceleration = 4,
};

PerformanceConfigurationTypeINTEL :: enum i32 {
    PerformanceConfigurationTypeCommandQueueMetricsDiscoveryActivatedIntel = 0,
    PerformanceConfigurationTypeMaxEnumIntel = 2147483647,
};

QueryPoolSamplingModeINTEL :: enum i32 {
    QueryPoolSamplingModeManualIntel = 0,
    QueryPoolSamplingModeMaxEnumIntel = 2147483647,
};

PerformanceOverrideTypeINTEL :: enum i32 {
    PerformanceOverrideTypeNullHardwareIntel = 0,
    PerformanceOverrideTypeFlushGpuCachesIntel = 1,
    PerformanceOverrideTypeMaxEnumIntel = 2147483647,
};

PerformanceParameterTypeINTEL :: enum i32 {
    PerformanceParameterTypeHwCountersSupportedIntel = 0,
    PerformanceParameterTypeStreamMarkerValidBitsIntel = 1,
    PerformanceParameterTypeMaxEnumIntel = 2147483647,
};

PerformanceValueTypeINTEL :: enum i32 {
    PerformanceValueTypeUint32Intel = 0,
    PerformanceValueTypeUint64Intel = 1,
    PerformanceValueTypeFloatIntel = 2,
    PerformanceValueTypeBoolIntel = 3,
    PerformanceValueTypeStringIntel = 4,
    PerformanceValueTypeMaxEnumIntel = 2147483647,
};

ShaderCorePropertiesFlagBitsAMD :: enum i32 {
};

ToolPurposeFlagBitsEXT :: enum i32 {
    Validation = 1,
    Profiling = 2,
    Tracing = 4,
    AdditionalFeatures = 8,
    ModifyingFeatures = 16,
    DebugReporting = 32,
    DebugMarkers = 64,
};

ValidationFeatureEnableEXT :: enum i32 {
    GpuAssisted = 0,
    GpuAssistedReserveBindingSlot = 1,
    BestPractices = 2,
    DebugPrintf = 3,
};

ValidationFeatureDisableEXT :: enum i32 {
    All = 0,
    Shaders = 1,
    ThreadSafety = 2,
    ApiParameters = 3,
    ObjectLifetimes = 4,
    CoreChecks = 5,
    UniqueHandles = 6,
};

ComponentTypeNV :: enum i32 {
    Float16 = 0,
    Float32 = 1,
    Float64 = 2,
    Sint8 = 3,
    Sint16 = 4,
    Sint32 = 5,
    Sint64 = 6,
    Uint8 = 7,
    Uint16 = 8,
    Uint32 = 9,
    Uint64 = 10,
};

ScopeNV :: enum i32 {
    Device = 1,
    Workgroup = 2,
    Subgroup = 3,
    QueueFamily = 5,
};

CoverageReductionModeNV :: enum i32 {
    Merge = 0,
    Truncate = 1,
};

LineRasterizationModeEXT :: enum i32 {
    Default = 0,
    Rectangular = 1,
    Bresenham = 2,
    RectangularSmooth = 3,
};

IndirectCommandsTokenTypeNV :: enum i32 {
    ShaderGroup = 0,
    StateFlags = 1,
    IndexBuffer = 2,
    VertexBuffer = 3,
    PushConstant = 4,
    DrawIndexed = 5,
    Draw = 6,
    DrawTasks = 7,
};

IndirectStateFlagBitsNV :: enum i32 {
    FlagFrontface = 1,
};

IndirectCommandsLayoutUsageFlagBitsNV :: enum i32 {
    ExplicitPreprocess = 1,
    IndexedSequences = 2,
    UnorderedSequences = 4,
};

PrivateDataSlotCreateFlagBitsEXT :: enum i32 {
};

DeviceDiagnosticsConfigFlagBitsNV :: enum i32 {
    EnableShaderDebugInfo = 1,
    EnableResourceTracking = 2,
    EnableAutomaticCheckpoints = 4,
};

InstanceT :: struct {};

PhysicalDeviceT :: struct {};

DeviceT :: struct {};

QueueT :: struct {};

SemaphoreT :: struct {};

CommandBufferT :: struct {};

FenceT :: struct {};

DeviceMemoryT :: struct {};

BufferT :: struct {};

ImageT :: struct {};

EventT :: struct {};

QueryPoolT :: struct {};

BufferViewT :: struct {};

ImageViewT :: struct {};

ShaderModuleT :: struct {};

PipelineCacheT :: struct {};

PipelineLayoutT :: struct {};

RenderPassT :: struct {};

PipelineT :: struct {};

DescriptorSetLayoutT :: struct {};

SamplerT :: struct {};

DescriptorPoolT :: struct {};

DescriptorSetT :: struct {};

FramebufferT :: struct {};

CommandPoolT :: struct {};

ApplicationInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    pApplicationName : cstring,
    applicationVersion : u32,
    pEngineName : cstring,
    engineVersion : u32,
    apiVersion : u32,
};

InstanceCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : InstanceCreateFlags,
    pApplicationInfo : ^ApplicationInfo,
    enabledLayerCount : u32,
    ppEnabledLayerNames : ^cstring,
    enabledExtensionCount : u32,
    ppEnabledExtensionNames : ^cstring,
};

AllocationCallbacks :: struct {
    pUserData : rawptr,
    pfnAllocation : PFN_AllocationFunction,
    pfnReallocation : PFN_ReallocationFunction,
    pfnFree : PFN_FreeFunction,
    pfnInternalAllocation : PFN_InternalAllocationNotification,
    pfnInternalFree : PFN_InternalFreeNotification,
};

PhysicalDeviceFeatures :: struct {
    robustBufferAccess : Bool32,
    fullDrawIndexUint32 : Bool32,
    imageCubeArray : Bool32,
    independentBlend : Bool32,
    geometryShader : Bool32,
    tessellationShader : Bool32,
    sampleRateShading : Bool32,
    dualSrcBlend : Bool32,
    logicOp : Bool32,
    multiDrawIndirect : Bool32,
    drawIndirectFirstInstance : Bool32,
    depthClamp : Bool32,
    depthBiasClamp : Bool32,
    fillModeNonSolid : Bool32,
    depthBounds : Bool32,
    wideLines : Bool32,
    largePoints : Bool32,
    alphaToOne : Bool32,
    multiViewport : Bool32,
    samplerAnisotropy : Bool32,
    textureCompressionETC2 : Bool32,
    textureCompressionASTC_LDR : Bool32,
    textureCompressionBC : Bool32,
    occlusionQueryPrecise : Bool32,
    pipelineStatisticsQuery : Bool32,
    vertexPipelineStoresAndAtomics : Bool32,
    fragmentStoresAndAtomics : Bool32,
    shaderTessellationAndGeometryPointSize : Bool32,
    shaderImageGatherExtended : Bool32,
    shaderStorageImageExtendedFormats : Bool32,
    shaderStorageImageMultisample : Bool32,
    shaderStorageImageReadWithoutFormat : Bool32,
    shaderStorageImageWriteWithoutFormat : Bool32,
    shaderUniformBufferArrayDynamicIndexing : Bool32,
    shaderSampledImageArrayDynamicIndexing : Bool32,
    shaderStorageBufferArrayDynamicIndexing : Bool32,
    shaderStorageImageArrayDynamicIndexing : Bool32,
    shaderClipDistance : Bool32,
    shaderCullDistance : Bool32,
    shaderFloat64 : Bool32,
    shaderInt64 : Bool32,
    shaderInt16 : Bool32,
    shaderResourceResidency : Bool32,
    shaderResourceMinLod : Bool32,
    sparseBinding : Bool32,
    sparseResidencyBuffer : Bool32,
    sparseResidencyImage2D : Bool32,
    sparseResidencyImage3D : Bool32,
    sparseResidency2Samples : Bool32,
    sparseResidency4Samples : Bool32,
    sparseResidency8Samples : Bool32,
    sparseResidency16Samples : Bool32,
    sparseResidencyAliased : Bool32,
    variableMultisampleRate : Bool32,
    inheritedQueries : Bool32,
};

FormatProperties :: struct {
    linearTilingFeatures : FormatFeatureFlags,
    optimalTilingFeatures : FormatFeatureFlags,
    bufferFeatures : FormatFeatureFlags,
};

Extent3D :: struct {
    width : u32,
    height : u32,
    depth : u32,
};

ImageFormatProperties :: struct {
    maxExtent : Extent3D,
    maxMipLevels : u32,
    maxArrayLayers : u32,
    sampleCounts : SampleCountFlags,
    maxResourceSize : DeviceSize,
};

PhysicalDeviceLimits :: struct {
    maxImageDimension1D : u32,
    maxImageDimension2D : u32,
    maxImageDimension3D : u32,
    maxImageDimensionCube : u32,
    maxImageArrayLayers : u32,
    maxTexelBufferElements : u32,
    maxUniformBufferRange : u32,
    maxStorageBufferRange : u32,
    maxPushConstantsSize : u32,
    maxMemoryAllocationCount : u32,
    maxSamplerAllocationCount : u32,
    bufferImageGranularity : DeviceSize,
    sparseAddressSpaceSize : DeviceSize,
    maxBoundDescriptorSets : u32,
    maxPerStageDescriptorSamplers : u32,
    maxPerStageDescriptorUniformBuffers : u32,
    maxPerStageDescriptorStorageBuffers : u32,
    maxPerStageDescriptorSampledImages : u32,
    maxPerStageDescriptorStorageImages : u32,
    maxPerStageDescriptorInputAttachments : u32,
    maxPerStageResources : u32,
    maxDescriptorSetSamplers : u32,
    maxDescriptorSetUniformBuffers : u32,
    maxDescriptorSetUniformBuffersDynamic : u32,
    maxDescriptorSetStorageBuffers : u32,
    maxDescriptorSetStorageBuffersDynamic : u32,
    maxDescriptorSetSampledImages : u32,
    maxDescriptorSetStorageImages : u32,
    maxDescriptorSetInputAttachments : u32,
    maxVertexInputAttributes : u32,
    maxVertexInputBindings : u32,
    maxVertexInputAttributeOffset : u32,
    maxVertexInputBindingStride : u32,
    maxVertexOutputComponents : u32,
    maxTessellationGenerationLevel : u32,
    maxTessellationPatchSize : u32,
    maxTessellationControlPerVertexInputComponents : u32,
    maxTessellationControlPerVertexOutputComponents : u32,
    maxTessellationControlPerPatchOutputComponents : u32,
    maxTessellationControlTotalOutputComponents : u32,
    maxTessellationEvaluationInputComponents : u32,
    maxTessellationEvaluationOutputComponents : u32,
    maxGeometryShaderInvocations : u32,
    maxGeometryInputComponents : u32,
    maxGeometryOutputComponents : u32,
    maxGeometryOutputVertices : u32,
    maxGeometryTotalOutputComponents : u32,
    maxFragmentInputComponents : u32,
    maxFragmentOutputAttachments : u32,
    maxFragmentDualSrcAttachments : u32,
    maxFragmentCombinedOutputResources : u32,
    maxComputeSharedMemorySize : u32,
    maxComputeWorkGroupCount : [3]u32,
    maxComputeWorkGroupInvocations : u32,
    maxComputeWorkGroupSize : [3]u32,
    subPixelPrecisionBits : u32,
    subTexelPrecisionBits : u32,
    mipmapPrecisionBits : u32,
    maxDrawIndexedIndexValue : u32,
    maxDrawIndirectCount : u32,
    maxSamplerLodBias : _c.float,
    maxSamplerAnisotropy : _c.float,
    maxViewports : u32,
    maxViewportDimensions : [2]u32,
    viewportBoundsRange : [2]_c.float,
    viewportSubPixelBits : u32,
    minMemoryMapAlignment : _c.size_t,
    minTexelBufferOffsetAlignment : DeviceSize,
    minUniformBufferOffsetAlignment : DeviceSize,
    minStorageBufferOffsetAlignment : DeviceSize,
    minTexelOffset : i32,
    maxTexelOffset : u32,
    minTexelGatherOffset : i32,
    maxTexelGatherOffset : u32,
    minInterpolationOffset : _c.float,
    maxInterpolationOffset : _c.float,
    subPixelInterpolationOffsetBits : u32,
    maxFramebufferWidth : u32,
    maxFramebufferHeight : u32,
    maxFramebufferLayers : u32,
    framebufferColorSampleCounts : SampleCountFlags,
    framebufferDepthSampleCounts : SampleCountFlags,
    framebufferStencilSampleCounts : SampleCountFlags,
    framebufferNoAttachmentsSampleCounts : SampleCountFlags,
    maxColorAttachments : u32,
    sampledImageColorSampleCounts : SampleCountFlags,
    sampledImageIntegerSampleCounts : SampleCountFlags,
    sampledImageDepthSampleCounts : SampleCountFlags,
    sampledImageStencilSampleCounts : SampleCountFlags,
    storageImageSampleCounts : SampleCountFlags,
    maxSampleMaskWords : u32,
    timestampComputeAndGraphics : Bool32,
    timestampPeriod : _c.float,
    maxClipDistances : u32,
    maxCullDistances : u32,
    maxCombinedClipAndCullDistances : u32,
    discreteQueuePriorities : u32,
    pointSizeRange : [2]_c.float,
    lineWidthRange : [2]_c.float,
    pointSizeGranularity : _c.float,
    lineWidthGranularity : _c.float,
    strictLines : Bool32,
    standardSampleLocations : Bool32,
    optimalBufferCopyOffsetAlignment : DeviceSize,
    optimalBufferCopyRowPitchAlignment : DeviceSize,
    nonCoherentAtomSize : DeviceSize,
};

PhysicalDeviceSparseProperties :: struct {
    residencyStandard2DBlockShape : Bool32,
    residencyStandard2DMultisampleBlockShape : Bool32,
    residencyStandard3DBlockShape : Bool32,
    residencyAlignedMipSize : Bool32,
    residencyNonResidentStrict : Bool32,
};

PhysicalDeviceProperties :: struct {
    apiVersion : u32,
    driverVersion : u32,
    vendorID : u32,
    deviceID : u32,
    deviceType : PhysicalDeviceType,
    deviceName : [256]_c.char,
    pipelineCacheUUID : [16]u8,
    limits : PhysicalDeviceLimits,
    sparseProperties : PhysicalDeviceSparseProperties,
};

QueueFamilyProperties :: struct {
    queueFlags : QueueFlags,
    queueCount : u32,
    timestampValidBits : u32,
    minImageTransferGranularity : Extent3D,
};

MemoryType :: struct {
    propertyFlags : MemoryPropertyFlags,
    heapIndex : u32,
};

MemoryHeap :: struct {
    size : DeviceSize,
    flags : MemoryHeapFlags,
};

PhysicalDeviceMemoryProperties :: struct {
    memoryTypeCount : u32,
    memoryTypes : [32]MemoryType,
    memoryHeapCount : u32,
    memoryHeaps : [16]MemoryHeap,
};

DeviceQueueCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DeviceQueueCreateFlags,
    queueFamilyIndex : u32,
    queueCount : u32,
    pQueuePriorities : ^_c.float,
};

DeviceCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DeviceCreateFlags,
    queueCreateInfoCount : u32,
    pQueueCreateInfos : ^DeviceQueueCreateInfo,
    enabledLayerCount : u32,
    ppEnabledLayerNames : ^cstring,
    enabledExtensionCount : u32,
    ppEnabledExtensionNames : ^cstring,
    pEnabledFeatures : ^PhysicalDeviceFeatures,
};

ExtensionProperties :: struct {
    extensionName : [256]_c.char,
    specVersion : u32,
};

LayerProperties :: struct {
    layerName : [256]_c.char,
    specVersion : u32,
    implementationVersion : u32,
    description : [256]_c.char,
};

SubmitInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    waitSemaphoreCount : u32,
    pWaitSemaphores : ^Semaphore,
    pWaitDstStageMask : ^PipelineStageFlags,
    commandBufferCount : u32,
    pCommandBuffers : ^CommandBuffer,
    signalSemaphoreCount : u32,
    pSignalSemaphores : ^Semaphore,
};

MemoryAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    allocationSize : DeviceSize,
    memoryTypeIndex : u32,
};

MappedMemoryRange :: struct {
    sType : StructureType,
    pNext : rawptr,
    memory : DeviceMemory,
    offset : DeviceSize,
    size : DeviceSize,
};

MemoryRequirements :: struct {
    size : DeviceSize,
    alignment : DeviceSize,
    memoryTypeBits : u32,
};

SparseImageFormatProperties :: struct {
    aspectMask : ImageAspectFlags,
    imageGranularity : Extent3D,
    flags : SparseImageFormatFlags,
};

SparseImageMemoryRequirements :: struct {
    formatProperties : SparseImageFormatProperties,
    imageMipTailFirstLod : u32,
    imageMipTailSize : DeviceSize,
    imageMipTailOffset : DeviceSize,
    imageMipTailStride : DeviceSize,
};

SparseMemoryBind :: struct {
    resourceOffset : DeviceSize,
    size : DeviceSize,
    memory : DeviceMemory,
    memoryOffset : DeviceSize,
    flags : SparseMemoryBindFlags,
};

SparseBufferMemoryBindInfo :: struct {
    buffer : Buffer,
    bindCount : u32,
    pBinds : ^SparseMemoryBind,
};

SparseImageOpaqueMemoryBindInfo :: struct {
    image : Image,
    bindCount : u32,
    pBinds : ^SparseMemoryBind,
};

ImageSubresource :: struct {
    aspectMask : ImageAspectFlags,
    mipLevel : u32,
    arrayLayer : u32,
};

Offset3D :: struct {
    x : i32,
    y : i32,
    z : i32,
};

SparseImageMemoryBind :: struct {
    subresource : ImageSubresource,
    offset : Offset3D,
    extent : Extent3D,
    memory : DeviceMemory,
    memoryOffset : DeviceSize,
    flags : SparseMemoryBindFlags,
};

SparseImageMemoryBindInfo :: struct {
    image : Image,
    bindCount : u32,
    pBinds : ^SparseImageMemoryBind,
};

BindSparseInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    waitSemaphoreCount : u32,
    pWaitSemaphores : ^Semaphore,
    bufferBindCount : u32,
    pBufferBinds : ^SparseBufferMemoryBindInfo,
    imageOpaqueBindCount : u32,
    pImageOpaqueBinds : ^SparseImageOpaqueMemoryBindInfo,
    imageBindCount : u32,
    pImageBinds : ^SparseImageMemoryBindInfo,
    signalSemaphoreCount : u32,
    pSignalSemaphores : ^Semaphore,
};

FenceCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : FenceCreateFlags,
};

SemaphoreCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : SemaphoreCreateFlags,
};

EventCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : EventCreateFlags,
};

QueryPoolCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : QueryPoolCreateFlags,
    queryType : QueryType,
    queryCount : u32,
    pipelineStatistics : QueryPipelineStatisticFlags,
};

BufferCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : BufferCreateFlags,
    size : DeviceSize,
    usage : BufferUsageFlags,
    sharingMode : SharingMode,
    queueFamilyIndexCount : u32,
    pQueueFamilyIndices : ^u32,
};

BufferViewCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : BufferViewCreateFlags,
    buffer : Buffer,
    format : Format,
    offset : DeviceSize,
    range : DeviceSize,
};

ImageCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : ImageCreateFlags,
    imageType : ImageType,
    format : Format,
    extent : Extent3D,
    mipLevels : u32,
    arrayLayers : u32,
    samples : SampleCountFlagBits,
    tiling : ImageTiling,
    usage : ImageUsageFlags,
    sharingMode : SharingMode,
    queueFamilyIndexCount : u32,
    pQueueFamilyIndices : ^u32,
    initialLayout : ImageLayout,
};

SubresourceLayout :: struct {
    offset : DeviceSize,
    size : DeviceSize,
    rowPitch : DeviceSize,
    arrayPitch : DeviceSize,
    depthPitch : DeviceSize,
};

ComponentMapping :: struct {
    r : ComponentSwizzle,
    g : ComponentSwizzle,
    b : ComponentSwizzle,
    a : ComponentSwizzle,
};

ImageSubresourceRange :: struct {
    aspectMask : ImageAspectFlags,
    baseMipLevel : u32,
    levelCount : u32,
    baseArrayLayer : u32,
    layerCount : u32,
};

ImageViewCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : ImageViewCreateFlags,
    image : Image,
    viewType : ImageViewType,
    format : Format,
    components : ComponentMapping,
    subresourceRange : ImageSubresourceRange,
};

ShaderModuleCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : ShaderModuleCreateFlags,
    codeSize : _c.size_t,
    pCode : ^u32,
};

PipelineCacheCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCacheCreateFlags,
    initialDataSize : _c.size_t,
    pInitialData : rawptr,
};

SpecializationMapEntry :: struct {
    constantID : u32,
    offset : u32,
    size : _c.size_t,
};

SpecializationInfo :: struct {
    mapEntryCount : u32,
    pMapEntries : ^SpecializationMapEntry,
    dataSize : _c.size_t,
    pData : rawptr,
};

PipelineShaderStageCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineShaderStageCreateFlags,
    stage : ShaderStageFlagBits,
    module : ShaderModule,
    pName : cstring,
    pSpecializationInfo : ^SpecializationInfo,
};

VertexInputBindingDescription :: struct {
    binding : u32,
    stride : u32,
    inputRate : VertexInputRate,
};

VertexInputAttributeDescription :: struct {
    location : u32,
    binding : u32,
    format : Format,
    offset : u32,
};

PipelineVertexInputStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineVertexInputStateCreateFlags,
    vertexBindingDescriptionCount : u32,
    pVertexBindingDescriptions : ^VertexInputBindingDescription,
    vertexAttributeDescriptionCount : u32,
    pVertexAttributeDescriptions : ^VertexInputAttributeDescription,
};

PipelineInputAssemblyStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineInputAssemblyStateCreateFlags,
    topology : PrimitiveTopology,
    primitiveRestartEnable : Bool32,
};

PipelineTessellationStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineTessellationStateCreateFlags,
    patchControlPoints : u32,
};

Viewport :: struct {
    x : _c.float,
    y : _c.float,
    width : _c.float,
    height : _c.float,
    minDepth : _c.float,
    maxDepth : _c.float,
};

Offset2D :: struct {
    x : i32,
    y : i32,
};

Extent2D :: struct {
    width : u32,
    height : u32,
};

Rect2D :: struct {
    offset : Offset2D,
    extent : Extent2D,
};

PipelineViewportStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineViewportStateCreateFlags,
    viewportCount : u32,
    pViewports : ^Viewport,
    scissorCount : u32,
    pScissors : ^Rect2D,
};

PipelineRasterizationStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineRasterizationStateCreateFlags,
    depthClampEnable : Bool32,
    rasterizerDiscardEnable : Bool32,
    polygonMode : PolygonMode,
    cullMode : CullModeFlags,
    frontFace : FrontFace,
    depthBiasEnable : Bool32,
    depthBiasConstantFactor : _c.float,
    depthBiasClamp : _c.float,
    depthBiasSlopeFactor : _c.float,
    lineWidth : _c.float,
};

PipelineMultisampleStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineMultisampleStateCreateFlags,
    rasterizationSamples : SampleCountFlagBits,
    sampleShadingEnable : Bool32,
    minSampleShading : _c.float,
    pSampleMask : ^SampleMask,
    alphaToCoverageEnable : Bool32,
    alphaToOneEnable : Bool32,
};

StencilOpState :: struct {
    failOp : StencilOp,
    passOp : StencilOp,
    depthFailOp : StencilOp,
    compareOp : CompareOp,
    compareMask : u32,
    writeMask : u32,
    reference : u32,
};

PipelineDepthStencilStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineDepthStencilStateCreateFlags,
    depthTestEnable : Bool32,
    depthWriteEnable : Bool32,
    depthCompareOp : CompareOp,
    depthBoundsTestEnable : Bool32,
    stencilTestEnable : Bool32,
    front : StencilOpState,
    back : StencilOpState,
    minDepthBounds : _c.float,
    maxDepthBounds : _c.float,
};

PipelineColorBlendAttachmentState :: struct {
    blendEnable : Bool32,
    srcColorBlendFactor : BlendFactor,
    dstColorBlendFactor : BlendFactor,
    colorBlendOp : BlendOp,
    srcAlphaBlendFactor : BlendFactor,
    dstAlphaBlendFactor : BlendFactor,
    alphaBlendOp : BlendOp,
    colorWriteMask : ColorComponentFlags,
};

PipelineColorBlendStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineColorBlendStateCreateFlags,
    logicOpEnable : Bool32,
    logicOp : LogicOp,
    attachmentCount : u32,
    pAttachments : ^PipelineColorBlendAttachmentState,
    blendConstants : [4]_c.float,
};

PipelineDynamicStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineDynamicStateCreateFlags,
    dynamicStateCount : u32,
    pDynamicStates : ^DynamicState,
};

GraphicsPipelineCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCreateFlags,
    stageCount : u32,
    pStages : ^PipelineShaderStageCreateInfo,
    pVertexInputState : ^PipelineVertexInputStateCreateInfo,
    pInputAssemblyState : ^PipelineInputAssemblyStateCreateInfo,
    pTessellationState : ^PipelineTessellationStateCreateInfo,
    pViewportState : ^PipelineViewportStateCreateInfo,
    pRasterizationState : ^PipelineRasterizationStateCreateInfo,
    pMultisampleState : ^PipelineMultisampleStateCreateInfo,
    pDepthStencilState : ^PipelineDepthStencilStateCreateInfo,
    pColorBlendState : ^PipelineColorBlendStateCreateInfo,
    pDynamicState : ^PipelineDynamicStateCreateInfo,
    layout : PipelineLayout,
    renderPass : RenderPass,
    subpass : u32,
    basePipelineHandle : Pipeline,
    basePipelineIndex : i32,
};

ComputePipelineCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCreateFlags,
    stage : PipelineShaderStageCreateInfo,
    layout : PipelineLayout,
    basePipelineHandle : Pipeline,
    basePipelineIndex : i32,
};

PushConstantRange :: struct {
    stageFlags : ShaderStageFlags,
    offset : u32,
    size : u32,
};

PipelineLayoutCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineLayoutCreateFlags,
    setLayoutCount : u32,
    pSetLayouts : ^DescriptorSetLayout,
    pushConstantRangeCount : u32,
    pPushConstantRanges : ^PushConstantRange,
};

SamplerCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : SamplerCreateFlags,
    magFilter : Filter,
    minFilter : Filter,
    mipmapMode : SamplerMipmapMode,
    addressModeU : SamplerAddressMode,
    addressModeV : SamplerAddressMode,
    addressModeW : SamplerAddressMode,
    mipLodBias : _c.float,
    anisotropyEnable : Bool32,
    maxAnisotropy : _c.float,
    compareEnable : Bool32,
    compareOp : CompareOp,
    minLod : _c.float,
    maxLod : _c.float,
    borderColor : BorderColor,
    unnormalizedCoordinates : Bool32,
};

DescriptorSetLayoutBinding :: struct {
    binding : u32,
    descriptorType : DescriptorType,
    descriptorCount : u32,
    stageFlags : ShaderStageFlags,
    pImmutableSamplers : ^Sampler,
};

DescriptorSetLayoutCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DescriptorSetLayoutCreateFlags,
    bindingCount : u32,
    pBindings : ^DescriptorSetLayoutBinding,
};

DescriptorPoolSize :: struct {
    type : DescriptorType,
    descriptorCount : u32,
};

DescriptorPoolCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DescriptorPoolCreateFlags,
    maxSets : u32,
    poolSizeCount : u32,
    pPoolSizes : ^DescriptorPoolSize,
};

DescriptorSetAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    descriptorPool : DescriptorPool,
    descriptorSetCount : u32,
    pSetLayouts : ^DescriptorSetLayout,
};

DescriptorImageInfo :: struct {
    sampler : Sampler,
    imageView : ImageView,
    imageLayout : ImageLayout,
};

DescriptorBufferInfo :: struct {
    buffer : Buffer,
    offset : DeviceSize,
    range : DeviceSize,
};

WriteDescriptorSet :: struct {
    sType : StructureType,
    pNext : rawptr,
    dstSet : DescriptorSet,
    dstBinding : u32,
    dstArrayElement : u32,
    descriptorCount : u32,
    descriptorType : DescriptorType,
    pImageInfo : ^DescriptorImageInfo,
    pBufferInfo : ^DescriptorBufferInfo,
    pTexelBufferView : ^BufferView,
};

CopyDescriptorSet :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcSet : DescriptorSet,
    srcBinding : u32,
    srcArrayElement : u32,
    dstSet : DescriptorSet,
    dstBinding : u32,
    dstArrayElement : u32,
    descriptorCount : u32,
};

FramebufferCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : FramebufferCreateFlags,
    renderPass : RenderPass,
    attachmentCount : u32,
    pAttachments : ^ImageView,
    width : u32,
    height : u32,
    layers : u32,
};

AttachmentDescription :: struct {
    flags : AttachmentDescriptionFlags,
    format : Format,
    samples : SampleCountFlagBits,
    loadOp : AttachmentLoadOp,
    storeOp : AttachmentStoreOp,
    stencilLoadOp : AttachmentLoadOp,
    stencilStoreOp : AttachmentStoreOp,
    initialLayout : ImageLayout,
    finalLayout : ImageLayout,
};

AttachmentReference :: struct {
    attachment : u32,
    layout : ImageLayout,
};

SubpassDescription :: struct {
    flags : SubpassDescriptionFlags,
    pipelineBindPoint : PipelineBindPoint,
    inputAttachmentCount : u32,
    pInputAttachments : ^AttachmentReference,
    colorAttachmentCount : u32,
    pColorAttachments : ^AttachmentReference,
    pResolveAttachments : ^AttachmentReference,
    pDepthStencilAttachment : ^AttachmentReference,
    preserveAttachmentCount : u32,
    pPreserveAttachments : ^u32,
};

SubpassDependency :: struct {
    srcSubpass : u32,
    dstSubpass : u32,
    srcStageMask : PipelineStageFlags,
    dstStageMask : PipelineStageFlags,
    srcAccessMask : AccessFlags,
    dstAccessMask : AccessFlags,
    dependencyFlags : DependencyFlags,
};

RenderPassCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : RenderPassCreateFlags,
    attachmentCount : u32,
    pAttachments : ^AttachmentDescription,
    subpassCount : u32,
    pSubpasses : ^SubpassDescription,
    dependencyCount : u32,
    pDependencies : ^SubpassDependency,
};

CommandPoolCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : CommandPoolCreateFlags,
    queueFamilyIndex : u32,
};

CommandBufferAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    commandPool : CommandPool,
    level : CommandBufferLevel,
    commandBufferCount : u32,
};

CommandBufferInheritanceInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    renderPass : RenderPass,
    subpass : u32,
    framebuffer : Framebuffer,
    occlusionQueryEnable : Bool32,
    queryFlags : QueryControlFlags,
    pipelineStatistics : QueryPipelineStatisticFlags,
};

CommandBufferBeginInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : CommandBufferUsageFlags,
    pInheritanceInfo : ^CommandBufferInheritanceInfo,
};

BufferCopy :: struct {
    srcOffset : DeviceSize,
    dstOffset : DeviceSize,
    size : DeviceSize,
};

ImageSubresourceLayers :: struct {
    aspectMask : ImageAspectFlags,
    mipLevel : u32,
    baseArrayLayer : u32,
    layerCount : u32,
};

ImageCopy :: struct {
    srcSubresource : ImageSubresourceLayers,
    srcOffset : Offset3D,
    dstSubresource : ImageSubresourceLayers,
    dstOffset : Offset3D,
    extent : Extent3D,
};

ImageBlit :: struct {
    srcSubresource : ImageSubresourceLayers,
    srcOffsets : [2]Offset3D,
    dstSubresource : ImageSubresourceLayers,
    dstOffsets : [2]Offset3D,
};

BufferImageCopy :: struct {
    bufferOffset : DeviceSize,
    bufferRowLength : u32,
    bufferImageHeight : u32,
    imageSubresource : ImageSubresourceLayers,
    imageOffset : Offset3D,
    imageExtent : Extent3D,
};

ClearDepthStencilValue :: struct {
    depth : _c.float,
    stencil : u32,
};

ClearAttachment :: struct {
    aspectMask : ImageAspectFlags,
    colorAttachment : u32,
    clearValue : ClearValue,
};

ClearRect :: struct {
    rect : Rect2D,
    baseArrayLayer : u32,
    layerCount : u32,
};

ImageResolve :: struct {
    srcSubresource : ImageSubresourceLayers,
    srcOffset : Offset3D,
    dstSubresource : ImageSubresourceLayers,
    dstOffset : Offset3D,
    extent : Extent3D,
};

MemoryBarrier :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcAccessMask : AccessFlags,
    dstAccessMask : AccessFlags,
};

BufferMemoryBarrier :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcAccessMask : AccessFlags,
    dstAccessMask : AccessFlags,
    srcQueueFamilyIndex : u32,
    dstQueueFamilyIndex : u32,
    buffer : Buffer,
    offset : DeviceSize,
    size : DeviceSize,
};

ImageMemoryBarrier :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcAccessMask : AccessFlags,
    dstAccessMask : AccessFlags,
    oldLayout : ImageLayout,
    newLayout : ImageLayout,
    srcQueueFamilyIndex : u32,
    dstQueueFamilyIndex : u32,
    image : Image,
    subresourceRange : ImageSubresourceRange,
};

RenderPassBeginInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    renderPass : RenderPass,
    framebuffer : Framebuffer,
    renderArea : Rect2D,
    clearValueCount : u32,
    pClearValues : ^ClearValue,
};

DispatchIndirectCommand :: struct {
    x : u32,
    y : u32,
    z : u32,
};

DrawIndexedIndirectCommand :: struct {
    indexCount : u32,
    instanceCount : u32,
    firstIndex : u32,
    vertexOffset : i32,
    firstInstance : u32,
};

DrawIndirectCommand :: struct {
    vertexCount : u32,
    instanceCount : u32,
    firstVertex : u32,
    firstInstance : u32,
};

BaseOutStructure :: struct {
    sType : StructureType,
    pNext : ^BaseOutStructure,
};

BaseInStructure :: struct {
    sType : StructureType,
    pNext : ^BaseInStructure,
};

SamplerYcbcrConversionT :: struct {};

DescriptorUpdateTemplateT :: struct {};

PhysicalDeviceSubgroupProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    subgroupSize : u32,
    supportedStages : ShaderStageFlags,
    supportedOperations : SubgroupFeatureFlags,
    quadOperationsInAllStages : Bool32,
};

BindBufferMemoryInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    buffer : Buffer,
    memory : DeviceMemory,
    memoryOffset : DeviceSize,
};

BindImageMemoryInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    image : Image,
    memory : DeviceMemory,
    memoryOffset : DeviceSize,
};

PhysicalDevice16BitStorageFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    storageBuffer16BitAccess : Bool32,
    uniformAndStorageBuffer16BitAccess : Bool32,
    storagePushConstant16 : Bool32,
    storageInputOutput16 : Bool32,
};

MemoryDedicatedRequirements :: struct {
    sType : StructureType,
    pNext : rawptr,
    prefersDedicatedAllocation : Bool32,
    requiresDedicatedAllocation : Bool32,
};

MemoryDedicatedAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    image : Image,
    buffer : Buffer,
};

MemoryAllocateFlagsInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : MemoryAllocateFlags,
    deviceMask : u32,
};

DeviceGroupRenderPassBeginInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceMask : u32,
    deviceRenderAreaCount : u32,
    pDeviceRenderAreas : ^Rect2D,
};

DeviceGroupCommandBufferBeginInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceMask : u32,
};

DeviceGroupSubmitInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    waitSemaphoreCount : u32,
    pWaitSemaphoreDeviceIndices : ^u32,
    commandBufferCount : u32,
    pCommandBufferDeviceMasks : ^u32,
    signalSemaphoreCount : u32,
    pSignalSemaphoreDeviceIndices : ^u32,
};

DeviceGroupBindSparseInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    resourceDeviceIndex : u32,
    memoryDeviceIndex : u32,
};

BindBufferMemoryDeviceGroupInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceIndexCount : u32,
    pDeviceIndices : ^u32,
};

BindImageMemoryDeviceGroupInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceIndexCount : u32,
    pDeviceIndices : ^u32,
    splitInstanceBindRegionCount : u32,
    pSplitInstanceBindRegions : ^Rect2D,
};

PhysicalDeviceGroupProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    physicalDeviceCount : u32,
    physicalDevices : [32]PhysicalDevice,
    subsetAllocation : Bool32,
};

DeviceGroupDeviceCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    physicalDeviceCount : u32,
    pPhysicalDevices : ^PhysicalDevice,
};

BufferMemoryRequirementsInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    buffer : Buffer,
};

ImageMemoryRequirementsInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    image : Image,
};

ImageSparseMemoryRequirementsInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    image : Image,
};

MemoryRequirements2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    memoryRequirements : MemoryRequirements,
};

SparseImageMemoryRequirements2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    memoryRequirements : SparseImageMemoryRequirements,
};

PhysicalDeviceFeatures2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    features : PhysicalDeviceFeatures,
};

PhysicalDeviceProperties2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    properties : PhysicalDeviceProperties,
};

FormatProperties2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    formatProperties : FormatProperties,
};

ImageFormatProperties2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    imageFormatProperties : ImageFormatProperties,
};

PhysicalDeviceImageFormatInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    format : Format,
    type : ImageType,
    tiling : ImageTiling,
    usage : ImageUsageFlags,
    flags : ImageCreateFlags,
};

QueueFamilyProperties2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    queueFamilyProperties : QueueFamilyProperties,
};

PhysicalDeviceMemoryProperties2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    memoryProperties : PhysicalDeviceMemoryProperties,
};

SparseImageFormatProperties2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    properties : SparseImageFormatProperties,
};

PhysicalDeviceSparseImageFormatInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    format : Format,
    type : ImageType,
    samples : SampleCountFlagBits,
    usage : ImageUsageFlags,
    tiling : ImageTiling,
};

PhysicalDevicePointClippingProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    pointClippingBehavior : PointClippingBehavior,
};

InputAttachmentAspectReference :: struct {
    subpass : u32,
    inputAttachmentIndex : u32,
    aspectMask : ImageAspectFlags,
};

RenderPassInputAttachmentAspectCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    aspectReferenceCount : u32,
    pAspectReferences : ^InputAttachmentAspectReference,
};

ImageViewUsageCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    usage : ImageUsageFlags,
};

PipelineTessellationDomainOriginStateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    domainOrigin : TessellationDomainOrigin,
};

RenderPassMultiviewCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    subpassCount : u32,
    pViewMasks : ^u32,
    dependencyCount : u32,
    pViewOffsets : ^i32,
    correlationMaskCount : u32,
    pCorrelationMasks : ^u32,
};

PhysicalDeviceMultiviewFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    multiview : Bool32,
    multiviewGeometryShader : Bool32,
    multiviewTessellationShader : Bool32,
};

PhysicalDeviceMultiviewProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxMultiviewViewCount : u32,
    maxMultiviewInstanceIndex : u32,
};

PhysicalDeviceVariablePointersFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    variablePointersStorageBuffer : Bool32,
    variablePointers : Bool32,
};

PhysicalDeviceProtectedMemoryFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    protectedMemory : Bool32,
};

PhysicalDeviceProtectedMemoryProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    protectedNoFault : Bool32,
};

DeviceQueueInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DeviceQueueCreateFlags,
    queueFamilyIndex : u32,
    queueIndex : u32,
};

ProtectedSubmitInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    protectedSubmit : Bool32,
};

SamplerYcbcrConversionCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    format : Format,
    ycbcrModel : SamplerYcbcrModelConversion,
    ycbcrRange : SamplerYcbcrRange,
    components : ComponentMapping,
    xChromaOffset : ChromaLocation,
    yChromaOffset : ChromaLocation,
    chromaFilter : Filter,
    forceExplicitReconstruction : Bool32,
};

SamplerYcbcrConversionInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    conversion : SamplerYcbcrConversion,
};

BindImagePlaneMemoryInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    planeAspect : ImageAspectFlagBits,
};

ImagePlaneMemoryRequirementsInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    planeAspect : ImageAspectFlagBits,
};

PhysicalDeviceSamplerYcbcrConversionFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    samplerYcbcrConversion : Bool32,
};

SamplerYcbcrConversionImageFormatProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    combinedImageSamplerDescriptorCount : u32,
};

DescriptorUpdateTemplateEntry :: struct {
    dstBinding : u32,
    dstArrayElement : u32,
    descriptorCount : u32,
    descriptorType : DescriptorType,
    offset : _c.size_t,
    stride : _c.size_t,
};

DescriptorUpdateTemplateCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DescriptorUpdateTemplateCreateFlags,
    descriptorUpdateEntryCount : u32,
    pDescriptorUpdateEntries : ^DescriptorUpdateTemplateEntry,
    templateType : DescriptorUpdateTemplateType,
    descriptorSetLayout : DescriptorSetLayout,
    pipelineBindPoint : PipelineBindPoint,
    pipelineLayout : PipelineLayout,
    set : u32,
};

ExternalMemoryProperties :: struct {
    externalMemoryFeatures : ExternalMemoryFeatureFlags,
    exportFromImportedHandleTypes : ExternalMemoryHandleTypeFlags,
    compatibleHandleTypes : ExternalMemoryHandleTypeFlags,
};

PhysicalDeviceExternalImageFormatInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleType : ExternalMemoryHandleTypeFlagBits,
};

ExternalImageFormatProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    externalMemoryProperties : ExternalMemoryProperties,
};

PhysicalDeviceExternalBufferInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : BufferCreateFlags,
    usage : BufferUsageFlags,
    handleType : ExternalMemoryHandleTypeFlagBits,
};

ExternalBufferProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    externalMemoryProperties : ExternalMemoryProperties,
};

PhysicalDeviceIDProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceUUID : [16]u8,
    driverUUID : [16]u8,
    deviceLUID : [8]u8,
    deviceNodeMask : u32,
    deviceLUIDValid : Bool32,
};

ExternalMemoryImageCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalMemoryHandleTypeFlags,
};

ExternalMemoryBufferCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalMemoryHandleTypeFlags,
};

ExportMemoryAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalMemoryHandleTypeFlags,
};

PhysicalDeviceExternalFenceInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleType : ExternalFenceHandleTypeFlagBits,
};

ExternalFenceProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    exportFromImportedHandleTypes : ExternalFenceHandleTypeFlags,
    compatibleHandleTypes : ExternalFenceHandleTypeFlags,
    externalFenceFeatures : ExternalFenceFeatureFlags,
};

ExportFenceCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalFenceHandleTypeFlags,
};

ExportSemaphoreCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalSemaphoreHandleTypeFlags,
};

PhysicalDeviceExternalSemaphoreInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleType : ExternalSemaphoreHandleTypeFlagBits,
};

ExternalSemaphoreProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    exportFromImportedHandleTypes : ExternalSemaphoreHandleTypeFlags,
    compatibleHandleTypes : ExternalSemaphoreHandleTypeFlags,
    externalSemaphoreFeatures : ExternalSemaphoreFeatureFlags,
};

PhysicalDeviceMaintenance3Properties :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxPerSetDescriptors : u32,
    maxMemoryAllocationSize : DeviceSize,
};

DescriptorSetLayoutSupport :: struct {
    sType : StructureType,
    pNext : rawptr,
    supported : Bool32,
};

PhysicalDeviceShaderDrawParametersFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderDrawParameters : Bool32,
};

PhysicalDeviceVulkan11Features :: struct {
    sType : StructureType,
    pNext : rawptr,
    storageBuffer16BitAccess : Bool32,
    uniformAndStorageBuffer16BitAccess : Bool32,
    storagePushConstant16 : Bool32,
    storageInputOutput16 : Bool32,
    multiview : Bool32,
    multiviewGeometryShader : Bool32,
    multiviewTessellationShader : Bool32,
    variablePointersStorageBuffer : Bool32,
    variablePointers : Bool32,
    protectedMemory : Bool32,
    samplerYcbcrConversion : Bool32,
    shaderDrawParameters : Bool32,
};

PhysicalDeviceVulkan11Properties :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceUUID : [16]u8,
    driverUUID : [16]u8,
    deviceLUID : [8]u8,
    deviceNodeMask : u32,
    deviceLUIDValid : Bool32,
    subgroupSize : u32,
    subgroupSupportedStages : ShaderStageFlags,
    subgroupSupportedOperations : SubgroupFeatureFlags,
    subgroupQuadOperationsInAllStages : Bool32,
    pointClippingBehavior : PointClippingBehavior,
    maxMultiviewViewCount : u32,
    maxMultiviewInstanceIndex : u32,
    protectedNoFault : Bool32,
    maxPerSetDescriptors : u32,
    maxMemoryAllocationSize : DeviceSize,
};

PhysicalDeviceVulkan12Features :: struct {
    sType : StructureType,
    pNext : rawptr,
    samplerMirrorClampToEdge : Bool32,
    drawIndirectCount : Bool32,
    storageBuffer8BitAccess : Bool32,
    uniformAndStorageBuffer8BitAccess : Bool32,
    storagePushConstant8 : Bool32,
    shaderBufferInt64Atomics : Bool32,
    shaderSharedInt64Atomics : Bool32,
    shaderFloat16 : Bool32,
    shaderInt8 : Bool32,
    descriptorIndexing : Bool32,
    shaderInputAttachmentArrayDynamicIndexing : Bool32,
    shaderUniformTexelBufferArrayDynamicIndexing : Bool32,
    shaderStorageTexelBufferArrayDynamicIndexing : Bool32,
    shaderUniformBufferArrayNonUniformIndexing : Bool32,
    shaderSampledImageArrayNonUniformIndexing : Bool32,
    shaderStorageBufferArrayNonUniformIndexing : Bool32,
    shaderStorageImageArrayNonUniformIndexing : Bool32,
    shaderInputAttachmentArrayNonUniformIndexing : Bool32,
    shaderUniformTexelBufferArrayNonUniformIndexing : Bool32,
    shaderStorageTexelBufferArrayNonUniformIndexing : Bool32,
    descriptorBindingUniformBufferUpdateAfterBind : Bool32,
    descriptorBindingSampledImageUpdateAfterBind : Bool32,
    descriptorBindingStorageImageUpdateAfterBind : Bool32,
    descriptorBindingStorageBufferUpdateAfterBind : Bool32,
    descriptorBindingUniformTexelBufferUpdateAfterBind : Bool32,
    descriptorBindingStorageTexelBufferUpdateAfterBind : Bool32,
    descriptorBindingUpdateUnusedWhilePending : Bool32,
    descriptorBindingPartiallyBound : Bool32,
    descriptorBindingVariableDescriptorCount : Bool32,
    runtimeDescriptorArray : Bool32,
    samplerFilterMinmax : Bool32,
    scalarBlockLayout : Bool32,
    imagelessFramebuffer : Bool32,
    uniformBufferStandardLayout : Bool32,
    shaderSubgroupExtendedTypes : Bool32,
    separateDepthStencilLayouts : Bool32,
    hostQueryReset : Bool32,
    timelineSemaphore : Bool32,
    bufferDeviceAddress : Bool32,
    bufferDeviceAddressCaptureReplay : Bool32,
    bufferDeviceAddressMultiDevice : Bool32,
    vulkanMemoryModel : Bool32,
    vulkanMemoryModelDeviceScope : Bool32,
    vulkanMemoryModelAvailabilityVisibilityChains : Bool32,
    shaderOutputViewportIndex : Bool32,
    shaderOutputLayer : Bool32,
    subgroupBroadcastDynamicId : Bool32,
};

ConformanceVersion :: struct {
    major : u8,
    minor : u8,
    subminor : u8,
    patch : u8,
};

PhysicalDeviceVulkan12Properties :: struct {
    sType : StructureType,
    pNext : rawptr,
    driverID : DriverId,
    driverName : [256]_c.char,
    driverInfo : [256]_c.char,
    conformanceVersion : ConformanceVersion,
    denormBehaviorIndependence : ShaderFloatControlsIndependence,
    roundingModeIndependence : ShaderFloatControlsIndependence,
    shaderSignedZeroInfNanPreserveFloat16 : Bool32,
    shaderSignedZeroInfNanPreserveFloat32 : Bool32,
    shaderSignedZeroInfNanPreserveFloat64 : Bool32,
    shaderDenormPreserveFloat16 : Bool32,
    shaderDenormPreserveFloat32 : Bool32,
    shaderDenormPreserveFloat64 : Bool32,
    shaderDenormFlushToZeroFloat16 : Bool32,
    shaderDenormFlushToZeroFloat32 : Bool32,
    shaderDenormFlushToZeroFloat64 : Bool32,
    shaderRoundingModeRTEFloat16 : Bool32,
    shaderRoundingModeRTEFloat32 : Bool32,
    shaderRoundingModeRTEFloat64 : Bool32,
    shaderRoundingModeRTZFloat16 : Bool32,
    shaderRoundingModeRTZFloat32 : Bool32,
    shaderRoundingModeRTZFloat64 : Bool32,
    maxUpdateAfterBindDescriptorsInAllPools : u32,
    shaderUniformBufferArrayNonUniformIndexingNative : Bool32,
    shaderSampledImageArrayNonUniformIndexingNative : Bool32,
    shaderStorageBufferArrayNonUniformIndexingNative : Bool32,
    shaderStorageImageArrayNonUniformIndexingNative : Bool32,
    shaderInputAttachmentArrayNonUniformIndexingNative : Bool32,
    robustBufferAccessUpdateAfterBind : Bool32,
    quadDivergentImplicitLod : Bool32,
    maxPerStageDescriptorUpdateAfterBindSamplers : u32,
    maxPerStageDescriptorUpdateAfterBindUniformBuffers : u32,
    maxPerStageDescriptorUpdateAfterBindStorageBuffers : u32,
    maxPerStageDescriptorUpdateAfterBindSampledImages : u32,
    maxPerStageDescriptorUpdateAfterBindStorageImages : u32,
    maxPerStageDescriptorUpdateAfterBindInputAttachments : u32,
    maxPerStageUpdateAfterBindResources : u32,
    maxDescriptorSetUpdateAfterBindSamplers : u32,
    maxDescriptorSetUpdateAfterBindUniformBuffers : u32,
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic : u32,
    maxDescriptorSetUpdateAfterBindStorageBuffers : u32,
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic : u32,
    maxDescriptorSetUpdateAfterBindSampledImages : u32,
    maxDescriptorSetUpdateAfterBindStorageImages : u32,
    maxDescriptorSetUpdateAfterBindInputAttachments : u32,
    supportedDepthResolveModes : ResolveModeFlags,
    supportedStencilResolveModes : ResolveModeFlags,
    independentResolveNone : Bool32,
    independentResolve : Bool32,
    filterMinmaxSingleComponentFormats : Bool32,
    filterMinmaxImageComponentMapping : Bool32,
    maxTimelineSemaphoreValueDifference : u64,
    framebufferIntegerColorSampleCounts : SampleCountFlags,
};

ImageFormatListCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    viewFormatCount : u32,
    pViewFormats : ^Format,
};

AttachmentDescription2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : AttachmentDescriptionFlags,
    format : Format,
    samples : SampleCountFlagBits,
    loadOp : AttachmentLoadOp,
    storeOp : AttachmentStoreOp,
    stencilLoadOp : AttachmentLoadOp,
    stencilStoreOp : AttachmentStoreOp,
    initialLayout : ImageLayout,
    finalLayout : ImageLayout,
};

AttachmentReference2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    attachment : u32,
    layout : ImageLayout,
    aspectMask : ImageAspectFlags,
};

SubpassDescription2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : SubpassDescriptionFlags,
    pipelineBindPoint : PipelineBindPoint,
    viewMask : u32,
    inputAttachmentCount : u32,
    pInputAttachments : ^AttachmentReference2,
    colorAttachmentCount : u32,
    pColorAttachments : ^AttachmentReference2,
    pResolveAttachments : ^AttachmentReference2,
    pDepthStencilAttachment : ^AttachmentReference2,
    preserveAttachmentCount : u32,
    pPreserveAttachments : ^u32,
};

SubpassDependency2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcSubpass : u32,
    dstSubpass : u32,
    srcStageMask : PipelineStageFlags,
    dstStageMask : PipelineStageFlags,
    srcAccessMask : AccessFlags,
    dstAccessMask : AccessFlags,
    dependencyFlags : DependencyFlags,
    viewOffset : i32,
};

RenderPassCreateInfo2 :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : RenderPassCreateFlags,
    attachmentCount : u32,
    pAttachments : ^AttachmentDescription2,
    subpassCount : u32,
    pSubpasses : ^SubpassDescription2,
    dependencyCount : u32,
    pDependencies : ^SubpassDependency2,
    correlatedViewMaskCount : u32,
    pCorrelatedViewMasks : ^u32,
};

SubpassBeginInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    contents : SubpassContents,
};

SubpassEndInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
};

PhysicalDevice8BitStorageFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    storageBuffer8BitAccess : Bool32,
    uniformAndStorageBuffer8BitAccess : Bool32,
    storagePushConstant8 : Bool32,
};

PhysicalDeviceDriverProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    driverID : DriverId,
    driverName : [256]_c.char,
    driverInfo : [256]_c.char,
    conformanceVersion : ConformanceVersion,
};

PhysicalDeviceShaderAtomicInt64Features :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderBufferInt64Atomics : Bool32,
    shaderSharedInt64Atomics : Bool32,
};

PhysicalDeviceShaderFloat16Int8Features :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderFloat16 : Bool32,
    shaderInt8 : Bool32,
};

PhysicalDeviceFloatControlsProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    denormBehaviorIndependence : ShaderFloatControlsIndependence,
    roundingModeIndependence : ShaderFloatControlsIndependence,
    shaderSignedZeroInfNanPreserveFloat16 : Bool32,
    shaderSignedZeroInfNanPreserveFloat32 : Bool32,
    shaderSignedZeroInfNanPreserveFloat64 : Bool32,
    shaderDenormPreserveFloat16 : Bool32,
    shaderDenormPreserveFloat32 : Bool32,
    shaderDenormPreserveFloat64 : Bool32,
    shaderDenormFlushToZeroFloat16 : Bool32,
    shaderDenormFlushToZeroFloat32 : Bool32,
    shaderDenormFlushToZeroFloat64 : Bool32,
    shaderRoundingModeRTEFloat16 : Bool32,
    shaderRoundingModeRTEFloat32 : Bool32,
    shaderRoundingModeRTEFloat64 : Bool32,
    shaderRoundingModeRTZFloat16 : Bool32,
    shaderRoundingModeRTZFloat32 : Bool32,
    shaderRoundingModeRTZFloat64 : Bool32,
};

DescriptorSetLayoutBindingFlagsCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    bindingCount : u32,
    pBindingFlags : ^DescriptorBindingFlags,
};

PhysicalDeviceDescriptorIndexingFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderInputAttachmentArrayDynamicIndexing : Bool32,
    shaderUniformTexelBufferArrayDynamicIndexing : Bool32,
    shaderStorageTexelBufferArrayDynamicIndexing : Bool32,
    shaderUniformBufferArrayNonUniformIndexing : Bool32,
    shaderSampledImageArrayNonUniformIndexing : Bool32,
    shaderStorageBufferArrayNonUniformIndexing : Bool32,
    shaderStorageImageArrayNonUniformIndexing : Bool32,
    shaderInputAttachmentArrayNonUniformIndexing : Bool32,
    shaderUniformTexelBufferArrayNonUniformIndexing : Bool32,
    shaderStorageTexelBufferArrayNonUniformIndexing : Bool32,
    descriptorBindingUniformBufferUpdateAfterBind : Bool32,
    descriptorBindingSampledImageUpdateAfterBind : Bool32,
    descriptorBindingStorageImageUpdateAfterBind : Bool32,
    descriptorBindingStorageBufferUpdateAfterBind : Bool32,
    descriptorBindingUniformTexelBufferUpdateAfterBind : Bool32,
    descriptorBindingStorageTexelBufferUpdateAfterBind : Bool32,
    descriptorBindingUpdateUnusedWhilePending : Bool32,
    descriptorBindingPartiallyBound : Bool32,
    descriptorBindingVariableDescriptorCount : Bool32,
    runtimeDescriptorArray : Bool32,
};

PhysicalDeviceDescriptorIndexingProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxUpdateAfterBindDescriptorsInAllPools : u32,
    shaderUniformBufferArrayNonUniformIndexingNative : Bool32,
    shaderSampledImageArrayNonUniformIndexingNative : Bool32,
    shaderStorageBufferArrayNonUniformIndexingNative : Bool32,
    shaderStorageImageArrayNonUniformIndexingNative : Bool32,
    shaderInputAttachmentArrayNonUniformIndexingNative : Bool32,
    robustBufferAccessUpdateAfterBind : Bool32,
    quadDivergentImplicitLod : Bool32,
    maxPerStageDescriptorUpdateAfterBindSamplers : u32,
    maxPerStageDescriptorUpdateAfterBindUniformBuffers : u32,
    maxPerStageDescriptorUpdateAfterBindStorageBuffers : u32,
    maxPerStageDescriptorUpdateAfterBindSampledImages : u32,
    maxPerStageDescriptorUpdateAfterBindStorageImages : u32,
    maxPerStageDescriptorUpdateAfterBindInputAttachments : u32,
    maxPerStageUpdateAfterBindResources : u32,
    maxDescriptorSetUpdateAfterBindSamplers : u32,
    maxDescriptorSetUpdateAfterBindUniformBuffers : u32,
    maxDescriptorSetUpdateAfterBindUniformBuffersDynamic : u32,
    maxDescriptorSetUpdateAfterBindStorageBuffers : u32,
    maxDescriptorSetUpdateAfterBindStorageBuffersDynamic : u32,
    maxDescriptorSetUpdateAfterBindSampledImages : u32,
    maxDescriptorSetUpdateAfterBindStorageImages : u32,
    maxDescriptorSetUpdateAfterBindInputAttachments : u32,
};

DescriptorSetVariableDescriptorCountAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    descriptorSetCount : u32,
    pDescriptorCounts : ^u32,
};

DescriptorSetVariableDescriptorCountLayoutSupport :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxVariableDescriptorCount : u32,
};

SubpassDescriptionDepthStencilResolve :: struct {
    sType : StructureType,
    pNext : rawptr,
    depthResolveMode : ResolveModeFlagBits,
    stencilResolveMode : ResolveModeFlagBits,
    pDepthStencilResolveAttachment : ^AttachmentReference2,
};

PhysicalDeviceDepthStencilResolveProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    supportedDepthResolveModes : ResolveModeFlags,
    supportedStencilResolveModes : ResolveModeFlags,
    independentResolveNone : Bool32,
    independentResolve : Bool32,
};

PhysicalDeviceScalarBlockLayoutFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    scalarBlockLayout : Bool32,
};

ImageStencilUsageCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    stencilUsage : ImageUsageFlags,
};

SamplerReductionModeCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    reductionMode : SamplerReductionMode,
};

PhysicalDeviceSamplerFilterMinmaxProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    filterMinmaxSingleComponentFormats : Bool32,
    filterMinmaxImageComponentMapping : Bool32,
};

PhysicalDeviceVulkanMemoryModelFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    vulkanMemoryModel : Bool32,
    vulkanMemoryModelDeviceScope : Bool32,
    vulkanMemoryModelAvailabilityVisibilityChains : Bool32,
};

PhysicalDeviceImagelessFramebufferFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    imagelessFramebuffer : Bool32,
};

FramebufferAttachmentImageInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : ImageCreateFlags,
    usage : ImageUsageFlags,
    width : u32,
    height : u32,
    layerCount : u32,
    viewFormatCount : u32,
    pViewFormats : ^Format,
};

FramebufferAttachmentsCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    attachmentImageInfoCount : u32,
    pAttachmentImageInfos : ^FramebufferAttachmentImageInfo,
};

RenderPassAttachmentBeginInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    attachmentCount : u32,
    pAttachments : ^ImageView,
};

PhysicalDeviceUniformBufferStandardLayoutFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    uniformBufferStandardLayout : Bool32,
};

PhysicalDeviceShaderSubgroupExtendedTypesFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderSubgroupExtendedTypes : Bool32,
};

PhysicalDeviceSeparateDepthStencilLayoutsFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    separateDepthStencilLayouts : Bool32,
};

AttachmentReferenceStencilLayout :: struct {
    sType : StructureType,
    pNext : rawptr,
    stencilLayout : ImageLayout,
};

AttachmentDescriptionStencilLayout :: struct {
    sType : StructureType,
    pNext : rawptr,
    stencilInitialLayout : ImageLayout,
    stencilFinalLayout : ImageLayout,
};

PhysicalDeviceHostQueryResetFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    hostQueryReset : Bool32,
};

PhysicalDeviceTimelineSemaphoreFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    timelineSemaphore : Bool32,
};

PhysicalDeviceTimelineSemaphoreProperties :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxTimelineSemaphoreValueDifference : u64,
};

SemaphoreTypeCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    semaphoreType : SemaphoreType,
    initialValue : u64,
};

TimelineSemaphoreSubmitInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    waitSemaphoreValueCount : u32,
    pWaitSemaphoreValues : ^u64,
    signalSemaphoreValueCount : u32,
    pSignalSemaphoreValues : ^u64,
};

SemaphoreWaitInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : SemaphoreWaitFlags,
    semaphoreCount : u32,
    pSemaphores : ^Semaphore,
    pValues : ^u64,
};

SemaphoreSignalInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    semaphore : Semaphore,
    value : u64,
};

PhysicalDeviceBufferDeviceAddressFeatures :: struct {
    sType : StructureType,
    pNext : rawptr,
    bufferDeviceAddress : Bool32,
    bufferDeviceAddressCaptureReplay : Bool32,
    bufferDeviceAddressMultiDevice : Bool32,
};

BufferDeviceAddressInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    buffer : Buffer,
};

BufferOpaqueCaptureAddressCreateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    opaqueCaptureAddress : u64,
};

MemoryOpaqueCaptureAddressAllocateInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    opaqueCaptureAddress : u64,
};

DeviceMemoryOpaqueCaptureAddressInfo :: struct {
    sType : StructureType,
    pNext : rawptr,
    memory : DeviceMemory,
};

SurfaceKHRT :: struct {};

SurfaceCapabilitiesKHR :: struct {
    minImageCount : u32,
    maxImageCount : u32,
    currentExtent : Extent2D,
    minImageExtent : Extent2D,
    maxImageExtent : Extent2D,
    maxImageArrayLayers : u32,
    supportedTransforms : SurfaceTransformFlagsKHR,
    currentTransform : SurfaceTransformFlagBitsKHR,
    supportedCompositeAlpha : CompositeAlphaFlagsKHR,
    supportedUsageFlags : ImageUsageFlags,
};

SurfaceFormatKHR :: struct {
    format : Format,
    colorSpace : ColorSpaceKHR,
};

SwapchainKHRT :: struct {};

SwapchainCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : SwapchainCreateFlagsKHR,
    surface : SurfaceKHR,
    minImageCount : u32,
    imageFormat : Format,
    imageColorSpace : ColorSpaceKHR,
    imageExtent : Extent2D,
    imageArrayLayers : u32,
    imageUsage : ImageUsageFlags,
    imageSharingMode : SharingMode,
    queueFamilyIndexCount : u32,
    pQueueFamilyIndices : ^u32,
    preTransform : SurfaceTransformFlagBitsKHR,
    compositeAlpha : CompositeAlphaFlagBitsKHR,
    presentMode : PresentModeKHR,
    clipped : Bool32,
    oldSwapchain : SwapchainKHR,
};

PresentInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    waitSemaphoreCount : u32,
    pWaitSemaphores : ^Semaphore,
    swapchainCount : u32,
    pSwapchains : ^SwapchainKHR,
    pImageIndices : ^u32,
    pResults : ^Result,
};

ImageSwapchainCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    swapchain : SwapchainKHR,
};

BindImageMemorySwapchainInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    swapchain : SwapchainKHR,
    imageIndex : u32,
};

AcquireNextImageInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    swapchain : SwapchainKHR,
    timeout : u64,
    semaphore : Semaphore,
    fence : Fence,
    deviceMask : u32,
};

DeviceGroupPresentCapabilitiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    presentMask : [32]u32,
    modes : DeviceGroupPresentModeFlagsKHR,
};

DeviceGroupPresentInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    swapchainCount : u32,
    pDeviceMasks : ^u32,
    mode : DeviceGroupPresentModeFlagBitsKHR,
};

DeviceGroupSwapchainCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    modes : DeviceGroupPresentModeFlagsKHR,
};

DisplayKHRT :: struct {};

DisplayModeKHRT :: struct {};

DisplayPropertiesKHR :: struct {
    display : DisplayKHR,
    displayName : cstring,
    physicalDimensions : Extent2D,
    physicalResolution : Extent2D,
    supportedTransforms : SurfaceTransformFlagsKHR,
    planeReorderPossible : Bool32,
    persistentContent : Bool32,
};

DisplayModeParametersKHR :: struct {
    visibleRegion : Extent2D,
    refreshRate : u32,
};

DisplayModePropertiesKHR :: struct {
    displayMode : DisplayModeKHR,
    parameters : DisplayModeParametersKHR,
};

DisplayModeCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DisplayModeCreateFlagsKHR,
    parameters : DisplayModeParametersKHR,
};

DisplayPlaneCapabilitiesKHR :: struct {
    supportedAlpha : DisplayPlaneAlphaFlagsKHR,
    minSrcPosition : Offset2D,
    maxSrcPosition : Offset2D,
    minSrcExtent : Extent2D,
    maxSrcExtent : Extent2D,
    minDstPosition : Offset2D,
    maxDstPosition : Offset2D,
    minDstExtent : Extent2D,
    maxDstExtent : Extent2D,
};

DisplayPlanePropertiesKHR :: struct {
    currentDisplay : DisplayKHR,
    currentStackIndex : u32,
};

DisplaySurfaceCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DisplaySurfaceCreateFlagsKHR,
    displayMode : DisplayModeKHR,
    planeIndex : u32,
    planeStackIndex : u32,
    transform : SurfaceTransformFlagBitsKHR,
    globalAlpha : _c.float,
    alphaMode : DisplayPlaneAlphaFlagBitsKHR,
    imageExtent : Extent2D,
};

DisplayPresentInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcRect : Rect2D,
    dstRect : Rect2D,
    persistent : Bool32,
};

ImportMemoryFdInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleType : ExternalMemoryHandleTypeFlagBits,
    fd : _c.int,
};

MemoryFdPropertiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    memoryTypeBits : u32,
};

MemoryGetFdInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    memory : DeviceMemory,
    handleType : ExternalMemoryHandleTypeFlagBits,
};

ImportSemaphoreFdInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    semaphore : Semaphore,
    flags : SemaphoreImportFlags,
    handleType : ExternalSemaphoreHandleTypeFlagBits,
    fd : _c.int,
};

SemaphoreGetFdInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    semaphore : Semaphore,
    handleType : ExternalSemaphoreHandleTypeFlagBits,
};

PhysicalDevicePushDescriptorPropertiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxPushDescriptors : u32,
};

RectLayerKHR :: struct {
    offset : Offset2D,
    extent : Extent2D,
    layer : u32,
};

PresentRegionKHR :: struct {
    rectangleCount : u32,
    pRectangles : ^RectLayerKHR,
};

PresentRegionsKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    swapchainCount : u32,
    pRegions : ^PresentRegionKHR,
};

SharedPresentSurfaceCapabilitiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    sharedPresentSupportedUsageFlags : ImageUsageFlags,
};

ImportFenceFdInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    fence : Fence,
    flags : FenceImportFlags,
    handleType : ExternalFenceHandleTypeFlagBits,
    fd : _c.int,
};

FenceGetFdInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    fence : Fence,
    handleType : ExternalFenceHandleTypeFlagBits,
};

PhysicalDevicePerformanceQueryFeaturesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    performanceCounterQueryPools : Bool32,
    performanceCounterMultipleQueryPools : Bool32,
};

PhysicalDevicePerformanceQueryPropertiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    allowCommandBufferQueryCopies : Bool32,
};

PerformanceCounterKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    unit : PerformanceCounterUnitKHR,
    scope : PerformanceCounterScopeKHR,
    storage : PerformanceCounterStorageKHR,
    uuid : [16]u8,
};

PerformanceCounterDescriptionKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PerformanceCounterDescriptionFlagsKHR,
    name : [256]_c.char,
    category : [256]_c.char,
    description : [256]_c.char,
};

QueryPoolPerformanceCreateInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    queueFamilyIndex : u32,
    counterIndexCount : u32,
    pCounterIndices : ^u32,
};

AcquireProfilingLockInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : AcquireProfilingLockFlagsKHR,
    timeout : u64,
};

PerformanceQuerySubmitInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    counterPassIndex : u32,
};

PhysicalDeviceSurfaceInfo2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    surface : SurfaceKHR,
};

SurfaceCapabilities2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    surfaceCapabilities : SurfaceCapabilitiesKHR,
};

SurfaceFormat2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    surfaceFormat : SurfaceFormatKHR,
};

DisplayProperties2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    displayProperties : DisplayPropertiesKHR,
};

DisplayPlaneProperties2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    displayPlaneProperties : DisplayPlanePropertiesKHR,
};

DisplayModeProperties2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    displayModeProperties : DisplayModePropertiesKHR,
};

DisplayPlaneInfo2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    mode : DisplayModeKHR,
    planeIndex : u32,
};

DisplayPlaneCapabilities2KHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    capabilities : DisplayPlaneCapabilitiesKHR,
};

PhysicalDeviceShaderClockFeaturesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderSubgroupClock : Bool32,
    shaderDeviceClock : Bool32,
};

SurfaceProtectedCapabilitiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    supportsProtected : Bool32,
};

PhysicalDevicePipelineExecutablePropertiesFeaturesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    pipelineExecutableInfo : Bool32,
};

PipelineInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    pipeline : Pipeline,
};

PipelineExecutablePropertiesKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    stages : ShaderStageFlags,
    name : [256]_c.char,
    description : [256]_c.char,
    subgroupSize : u32,
};

PipelineExecutableInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    pipeline : Pipeline,
    executableIndex : u32,
};

PipelineExecutableStatisticKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    name : [256]_c.char,
    description : [256]_c.char,
    format : PipelineExecutableStatisticFormatKHR,
    value : PipelineExecutableStatisticValueKHR,
};

PipelineExecutableInternalRepresentationKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    name : [256]_c.char,
    description : [256]_c.char,
    isText : Bool32,
    dataSize : _c.size_t,
    pData : rawptr,
};

DebugReportCallbackEXTT :: struct {};

DebugReportCallbackCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DebugReportFlagsEXT,
    pfnCallback : PFN_DebugReportCallbackEXT,
    pUserData : rawptr,
};

PipelineRasterizationStateRasterizationOrderAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    rasterizationOrder : RasterizationOrderAMD,
};

DebugMarkerObjectNameInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    objectType : DebugReportObjectTypeEXT,
    object : u64,
    pObjectName : cstring,
};

DebugMarkerObjectTagInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    objectType : DebugReportObjectTypeEXT,
    object : u64,
    tagName : u64,
    tagSize : _c.size_t,
    pTag : rawptr,
};

DebugMarkerMarkerInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    pMarkerName : cstring,
    color : [4]_c.float,
};

DedicatedAllocationImageCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    dedicatedAllocation : Bool32,
};

DedicatedAllocationBufferCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    dedicatedAllocation : Bool32,
};

DedicatedAllocationMemoryAllocateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    image : Image,
    buffer : Buffer,
};

PhysicalDeviceTransformFeedbackFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    transformFeedback : Bool32,
    geometryStreams : Bool32,
};

PhysicalDeviceTransformFeedbackPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxTransformFeedbackStreams : u32,
    maxTransformFeedbackBuffers : u32,
    maxTransformFeedbackBufferSize : DeviceSize,
    maxTransformFeedbackStreamDataSize : u32,
    maxTransformFeedbackBufferDataSize : u32,
    maxTransformFeedbackBufferDataStride : u32,
    transformFeedbackQueries : Bool32,
    transformFeedbackStreamsLinesTriangles : Bool32,
    transformFeedbackRasterizationStreamSelect : Bool32,
    transformFeedbackDraw : Bool32,
};

PipelineRasterizationStateStreamCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineRasterizationStateStreamCreateFlagsEXT,
    rasterizationStream : u32,
};

ImageViewHandleInfoNVX :: struct {
    sType : StructureType,
    pNext : rawptr,
    imageView : ImageView,
    descriptorType : DescriptorType,
    sampler : Sampler,
};

ImageViewAddressPropertiesNVX :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceAddress : DeviceAddress,
    size : DeviceSize,
};

TextureLODGatherFormatPropertiesAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    supportsTextureGatherLODBiasAMD : Bool32,
};

ShaderResourceUsageAMD :: struct {
    numUsedVgprs : u32,
    numUsedSgprs : u32,
    ldsSizePerLocalWorkGroup : u32,
    ldsUsageSizeInBytes : _c.size_t,
    scratchMemUsageInBytes : _c.size_t,
};

ShaderStatisticsInfoAMD :: struct {
    shaderStageMask : ShaderStageFlags,
    resourceUsage : ShaderResourceUsageAMD,
    numPhysicalVgprs : u32,
    numPhysicalSgprs : u32,
    numAvailableVgprs : u32,
    numAvailableSgprs : u32,
    computeWorkGroupSize : [3]u32,
};

PhysicalDeviceCornerSampledImageFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    cornerSampledImage : Bool32,
};

ExternalImageFormatPropertiesNV :: struct {
    imageFormatProperties : ImageFormatProperties,
    externalMemoryFeatures : ExternalMemoryFeatureFlagsNV,
    exportFromImportedHandleTypes : ExternalMemoryHandleTypeFlagsNV,
    compatibleHandleTypes : ExternalMemoryHandleTypeFlagsNV,
};

ExternalMemoryImageCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalMemoryHandleTypeFlagsNV,
};

ExportMemoryAllocateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleTypes : ExternalMemoryHandleTypeFlagsNV,
};

ValidationFlagsEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    disabledValidationCheckCount : u32,
    pDisabledValidationChecks : ^ValidationCheckEXT,
};

PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    textureCompressionASTC_HDR : Bool32,
};

ImageViewASTCDecodeModeEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    decodeMode : Format,
};

PhysicalDeviceASTCDecodeFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    decodeModeSharedExponent : Bool32,
};

ConditionalRenderingBeginInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    buffer : Buffer,
    offset : DeviceSize,
    flags : ConditionalRenderingFlagsEXT,
};

PhysicalDeviceConditionalRenderingFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    conditionalRendering : Bool32,
    inheritedConditionalRendering : Bool32,
};

CommandBufferInheritanceConditionalRenderingInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    conditionalRenderingEnable : Bool32,
};

ViewportWScalingNV :: struct {
    xcoeff : _c.float,
    ycoeff : _c.float,
};

PipelineViewportWScalingStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    viewportWScalingEnable : Bool32,
    viewportCount : u32,
    pViewportWScalings : ^ViewportWScalingNV,
};

SurfaceCapabilities2EXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    minImageCount : u32,
    maxImageCount : u32,
    currentExtent : Extent2D,
    minImageExtent : Extent2D,
    maxImageExtent : Extent2D,
    maxImageArrayLayers : u32,
    supportedTransforms : SurfaceTransformFlagsKHR,
    currentTransform : SurfaceTransformFlagBitsKHR,
    supportedCompositeAlpha : CompositeAlphaFlagsKHR,
    supportedUsageFlags : ImageUsageFlags,
    supportedSurfaceCounters : SurfaceCounterFlagsEXT,
};

DisplayPowerInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    powerState : DisplayPowerStateEXT,
};

DeviceEventInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceEvent : DeviceEventTypeEXT,
};

DisplayEventInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    displayEvent : DisplayEventTypeEXT,
};

SwapchainCounterCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    surfaceCounters : SurfaceCounterFlagsEXT,
};

RefreshCycleDurationGOOGLE :: struct {
    refreshDuration : u64,
};

PastPresentationTimingGOOGLE :: struct {
    presentID : u32,
    desiredPresentTime : u64,
    actualPresentTime : u64,
    earliestPresentTime : u64,
    presentMargin : u64,
};

PresentTimeGOOGLE :: struct {
    presentID : u32,
    desiredPresentTime : u64,
};

PresentTimesInfoGOOGLE :: struct {
    sType : StructureType,
    pNext : rawptr,
    swapchainCount : u32,
    pTimes : ^PresentTimeGOOGLE,
};

PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX :: struct {
    sType : StructureType,
    pNext : rawptr,
    perViewPositionAllComponents : Bool32,
};

ViewportSwizzleNV :: struct {
    x : ViewportCoordinateSwizzleNV,
    y : ViewportCoordinateSwizzleNV,
    z : ViewportCoordinateSwizzleNV,
    w : ViewportCoordinateSwizzleNV,
};

PipelineViewportSwizzleStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineViewportSwizzleStateCreateFlagsNV,
    viewportCount : u32,
    pViewportSwizzles : ^ViewportSwizzleNV,
};

PhysicalDeviceDiscardRectanglePropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxDiscardRectangles : u32,
};

PipelineDiscardRectangleStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineDiscardRectangleStateCreateFlagsEXT,
    discardRectangleMode : DiscardRectangleModeEXT,
    discardRectangleCount : u32,
    pDiscardRectangles : ^Rect2D,
};

PhysicalDeviceConservativeRasterizationPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    primitiveOverestimationSize : _c.float,
    maxExtraPrimitiveOverestimationSize : _c.float,
    extraPrimitiveOverestimationSizeGranularity : _c.float,
    primitiveUnderestimation : Bool32,
    conservativePointAndLineRasterization : Bool32,
    degenerateTrianglesRasterized : Bool32,
    degenerateLinesRasterized : Bool32,
    fullyCoveredFragmentShaderInputVariable : Bool32,
    conservativeRasterizationPostDepthCoverage : Bool32,
};

PipelineRasterizationConservativeStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineRasterizationConservativeStateCreateFlagsEXT,
    conservativeRasterizationMode : ConservativeRasterizationModeEXT,
    extraPrimitiveOverestimationSize : _c.float,
};

PhysicalDeviceDepthClipEnableFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    depthClipEnable : Bool32,
};

PipelineRasterizationDepthClipStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineRasterizationDepthClipStateCreateFlagsEXT,
    depthClipEnable : Bool32,
};

XYColorEXT :: struct {
    x : _c.float,
    y : _c.float,
};

HdrMetadataEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    displayPrimaryRed : XYColorEXT,
    displayPrimaryGreen : XYColorEXT,
    displayPrimaryBlue : XYColorEXT,
    whitePoint : XYColorEXT,
    maxLuminance : _c.float,
    minLuminance : _c.float,
    maxContentLightLevel : _c.float,
    maxFrameAverageLightLevel : _c.float,
};

DebugUtilsMessengerEXTT :: struct {};

DebugUtilsLabelEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    pLabelName : cstring,
    color : [4]_c.float,
};

DebugUtilsObjectNameInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    objectType : ObjectType,
    objectHandle : u64,
    pObjectName : cstring,
};

DebugUtilsMessengerCallbackDataEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DebugUtilsMessengerCallbackDataFlagsEXT,
    pMessageIdName : cstring,
    messageIdNumber : i32,
    pMessage : cstring,
    queueLabelCount : u32,
    pQueueLabels : ^DebugUtilsLabelEXT,
    cmdBufLabelCount : u32,
    pCmdBufLabels : ^DebugUtilsLabelEXT,
    objectCount : u32,
    pObjects : ^DebugUtilsObjectNameInfoEXT,
};

DebugUtilsObjectTagInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    objectType : ObjectType,
    objectHandle : u64,
    tagName : u64,
    tagSize : _c.size_t,
    pTag : rawptr,
};

DebugUtilsMessengerCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DebugUtilsMessengerCreateFlagsEXT,
    messageSeverity : DebugUtilsMessageSeverityFlagsEXT,
    messageType : DebugUtilsMessageTypeFlagsEXT,
    pfnUserCallback : PFN_DebugUtilsMessengerCallbackEXT,
    pUserData : rawptr,
};

PhysicalDeviceInlineUniformBlockFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    inlineUniformBlock : Bool32,
    descriptorBindingInlineUniformBlockUpdateAfterBind : Bool32,
};

PhysicalDeviceInlineUniformBlockPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxInlineUniformBlockSize : u32,
    maxPerStageDescriptorInlineUniformBlocks : u32,
    maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks : u32,
    maxDescriptorSetInlineUniformBlocks : u32,
    maxDescriptorSetUpdateAfterBindInlineUniformBlocks : u32,
};

WriteDescriptorSetInlineUniformBlockEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    dataSize : u32,
    pData : rawptr,
};

DescriptorPoolInlineUniformBlockCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxInlineUniformBlockBindings : u32,
};

SampleLocationEXT :: struct {
    x : _c.float,
    y : _c.float,
};

SampleLocationsInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    sampleLocationsPerPixel : SampleCountFlagBits,
    sampleLocationGridSize : Extent2D,
    sampleLocationsCount : u32,
    pSampleLocations : ^SampleLocationEXT,
};

AttachmentSampleLocationsEXT :: struct {
    attachmentIndex : u32,
    sampleLocationsInfo : SampleLocationsInfoEXT,
};

SubpassSampleLocationsEXT :: struct {
    subpassIndex : u32,
    sampleLocationsInfo : SampleLocationsInfoEXT,
};

RenderPassSampleLocationsBeginInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    attachmentInitialSampleLocationsCount : u32,
    pAttachmentInitialSampleLocations : ^AttachmentSampleLocationsEXT,
    postSubpassSampleLocationsCount : u32,
    pPostSubpassSampleLocations : ^SubpassSampleLocationsEXT,
};

PipelineSampleLocationsStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    sampleLocationsEnable : Bool32,
    sampleLocationsInfo : SampleLocationsInfoEXT,
};

PhysicalDeviceSampleLocationsPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    sampleLocationSampleCounts : SampleCountFlags,
    maxSampleLocationGridSize : Extent2D,
    sampleLocationCoordinateRange : [2]_c.float,
    sampleLocationSubPixelBits : u32,
    variableSampleLocations : Bool32,
};

MultisamplePropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxSampleLocationGridSize : Extent2D,
};

PhysicalDeviceBlendOperationAdvancedFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    advancedBlendCoherentOperations : Bool32,
};

PhysicalDeviceBlendOperationAdvancedPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    advancedBlendMaxColorAttachments : u32,
    advancedBlendIndependentBlend : Bool32,
    advancedBlendNonPremultipliedSrcColor : Bool32,
    advancedBlendNonPremultipliedDstColor : Bool32,
    advancedBlendCorrelatedOverlap : Bool32,
    advancedBlendAllOperations : Bool32,
};

PipelineColorBlendAdvancedStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    srcPremultiplied : Bool32,
    dstPremultiplied : Bool32,
    blendOverlap : BlendOverlapEXT,
};

PipelineCoverageToColorStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCoverageToColorStateCreateFlagsNV,
    coverageToColorEnable : Bool32,
    coverageToColorLocation : u32,
};

PipelineCoverageModulationStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCoverageModulationStateCreateFlagsNV,
    coverageModulationMode : CoverageModulationModeNV,
    coverageModulationTableEnable : Bool32,
    coverageModulationTableCount : u32,
    pCoverageModulationTable : ^_c.float,
};

PhysicalDeviceShaderSMBuiltinsPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderSMCount : u32,
    shaderWarpsPerSM : u32,
};

PhysicalDeviceShaderSMBuiltinsFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderSMBuiltins : Bool32,
};

DrmFormatModifierPropertiesEXT :: struct {
    drmFormatModifier : u64,
    drmFormatModifierPlaneCount : u32,
    drmFormatModifierTilingFeatures : FormatFeatureFlags,
};

DrmFormatModifierPropertiesListEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    drmFormatModifierCount : u32,
    pDrmFormatModifierProperties : ^DrmFormatModifierPropertiesEXT,
};

PhysicalDeviceImageDrmFormatModifierInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    drmFormatModifier : u64,
    sharingMode : SharingMode,
    queueFamilyIndexCount : u32,
    pQueueFamilyIndices : ^u32,
};

ImageDrmFormatModifierListCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    drmFormatModifierCount : u32,
    pDrmFormatModifiers : ^u64,
};

ImageDrmFormatModifierExplicitCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    drmFormatModifier : u64,
    drmFormatModifierPlaneCount : u32,
    pPlaneLayouts : ^SubresourceLayout,
};

ImageDrmFormatModifierPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    drmFormatModifier : u64,
};

ValidationCacheEXTT :: struct {};

ValidationCacheCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : ValidationCacheCreateFlagsEXT,
    initialDataSize : _c.size_t,
    pInitialData : rawptr,
};

ShaderModuleValidationCacheCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    validationCache : ValidationCacheEXT,
};

ShadingRatePaletteNV :: struct {
    shadingRatePaletteEntryCount : u32,
    pShadingRatePaletteEntries : ^ShadingRatePaletteEntryNV,
};

PipelineViewportShadingRateImageStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    shadingRateImageEnable : Bool32,
    viewportCount : u32,
    pShadingRatePalettes : ^ShadingRatePaletteNV,
};

PhysicalDeviceShadingRateImageFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    shadingRateImage : Bool32,
    shadingRateCoarseSampleOrder : Bool32,
};

PhysicalDeviceShadingRateImagePropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    shadingRateTexelSize : Extent2D,
    shadingRatePaletteSize : u32,
    shadingRateMaxCoarseSamples : u32,
};

CoarseSampleLocationNV :: struct {
    pixelX : u32,
    pixelY : u32,
    sample : u32,
};

CoarseSampleOrderCustomNV :: struct {
    shadingRate : ShadingRatePaletteEntryNV,
    sampleCount : u32,
    sampleLocationCount : u32,
    pSampleLocations : ^CoarseSampleLocationNV,
};

PipelineViewportCoarseSampleOrderStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    sampleOrderType : CoarseSampleOrderTypeNV,
    customSampleOrderCount : u32,
    pCustomSampleOrders : ^CoarseSampleOrderCustomNV,
};

AccelerationStructureKHRT :: struct {};

RayTracingShaderGroupCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    type : RayTracingShaderGroupTypeKHR,
    generalShader : u32,
    closestHitShader : u32,
    anyHitShader : u32,
    intersectionShader : u32,
};

RayTracingPipelineCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCreateFlags,
    stageCount : u32,
    pStages : ^PipelineShaderStageCreateInfo,
    groupCount : u32,
    pGroups : ^RayTracingShaderGroupCreateInfoNV,
    maxRecursionDepth : u32,
    layout : PipelineLayout,
    basePipelineHandle : Pipeline,
    basePipelineIndex : i32,
};

GeometryTrianglesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    vertexData : Buffer,
    vertexOffset : DeviceSize,
    vertexCount : u32,
    vertexStride : DeviceSize,
    vertexFormat : Format,
    indexData : Buffer,
    indexOffset : DeviceSize,
    indexCount : u32,
    indexType : IndexType,
    transformData : Buffer,
    transformOffset : DeviceSize,
};

GeometryAABBNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    aabbData : Buffer,
    numAABBs : u32,
    stride : u32,
    offset : DeviceSize,
};

GeometryDataNV :: struct {
    triangles : GeometryTrianglesNV,
    aabbs : GeometryAABBNV,
};

GeometryNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    geometryType : GeometryTypeKHR,
    geometry : GeometryDataNV,
    flags : GeometryFlagsKHR,
};

AccelerationStructureInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    type : AccelerationStructureTypeNV,
    flags : BuildAccelerationStructureFlagsNV,
    instanceCount : u32,
    geometryCount : u32,
    pGeometries : ^GeometryNV,
};

AccelerationStructureCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    compactedSize : DeviceSize,
    info : AccelerationStructureInfoNV,
};

BindAccelerationStructureMemoryInfoKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    accelerationStructure : AccelerationStructureKHR,
    memory : DeviceMemory,
    memoryOffset : DeviceSize,
    deviceIndexCount : u32,
    pDeviceIndices : ^u32,
};

WriteDescriptorSetAccelerationStructureKHR :: struct {
    sType : StructureType,
    pNext : rawptr,
    accelerationStructureCount : u32,
    pAccelerationStructures : ^AccelerationStructureKHR,
};

AccelerationStructureMemoryRequirementsInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    type : AccelerationStructureMemoryRequirementsTypeNV,
    accelerationStructure : AccelerationStructureNV,
};

PhysicalDeviceRayTracingPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderGroupHandleSize : u32,
    maxRecursionDepth : u32,
    maxShaderGroupStride : u32,
    shaderGroupBaseAlignment : u32,
    maxGeometryCount : u64,
    maxInstanceCount : u64,
    maxTriangleCount : u64,
    maxDescriptorSetAccelerationStructures : u32,
};

TransformMatrixKHR :: struct {
    matrix : [3][4]_c.float,
};

AabbPositionsKHR :: struct {
    minX : _c.float,
    minY : _c.float,
    minZ : _c.float,
    maxX : _c.float,
    maxY : _c.float,
    maxZ : _c.float,
};

AccelerationStructureInstanceKHR :: struct {
    transform : TransformMatrixKHR,
    instanceCustomIndex : u32,
    mask : u32,
    instanceShaderBindingTableRecordOffset : u32,
    flags : GeometryInstanceFlagsKHR,
    accelerationStructureReference : u64,
};

PhysicalDeviceRepresentativeFragmentTestFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    representativeFragmentTest : Bool32,
};

PipelineRepresentativeFragmentTestStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    representativeFragmentTestEnable : Bool32,
};

PhysicalDeviceImageViewImageFormatInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    imageViewType : ImageViewType,
};

FilterCubicImageViewImageFormatPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    filterCubic : Bool32,
    filterCubicMinmax : Bool32,
};

DeviceQueueGlobalPriorityCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    globalPriority : QueueGlobalPriorityEXT,
};

ImportMemoryHostPointerInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    handleType : ExternalMemoryHandleTypeFlagBits,
    pHostPointer : rawptr,
};

MemoryHostPointerPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    memoryTypeBits : u32,
};

PhysicalDeviceExternalMemoryHostPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    minImportedHostPointerAlignment : DeviceSize,
};

PipelineCompilerControlCreateInfoAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    compilerControlFlags : PipelineCompilerControlFlagsAMD,
};

CalibratedTimestampInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    timeDomain : TimeDomainEXT,
};

PhysicalDeviceShaderCorePropertiesAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderEngineCount : u32,
    shaderArraysPerEngineCount : u32,
    computeUnitsPerShaderArray : u32,
    simdPerComputeUnit : u32,
    wavefrontsPerSimd : u32,
    wavefrontSize : u32,
    sgprsPerSimd : u32,
    minSgprAllocation : u32,
    maxSgprAllocation : u32,
    sgprAllocationGranularity : u32,
    vgprsPerSimd : u32,
    minVgprAllocation : u32,
    maxVgprAllocation : u32,
    vgprAllocationGranularity : u32,
};

DeviceMemoryOverallocationCreateInfoAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    overallocationBehavior : MemoryOverallocationBehaviorAMD,
};

PhysicalDeviceVertexAttributeDivisorPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxVertexAttribDivisor : u32,
};

VertexInputBindingDivisorDescriptionEXT :: struct {
    binding : u32,
    divisor : u32,
};

PipelineVertexInputDivisorStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    vertexBindingDivisorCount : u32,
    pVertexBindingDivisors : ^VertexInputBindingDivisorDescriptionEXT,
};

PhysicalDeviceVertexAttributeDivisorFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    vertexAttributeInstanceRateDivisor : Bool32,
    vertexAttributeInstanceRateZeroDivisor : Bool32,
};

PipelineCreationFeedbackEXT :: struct {
    flags : PipelineCreationFeedbackFlagsEXT,
    duration : u64,
};

PipelineCreationFeedbackCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    pPipelineCreationFeedback : ^PipelineCreationFeedbackEXT,
    pipelineStageCreationFeedbackCount : u32,
    pPipelineStageCreationFeedbacks : ^PipelineCreationFeedbackEXT,
};

PhysicalDeviceComputeShaderDerivativesFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    computeDerivativeGroupQuads : Bool32,
    computeDerivativeGroupLinear : Bool32,
};

PhysicalDeviceMeshShaderFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    taskShader : Bool32,
    meshShader : Bool32,
};

PhysicalDeviceMeshShaderPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxDrawMeshTasksCount : u32,
    maxTaskWorkGroupInvocations : u32,
    maxTaskWorkGroupSize : [3]u32,
    maxTaskTotalMemorySize : u32,
    maxTaskOutputCount : u32,
    maxMeshWorkGroupInvocations : u32,
    maxMeshWorkGroupSize : [3]u32,
    maxMeshTotalMemorySize : u32,
    maxMeshOutputVertices : u32,
    maxMeshOutputPrimitives : u32,
    maxMeshMultiviewViewCount : u32,
    meshOutputPerVertexGranularity : u32,
    meshOutputPerPrimitiveGranularity : u32,
};

DrawMeshTasksIndirectCommandNV :: struct {
    taskCount : u32,
    firstTask : u32,
};

PhysicalDeviceFragmentShaderBarycentricFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    fragmentShaderBarycentric : Bool32,
};

PhysicalDeviceShaderImageFootprintFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    imageFootprint : Bool32,
};

PipelineViewportExclusiveScissorStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    exclusiveScissorCount : u32,
    pExclusiveScissors : ^Rect2D,
};

PhysicalDeviceExclusiveScissorFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    exclusiveScissor : Bool32,
};

QueueFamilyCheckpointPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    checkpointExecutionStageMask : PipelineStageFlags,
};

CheckpointDataNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    stage : PipelineStageFlagBits,
    pCheckpointMarker : rawptr,
};

PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderIntegerFunctions2 : Bool32,
};

PerformanceConfigurationINTELT :: struct {};

PerformanceValueINTEL :: struct {
    type : PerformanceValueTypeINTEL,
    data : PerformanceValueDataINTEL,
};

InitializePerformanceApiInfoINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    pUserData : rawptr,
};

QueryPoolPerformanceQueryCreateInfoINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    performanceCountersSampling : QueryPoolSamplingModeINTEL,
};

PerformanceMarkerInfoINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    marker : u64,
};

PerformanceStreamMarkerInfoINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    marker : u32,
};

PerformanceOverrideInfoINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    type : PerformanceOverrideTypeINTEL,
    enable : Bool32,
    parameter : u64,
};

PerformanceConfigurationAcquireInfoINTEL :: struct {
    sType : StructureType,
    pNext : rawptr,
    type : PerformanceConfigurationTypeINTEL,
};

PhysicalDevicePCIBusInfoPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    pciDomain : u32,
    pciBus : u32,
    pciDevice : u32,
    pciFunction : u32,
};

DisplayNativeHdrSurfaceCapabilitiesAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    localDimmingSupport : Bool32,
};

SwapchainDisplayNativeHdrCreateInfoAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    localDimmingEnable : Bool32,
};

PhysicalDeviceFragmentDensityMapFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    fragmentDensityMap : Bool32,
    fragmentDensityMapDynamic : Bool32,
    fragmentDensityMapNonSubsampledImages : Bool32,
};

PhysicalDeviceFragmentDensityMapPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    minFragmentDensityTexelSize : Extent2D,
    maxFragmentDensityTexelSize : Extent2D,
    fragmentDensityInvocations : Bool32,
};

RenderPassFragmentDensityMapCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    fragmentDensityMapAttachment : AttachmentReference,
};

PhysicalDeviceSubgroupSizeControlFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    subgroupSizeControl : Bool32,
    computeFullSubgroups : Bool32,
};

PhysicalDeviceSubgroupSizeControlPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    minSubgroupSize : u32,
    maxSubgroupSize : u32,
    maxComputeWorkgroupSubgroups : u32,
    requiredSubgroupSizeStages : ShaderStageFlags,
};

PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    requiredSubgroupSize : u32,
};

PhysicalDeviceShaderCoreProperties2AMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderCoreFeatures : ShaderCorePropertiesFlagsAMD,
    activeComputeUnitCount : u32,
};

PhysicalDeviceCoherentMemoryFeaturesAMD :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceCoherentMemory : Bool32,
};

PhysicalDeviceMemoryBudgetPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    heapBudget : [16]DeviceSize,
    heapUsage : [16]DeviceSize,
};

PhysicalDeviceMemoryPriorityFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    memoryPriority : Bool32,
};

MemoryPriorityAllocateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    priority : _c.float,
};

PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    dedicatedAllocationImageAliasing : Bool32,
};

PhysicalDeviceBufferDeviceAddressFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    bufferDeviceAddress : Bool32,
    bufferDeviceAddressCaptureReplay : Bool32,
    bufferDeviceAddressMultiDevice : Bool32,
};

BufferDeviceAddressCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceAddress : DeviceAddress,
};

PhysicalDeviceToolPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    name : [256]_c.char,
    version : [256]_c.char,
    purposes : ToolPurposeFlagsEXT,
    description : [256]_c.char,
    layer : [256]_c.char,
};

ValidationFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    enabledValidationFeatureCount : u32,
    pEnabledValidationFeatures : ^ValidationFeatureEnableEXT,
    disabledValidationFeatureCount : u32,
    pDisabledValidationFeatures : ^ValidationFeatureDisableEXT,
};

CooperativeMatrixPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    MSize : u32,
    NSize : u32,
    KSize : u32,
    AType : ComponentTypeNV,
    BType : ComponentTypeNV,
    CType : ComponentTypeNV,
    DType : ComponentTypeNV,
    scope : ScopeNV,
};

PhysicalDeviceCooperativeMatrixFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    cooperativeMatrix : Bool32,
    cooperativeMatrixRobustBufferAccess : Bool32,
};

PhysicalDeviceCooperativeMatrixPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    cooperativeMatrixSupportedStages : ShaderStageFlags,
};

PhysicalDeviceCoverageReductionModeFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    coverageReductionMode : Bool32,
};

PipelineCoverageReductionStateCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PipelineCoverageReductionStateCreateFlagsNV,
    coverageReductionMode : CoverageReductionModeNV,
};

FramebufferMixedSamplesCombinationNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    coverageReductionMode : CoverageReductionModeNV,
    rasterizationSamples : SampleCountFlagBits,
    depthStencilSamples : SampleCountFlags,
    colorSamples : SampleCountFlags,
};

PhysicalDeviceFragmentShaderInterlockFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    fragmentShaderSampleInterlock : Bool32,
    fragmentShaderPixelInterlock : Bool32,
    fragmentShaderShadingRateInterlock : Bool32,
};

PhysicalDeviceYcbcrImageArraysFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    ycbcrImageArrays : Bool32,
};

HeadlessSurfaceCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : HeadlessSurfaceCreateFlagsEXT,
};

PhysicalDeviceLineRasterizationFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    rectangularLines : Bool32,
    bresenhamLines : Bool32,
    smoothLines : Bool32,
    stippledRectangularLines : Bool32,
    stippledBresenhamLines : Bool32,
    stippledSmoothLines : Bool32,
};

PhysicalDeviceLineRasterizationPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    lineSubPixelPrecisionBits : u32,
};

PipelineRasterizationLineStateCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    lineRasterizationMode : LineRasterizationModeEXT,
    stippledLineEnable : Bool32,
    lineStippleFactor : u32,
    lineStipplePattern : u16,
};

PhysicalDeviceIndexTypeUint8FeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    indexTypeUint8 : Bool32,
};

PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    shaderDemoteToHelperInvocation : Bool32,
};

IndirectCommandsLayoutNVT :: struct {};

PhysicalDeviceDeviceGeneratedCommandsPropertiesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxGraphicsShaderGroupCount : u32,
    maxIndirectSequenceCount : u32,
    maxIndirectCommandsTokenCount : u32,
    maxIndirectCommandsStreamCount : u32,
    maxIndirectCommandsTokenOffset : u32,
    maxIndirectCommandsStreamStride : u32,
    minSequencesCountBufferOffsetAlignment : u32,
    minSequencesIndexBufferOffsetAlignment : u32,
    minIndirectCommandsBufferOffsetAlignment : u32,
};

PhysicalDeviceDeviceGeneratedCommandsFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    deviceGeneratedCommands : Bool32,
};

GraphicsShaderGroupCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    stageCount : u32,
    pStages : ^PipelineShaderStageCreateInfo,
    pVertexInputState : ^PipelineVertexInputStateCreateInfo,
    pTessellationState : ^PipelineTessellationStateCreateInfo,
};

GraphicsPipelineShaderGroupsCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    groupCount : u32,
    pGroups : ^GraphicsShaderGroupCreateInfoNV,
    pipelineCount : u32,
    pPipelines : ^Pipeline,
};

BindShaderGroupIndirectCommandNV :: struct {
    groupIndex : u32,
};

BindIndexBufferIndirectCommandNV :: struct {
    bufferAddress : DeviceAddress,
    size : u32,
    indexType : IndexType,
};

BindVertexBufferIndirectCommandNV :: struct {
    bufferAddress : DeviceAddress,
    size : u32,
    stride : u32,
};

SetStateFlagsIndirectCommandNV :: struct {
    data : u32,
};

IndirectCommandsStreamNV :: struct {
    buffer : Buffer,
    offset : DeviceSize,
};

IndirectCommandsLayoutTokenNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    tokenType : IndirectCommandsTokenTypeNV,
    stream : u32,
    offset : u32,
    vertexBindingUnit : u32,
    vertexDynamicStride : Bool32,
    pushconstantPipelineLayout : PipelineLayout,
    pushconstantShaderStageFlags : ShaderStageFlags,
    pushconstantOffset : u32,
    pushconstantSize : u32,
    indirectStateFlags : IndirectStateFlagsNV,
    indexTypeCount : u32,
    pIndexTypes : ^IndexType,
    pIndexTypeValues : ^u32,
};

IndirectCommandsLayoutCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : IndirectCommandsLayoutUsageFlagsNV,
    pipelineBindPoint : PipelineBindPoint,
    tokenCount : u32,
    pTokens : ^IndirectCommandsLayoutTokenNV,
    streamCount : u32,
    pStreamStrides : ^u32,
};

GeneratedCommandsInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    pipelineBindPoint : PipelineBindPoint,
    pipeline : Pipeline,
    indirectCommandsLayout : IndirectCommandsLayoutNV,
    streamCount : u32,
    pStreams : ^IndirectCommandsStreamNV,
    sequencesCount : u32,
    preprocessBuffer : Buffer,
    preprocessOffset : DeviceSize,
    preprocessSize : DeviceSize,
    sequencesCountBuffer : Buffer,
    sequencesCountOffset : DeviceSize,
    sequencesIndexBuffer : Buffer,
    sequencesIndexOffset : DeviceSize,
};

GeneratedCommandsMemoryRequirementsInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    pipelineBindPoint : PipelineBindPoint,
    pipeline : Pipeline,
    indirectCommandsLayout : IndirectCommandsLayoutNV,
    maxSequencesCount : u32,
};

PhysicalDeviceTexelBufferAlignmentFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    texelBufferAlignment : Bool32,
};

PhysicalDeviceTexelBufferAlignmentPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    storageTexelBufferOffsetAlignmentBytes : DeviceSize,
    storageTexelBufferOffsetSingleTexelAlignment : Bool32,
    uniformTexelBufferOffsetAlignmentBytes : DeviceSize,
    uniformTexelBufferOffsetSingleTexelAlignment : Bool32,
};

RenderPassTransformBeginInfoQCOM :: struct {
    sType : StructureType,
    pNext : rawptr,
    transform : SurfaceTransformFlagBitsKHR,
};

CommandBufferInheritanceRenderPassTransformInfoQCOM :: struct {
    sType : StructureType,
    pNext : rawptr,
    transform : SurfaceTransformFlagBitsKHR,
    renderArea : Rect2D,
};

PhysicalDeviceRobustness2FeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    robustBufferAccess2 : Bool32,
    robustImageAccess2 : Bool32,
    nullDescriptor : Bool32,
};

PhysicalDeviceRobustness2PropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    robustStorageBufferAccessSizeAlignment : DeviceSize,
    robustUniformBufferAccessSizeAlignment : DeviceSize,
};

SamplerCustomBorderColorCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    customBorderColor : ClearColorValue,
    format : Format,
};

PhysicalDeviceCustomBorderColorPropertiesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    maxCustomBorderColorSamplers : u32,
};

PhysicalDeviceCustomBorderColorFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    customBorderColors : Bool32,
    customBorderColorWithoutFormat : Bool32,
};

PrivateDataSlotEXTT :: struct {};

PhysicalDevicePrivateDataFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    privateData : Bool32,
};

DevicePrivateDataCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    privateDataSlotRequestCount : u32,
};

PrivateDataSlotCreateInfoEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : PrivateDataSlotCreateFlagsEXT,
};

PhysicalDevicePipelineCreationCacheControlFeaturesEXT :: struct {
    sType : StructureType,
    pNext : rawptr,
    pipelineCreationCacheControl : Bool32,
};

PhysicalDeviceDiagnosticsConfigFeaturesNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    diagnosticsConfig : Bool32,
};

DeviceDiagnosticsConfigCreateInfoNV :: struct {
    sType : StructureType,
    pNext : rawptr,
    flags : DeviceDiagnosticsConfigFlagsNV,
};

ClearColorValue :: struct #raw_union {
    float32 : [4]_c.float,
    int32 : [4]i32,
    uint32 : [4]u32,
};

ClearValue :: struct #raw_union {
    color : ClearColorValue,
    depthStencil : ClearDepthStencilValue,
};

PerformanceCounterResultKHR :: struct #raw_union {
    int32 : i32,
    int64 : i64,
    uint32 : u32,
    uint64 : u64,
    float32 : _c.float,
    float64 : _c.double,
};

PipelineExecutableStatisticValueKHR :: struct #raw_union {
    b32 : Bool32,
    i64 : i64,
    u64 : u64,
    f64 : _c.double,
};

PerformanceValueDataINTEL :: struct #raw_union {
    value32 : u32,
    value64 : u64,
    valueFloat : _c.float,
    valueBool : Bool32,
    valueString : cstring,
};

when os.OS == "windows" do foreign import vulkan "vulkan.lib";
when os.OS == "linux" do foreign import vulkan "system:vulkan";
when os.OS == "darwin" do foreign import vulkan "system:vulkan";

@(default_calling_convention="c")
foreign vulkan {

    @(link_name="vkCreateInstance")
    create_instance :: proc(
        pCreateInfo : ^InstanceCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pInstance : ^Instance
    ) -> Result ---;

    @(link_name="vkDestroyInstance")
    destroy_instance :: proc(
        instance : Instance,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkEnumeratePhysicalDevices")
    enumerate_physical_devices :: proc(
        instance : Instance,
        pPhysicalDeviceCount : ^u32,
        pPhysicalDevices : ^PhysicalDevice
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceFeatures")
    get_physical_device_features :: proc(
        physicalDevice : PhysicalDevice,
        pFeatures : ^PhysicalDeviceFeatures
    ) ---;

    @(link_name="vkGetPhysicalDeviceFormatProperties")
    get_physical_device_format_properties :: proc(
        physicalDevice : PhysicalDevice,
        format : Format,
        pFormatProperties : ^FormatProperties
    ) ---;

    @(link_name="vkGetPhysicalDeviceImageFormatProperties")
    get_physical_device_image_format_properties :: proc(
        physicalDevice : PhysicalDevice,
        format : Format,
        type : ImageType,
        tiling : ImageTiling,
        usage : ImageUsageFlags,
        flags : ImageCreateFlags,
        pImageFormatProperties : ^ImageFormatProperties
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceProperties")
    get_physical_device_properties :: proc(
        physicalDevice : PhysicalDevice,
        pProperties : ^PhysicalDeviceProperties
    ) ---;

    @(link_name="vkGetPhysicalDeviceQueueFamilyProperties")
    get_physical_device_queue_family_properties :: proc(
        physicalDevice : PhysicalDevice,
        pQueueFamilyPropertyCount : ^u32,
        pQueueFamilyProperties : ^QueueFamilyProperties
    ) ---;

    @(link_name="vkGetPhysicalDeviceMemoryProperties")
    get_physical_device_memory_properties :: proc(
        physicalDevice : PhysicalDevice,
        pMemoryProperties : ^PhysicalDeviceMemoryProperties
    ) ---;

    @(link_name="vkGetInstanceProcAddr")
    get_instance_proc_addr :: proc(
        instance : Instance,
        pName : cstring
    ) -> PFN_VoidFunction ---;

    @(link_name="vkGetDeviceProcAddr")
    get_device_proc_addr :: proc(
        device : Device,
        pName : cstring
    ) -> PFN_VoidFunction ---;

    @(link_name="vkCreateDevice")
    create_device :: proc(
        physicalDevice : PhysicalDevice,
        pCreateInfo : ^DeviceCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pDevice : ^Device
    ) -> Result ---;

    @(link_name="vkDestroyDevice")
    destroy_device :: proc(
        device : Device,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkEnumerateInstanceExtensionProperties")
    enumerate_instance_extension_properties :: proc(
        pLayerName : cstring,
        pPropertyCount : ^u32,
        pProperties : ^ExtensionProperties
    ) -> Result ---;

    @(link_name="vkEnumerateDeviceExtensionProperties")
    enumerate_device_extension_properties :: proc(
        physicalDevice : PhysicalDevice,
        pLayerName : cstring,
        pPropertyCount : ^u32,
        pProperties : ^ExtensionProperties
    ) -> Result ---;

    @(link_name="vkEnumerateInstanceLayerProperties")
    enumerate_instance_layer_properties :: proc(
        pPropertyCount : ^u32,
        pProperties : ^LayerProperties
    ) -> Result ---;

    @(link_name="vkEnumerateDeviceLayerProperties")
    enumerate_device_layer_properties :: proc(
        physicalDevice : PhysicalDevice,
        pPropertyCount : ^u32,
        pProperties : ^LayerProperties
    ) -> Result ---;

    @(link_name="vkGetDeviceQueue")
    get_device_queue :: proc(
        device : Device,
        queueFamilyIndex : u32,
        queueIndex : u32,
        pQueue : ^Queue
    ) ---;

    @(link_name="vkQueueSubmit")
    queue_submit :: proc(
        queue : Queue,
        submitCount : u32,
        pSubmits : ^SubmitInfo,
        fence : Fence
    ) -> Result ---;

    @(link_name="vkQueueWaitIdle")
    queue_wait_idle :: proc(queue : Queue) -> Result ---;

    @(link_name="vkDeviceWaitIdle")
    device_wait_idle :: proc(device : Device) -> Result ---;

    @(link_name="vkAllocateMemory")
    allocate_memory :: proc(
        device : Device,
        pAllocateInfo : ^MemoryAllocateInfo,
        pAllocator : ^AllocationCallbacks,
        pMemory : ^DeviceMemory
    ) -> Result ---;

    @(link_name="vkFreeMemory")
    free_memory :: proc(
        device : Device,
        memory : DeviceMemory,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkMapMemory")
    map_memory :: proc(
        device : Device,
        memory : DeviceMemory,
        offset : DeviceSize,
        size : DeviceSize,
        flags : MemoryMapFlags,
        ppData : ^rawptr
    ) -> Result ---;

    @(link_name="vkUnmapMemory")
    unmap_memory :: proc(
        device : Device,
        memory : DeviceMemory
    ) ---;

    @(link_name="vkFlushMappedMemoryRanges")
    flush_mapped_memory_ranges :: proc(
        device : Device,
        memoryRangeCount : u32,
        pMemoryRanges : ^MappedMemoryRange
    ) -> Result ---;

    @(link_name="vkInvalidateMappedMemoryRanges")
    invalidate_mapped_memory_ranges :: proc(
        device : Device,
        memoryRangeCount : u32,
        pMemoryRanges : ^MappedMemoryRange
    ) -> Result ---;

    @(link_name="vkGetDeviceMemoryCommitment")
    get_device_memory_commitment :: proc(
        device : Device,
        memory : DeviceMemory,
        pCommittedMemoryInBytes : ^DeviceSize
    ) ---;

    @(link_name="vkBindBufferMemory")
    bind_buffer_memory :: proc(
        device : Device,
        buffer : Buffer,
        memory : DeviceMemory,
        memoryOffset : DeviceSize
    ) -> Result ---;

    @(link_name="vkBindImageMemory")
    bind_image_memory :: proc(
        device : Device,
        image : Image,
        memory : DeviceMemory,
        memoryOffset : DeviceSize
    ) -> Result ---;

    @(link_name="vkGetBufferMemoryRequirements")
    get_buffer_memory_requirements :: proc(
        device : Device,
        buffer : Buffer,
        pMemoryRequirements : ^MemoryRequirements
    ) ---;

    @(link_name="vkGetImageMemoryRequirements")
    get_image_memory_requirements :: proc(
        device : Device,
        image : Image,
        pMemoryRequirements : ^MemoryRequirements
    ) ---;

    @(link_name="vkGetImageSparseMemoryRequirements")
    get_image_sparse_memory_requirements :: proc(
        device : Device,
        image : Image,
        pSparseMemoryRequirementCount : ^u32,
        pSparseMemoryRequirements : ^SparseImageMemoryRequirements
    ) ---;

    @(link_name="vkGetPhysicalDeviceSparseImageFormatProperties")
    get_physical_device_sparse_image_format_properties :: proc(
        physicalDevice : PhysicalDevice,
        format : Format,
        type : ImageType,
        samples : SampleCountFlagBits,
        usage : ImageUsageFlags,
        tiling : ImageTiling,
        pPropertyCount : ^u32,
        pProperties : ^SparseImageFormatProperties
    ) ---;

    @(link_name="vkQueueBindSparse")
    queue_bind_sparse :: proc(
        queue : Queue,
        bindInfoCount : u32,
        pBindInfo : ^BindSparseInfo,
        fence : Fence
    ) -> Result ---;

    @(link_name="vkCreateFence")
    create_fence :: proc(
        device : Device,
        pCreateInfo : ^FenceCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pFence : ^Fence
    ) -> Result ---;

    @(link_name="vkDestroyFence")
    destroy_fence :: proc(
        device : Device,
        fence : Fence,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkResetFences")
    reset_fences :: proc(
        device : Device,
        fenceCount : u32,
        pFences : ^Fence
    ) -> Result ---;

    @(link_name="vkGetFenceStatus")
    get_fence_status :: proc(
        device : Device,
        fence : Fence
    ) -> Result ---;

    @(link_name="vkWaitForFences")
    wait_for_fences :: proc(
        device : Device,
        fenceCount : u32,
        pFences : ^Fence,
        waitAll : Bool32,
        timeout : u64
    ) -> Result ---;

    @(link_name="vkCreateSemaphore")
    create_semaphore :: proc(
        device : Device,
        pCreateInfo : ^SemaphoreCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pSemaphore : ^Semaphore
    ) -> Result ---;

    @(link_name="vkDestroySemaphore")
    destroy_semaphore :: proc(
        device : Device,
        semaphore : Semaphore,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateEvent")
    create_event :: proc(
        device : Device,
        pCreateInfo : ^EventCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pEvent : ^Event
    ) -> Result ---;

    @(link_name="vkDestroyEvent")
    destroy_event :: proc(
        device : Device,
        event : Event,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetEventStatus")
    get_event_status :: proc(
        device : Device,
        event : Event
    ) -> Result ---;

    @(link_name="vkSetEvent")
    set_event :: proc(
        device : Device,
        event : Event
    ) -> Result ---;

    @(link_name="vkResetEvent")
    reset_event :: proc(
        device : Device,
        event : Event
    ) -> Result ---;

    @(link_name="vkCreateQueryPool")
    create_query_pool :: proc(
        device : Device,
        pCreateInfo : ^QueryPoolCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pQueryPool : ^QueryPool
    ) -> Result ---;

    @(link_name="vkDestroyQueryPool")
    destroy_query_pool :: proc(
        device : Device,
        queryPool : QueryPool,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetQueryPoolResults")
    get_query_pool_results :: proc(
        device : Device,
        queryPool : QueryPool,
        firstQuery : u32,
        queryCount : u32,
        dataSize : _c.size_t,
        pData : rawptr,
        stride : DeviceSize,
        flags : QueryResultFlags
    ) -> Result ---;

    @(link_name="vkCreateBuffer")
    create_buffer :: proc(
        device : Device,
        pCreateInfo : ^BufferCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pBuffer : ^Buffer
    ) -> Result ---;

    @(link_name="vkDestroyBuffer")
    destroy_buffer :: proc(
        device : Device,
        buffer : Buffer,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateBufferView")
    create_buffer_view :: proc(
        device : Device,
        pCreateInfo : ^BufferViewCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pView : ^BufferView
    ) -> Result ---;

    @(link_name="vkDestroyBufferView")
    destroy_buffer_view :: proc(
        device : Device,
        bufferView : BufferView,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateImage")
    create_image :: proc(
        device : Device,
        pCreateInfo : ^ImageCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pImage : ^Image
    ) -> Result ---;

    @(link_name="vkDestroyImage")
    destroy_image :: proc(
        device : Device,
        image : Image,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetImageSubresourceLayout")
    get_image_subresource_layout :: proc(
        device : Device,
        image : Image,
        pSubresource : ^ImageSubresource,
        pLayout : ^SubresourceLayout
    ) ---;

    @(link_name="vkCreateImageView")
    create_image_view :: proc(
        device : Device,
        pCreateInfo : ^ImageViewCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pView : ^ImageView
    ) -> Result ---;

    @(link_name="vkDestroyImageView")
    destroy_image_view :: proc(
        device : Device,
        imageView : ImageView,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateShaderModule")
    create_shader_module :: proc(
        device : Device,
        pCreateInfo : ^ShaderModuleCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pShaderModule : ^ShaderModule
    ) -> Result ---;

    @(link_name="vkDestroyShaderModule")
    destroy_shader_module :: proc(
        device : Device,
        shaderModule : ShaderModule,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreatePipelineCache")
    create_pipeline_cache :: proc(
        device : Device,
        pCreateInfo : ^PipelineCacheCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pPipelineCache : ^PipelineCache
    ) -> Result ---;

    @(link_name="vkDestroyPipelineCache")
    destroy_pipeline_cache :: proc(
        device : Device,
        pipelineCache : PipelineCache,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetPipelineCacheData")
    get_pipeline_cache_data :: proc(
        device : Device,
        pipelineCache : PipelineCache,
        pDataSize : ^_c.size_t,
        pData : rawptr
    ) -> Result ---;

    @(link_name="vkMergePipelineCaches")
    merge_pipeline_caches :: proc(
        device : Device,
        dstCache : PipelineCache,
        srcCacheCount : u32,
        pSrcCaches : ^PipelineCache
    ) -> Result ---;

    @(link_name="vkCreateGraphicsPipelines")
    create_graphics_pipelines :: proc(
        device : Device,
        pipelineCache : PipelineCache,
        createInfoCount : u32,
        pCreateInfos : ^GraphicsPipelineCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pPipelines : ^Pipeline
    ) -> Result ---;

    @(link_name="vkCreateComputePipelines")
    create_compute_pipelines :: proc(
        device : Device,
        pipelineCache : PipelineCache,
        createInfoCount : u32,
        pCreateInfos : ^ComputePipelineCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pPipelines : ^Pipeline
    ) -> Result ---;

    @(link_name="vkDestroyPipeline")
    destroy_pipeline :: proc(
        device : Device,
        pipeline : Pipeline,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreatePipelineLayout")
    create_pipeline_layout :: proc(
        device : Device,
        pCreateInfo : ^PipelineLayoutCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pPipelineLayout : ^PipelineLayout
    ) -> Result ---;

    @(link_name="vkDestroyPipelineLayout")
    destroy_pipeline_layout :: proc(
        device : Device,
        pipelineLayout : PipelineLayout,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateSampler")
    create_sampler :: proc(
        device : Device,
        pCreateInfo : ^SamplerCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pSampler : ^Sampler
    ) -> Result ---;

    @(link_name="vkDestroySampler")
    destroy_sampler :: proc(
        device : Device,
        sampler : Sampler,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateDescriptorSetLayout")
    create_descriptor_set_layout :: proc(
        device : Device,
        pCreateInfo : ^DescriptorSetLayoutCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pSetLayout : ^DescriptorSetLayout
    ) -> Result ---;

    @(link_name="vkDestroyDescriptorSetLayout")
    destroy_descriptor_set_layout :: proc(
        device : Device,
        descriptorSetLayout : DescriptorSetLayout,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateDescriptorPool")
    create_descriptor_pool :: proc(
        device : Device,
        pCreateInfo : ^DescriptorPoolCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pDescriptorPool : ^DescriptorPool
    ) -> Result ---;

    @(link_name="vkDestroyDescriptorPool")
    destroy_descriptor_pool :: proc(
        device : Device,
        descriptorPool : DescriptorPool,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkResetDescriptorPool")
    reset_descriptor_pool :: proc(
        device : Device,
        descriptorPool : DescriptorPool,
        flags : DescriptorPoolResetFlags
    ) -> Result ---;

    @(link_name="vkAllocateDescriptorSets")
    allocate_descriptor_sets :: proc(
        device : Device,
        pAllocateInfo : ^DescriptorSetAllocateInfo,
        pDescriptorSets : ^DescriptorSet
    ) -> Result ---;

    @(link_name="vkFreeDescriptorSets")
    free_descriptor_sets :: proc(
        device : Device,
        descriptorPool : DescriptorPool,
        descriptorSetCount : u32,
        pDescriptorSets : ^DescriptorSet
    ) -> Result ---;

    @(link_name="vkUpdateDescriptorSets")
    update_descriptor_sets :: proc(
        device : Device,
        descriptorWriteCount : u32,
        pDescriptorWrites : ^WriteDescriptorSet,
        descriptorCopyCount : u32,
        pDescriptorCopies : ^CopyDescriptorSet
    ) ---;

    @(link_name="vkCreateFramebuffer")
    create_framebuffer :: proc(
        device : Device,
        pCreateInfo : ^FramebufferCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pFramebuffer : ^Framebuffer
    ) -> Result ---;

    @(link_name="vkDestroyFramebuffer")
    destroy_framebuffer :: proc(
        device : Device,
        framebuffer : Framebuffer,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateRenderPass")
    create_render_pass :: proc(
        device : Device,
        pCreateInfo : ^RenderPassCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pRenderPass : ^RenderPass
    ) -> Result ---;

    @(link_name="vkDestroyRenderPass")
    destroy_render_pass :: proc(
        device : Device,
        renderPass : RenderPass,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetRenderAreaGranularity")
    get_render_area_granularity :: proc(
        device : Device,
        renderPass : RenderPass,
        pGranularity : ^Extent2D
    ) ---;

    @(link_name="vkCreateCommandPool")
    create_command_pool :: proc(
        device : Device,
        pCreateInfo : ^CommandPoolCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pCommandPool : ^CommandPool
    ) -> Result ---;

    @(link_name="vkDestroyCommandPool")
    destroy_command_pool :: proc(
        device : Device,
        commandPool : CommandPool,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkResetCommandPool")
    reset_command_pool :: proc(
        device : Device,
        commandPool : CommandPool,
        flags : CommandPoolResetFlags
    ) -> Result ---;

    @(link_name="vkAllocateCommandBuffers")
    allocate_command_buffers :: proc(
        device : Device,
        pAllocateInfo : ^CommandBufferAllocateInfo,
        pCommandBuffers : ^CommandBuffer
    ) -> Result ---;

    @(link_name="vkFreeCommandBuffers")
    free_command_buffers :: proc(
        device : Device,
        commandPool : CommandPool,
        commandBufferCount : u32,
        pCommandBuffers : ^CommandBuffer
    ) ---;

    @(link_name="vkBeginCommandBuffer")
    begin_command_buffer :: proc(
        commandBuffer : CommandBuffer,
        pBeginInfo : ^CommandBufferBeginInfo
    ) -> Result ---;

    @(link_name="vkEndCommandBuffer")
    end_command_buffer :: proc(commandBuffer : CommandBuffer) -> Result ---;

    @(link_name="vkResetCommandBuffer")
    reset_command_buffer :: proc(
        commandBuffer : CommandBuffer,
        flags : CommandBufferResetFlags
    ) -> Result ---;

    @(link_name="vkCmdBindPipeline")
    cmd_bind_pipeline :: proc(
        commandBuffer : CommandBuffer,
        pipelineBindPoint : PipelineBindPoint,
        pipeline : Pipeline
    ) ---;

    @(link_name="vkCmdSetViewport")
    cmd_set_viewport :: proc(
        commandBuffer : CommandBuffer,
        firstViewport : u32,
        viewportCount : u32,
        pViewports : ^Viewport
    ) ---;

    @(link_name="vkCmdSetScissor")
    cmd_set_scissor :: proc(
        commandBuffer : CommandBuffer,
        firstScissor : u32,
        scissorCount : u32,
        pScissors : ^Rect2D
    ) ---;

    @(link_name="vkCmdSetLineWidth")
    cmd_set_line_width :: proc(
        commandBuffer : CommandBuffer,
        lineWidth : _c.float
    ) ---;

    @(link_name="vkCmdSetDepthBias")
    cmd_set_depth_bias :: proc(
        commandBuffer : CommandBuffer,
        depthBiasConstantFactor : _c.float,
        depthBiasClamp : _c.float,
        depthBiasSlopeFactor : _c.float
    ) ---;

    @(link_name="vkCmdSetBlendConstants")
    cmd_set_blend_constants :: proc(
        commandBuffer : CommandBuffer,
        blendConstants : [4]_c.float
    ) ---;

    @(link_name="vkCmdSetDepthBounds")
    cmd_set_depth_bounds :: proc(
        commandBuffer : CommandBuffer,
        minDepthBounds : _c.float,
        maxDepthBounds : _c.float
    ) ---;

    @(link_name="vkCmdSetStencilCompareMask")
    cmd_set_stencil_compare_mask :: proc(
        commandBuffer : CommandBuffer,
        faceMask : StencilFaceFlags,
        compareMask : u32
    ) ---;

    @(link_name="vkCmdSetStencilWriteMask")
    cmd_set_stencil_write_mask :: proc(
        commandBuffer : CommandBuffer,
        faceMask : StencilFaceFlags,
        writeMask : u32
    ) ---;

    @(link_name="vkCmdSetStencilReference")
    cmd_set_stencil_reference :: proc(
        commandBuffer : CommandBuffer,
        faceMask : StencilFaceFlags,
        reference : u32
    ) ---;

    @(link_name="vkCmdBindDescriptorSets")
    cmd_bind_descriptor_sets :: proc(
        commandBuffer : CommandBuffer,
        pipelineBindPoint : PipelineBindPoint,
        layout : PipelineLayout,
        firstSet : u32,
        descriptorSetCount : u32,
        pDescriptorSets : ^DescriptorSet,
        dynamicOffsetCount : u32,
        pDynamicOffsets : ^u32
    ) ---;

    @(link_name="vkCmdBindIndexBuffer")
    cmd_bind_index_buffer :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        indexType : IndexType
    ) ---;

    @(link_name="vkCmdBindVertexBuffers")
    cmd_bind_vertex_buffers :: proc(
        commandBuffer : CommandBuffer,
        firstBinding : u32,
        bindingCount : u32,
        pBuffers : ^Buffer,
        pOffsets : ^DeviceSize
    ) ---;

    @(link_name="vkCmdDraw")
    cmd_draw :: proc(
        commandBuffer : CommandBuffer,
        vertexCount : u32,
        instanceCount : u32,
        firstVertex : u32,
        firstInstance : u32
    ) ---;

    @(link_name="vkCmdDrawIndexed")
    cmd_draw_indexed :: proc(
        commandBuffer : CommandBuffer,
        indexCount : u32,
        instanceCount : u32,
        firstIndex : u32,
        vertexOffset : i32,
        firstInstance : u32
    ) ---;

    @(link_name="vkCmdDrawIndirect")
    cmd_draw_indirect :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        drawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdDrawIndexedIndirect")
    cmd_draw_indexed_indirect :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        drawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdDispatch")
    cmd_dispatch :: proc(
        commandBuffer : CommandBuffer,
        groupCountX : u32,
        groupCountY : u32,
        groupCountZ : u32
    ) ---;

    @(link_name="vkCmdDispatchIndirect")
    cmd_dispatch_indirect :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize
    ) ---;

    @(link_name="vkCmdCopyBuffer")
    cmd_copy_buffer :: proc(
        commandBuffer : CommandBuffer,
        srcBuffer : Buffer,
        dstBuffer : Buffer,
        regionCount : u32,
        pRegions : ^BufferCopy
    ) ---;

    @(link_name="vkCmdCopyImage")
    cmd_copy_image :: proc(
        commandBuffer : CommandBuffer,
        srcImage : Image,
        srcImageLayout : ImageLayout,
        dstImage : Image,
        dstImageLayout : ImageLayout,
        regionCount : u32,
        pRegions : ^ImageCopy
    ) ---;

    @(link_name="vkCmdBlitImage")
    cmd_blit_image :: proc(
        commandBuffer : CommandBuffer,
        srcImage : Image,
        srcImageLayout : ImageLayout,
        dstImage : Image,
        dstImageLayout : ImageLayout,
        regionCount : u32,
        pRegions : ^ImageBlit,
        filter : Filter
    ) ---;

    @(link_name="vkCmdCopyBufferToImage")
    cmd_copy_buffer_to_image :: proc(
        commandBuffer : CommandBuffer,
        srcBuffer : Buffer,
        dstImage : Image,
        dstImageLayout : ImageLayout,
        regionCount : u32,
        pRegions : ^BufferImageCopy
    ) ---;

    @(link_name="vkCmdCopyImageToBuffer")
    cmd_copy_image_to_buffer :: proc(
        commandBuffer : CommandBuffer,
        srcImage : Image,
        srcImageLayout : ImageLayout,
        dstBuffer : Buffer,
        regionCount : u32,
        pRegions : ^BufferImageCopy
    ) ---;

    @(link_name="vkCmdUpdateBuffer")
    cmd_update_buffer :: proc(
        commandBuffer : CommandBuffer,
        dstBuffer : Buffer,
        dstOffset : DeviceSize,
        dataSize : DeviceSize,
        pData : rawptr
    ) ---;

    @(link_name="vkCmdFillBuffer")
    cmd_fill_buffer :: proc(
        commandBuffer : CommandBuffer,
        dstBuffer : Buffer,
        dstOffset : DeviceSize,
        size : DeviceSize,
        data : u32
    ) ---;

    @(link_name="vkCmdClearColorImage")
    cmd_clear_color_image :: proc(
        commandBuffer : CommandBuffer,
        image : Image,
        imageLayout : ImageLayout,
        pColor : ^ClearColorValue,
        rangeCount : u32,
        pRanges : ^ImageSubresourceRange
    ) ---;

    @(link_name="vkCmdClearDepthStencilImage")
    cmd_clear_depth_stencil_image :: proc(
        commandBuffer : CommandBuffer,
        image : Image,
        imageLayout : ImageLayout,
        pDepthStencil : ^ClearDepthStencilValue,
        rangeCount : u32,
        pRanges : ^ImageSubresourceRange
    ) ---;

    @(link_name="vkCmdClearAttachments")
    cmd_clear_attachments :: proc(
        commandBuffer : CommandBuffer,
        attachmentCount : u32,
        pAttachments : ^ClearAttachment,
        rectCount : u32,
        pRects : ^ClearRect
    ) ---;

    @(link_name="vkCmdResolveImage")
    cmd_resolve_image :: proc(
        commandBuffer : CommandBuffer,
        srcImage : Image,
        srcImageLayout : ImageLayout,
        dstImage : Image,
        dstImageLayout : ImageLayout,
        regionCount : u32,
        pRegions : ^ImageResolve
    ) ---;

    @(link_name="vkCmdSetEvent")
    cmd_set_event :: proc(
        commandBuffer : CommandBuffer,
        event : Event,
        stageMask : PipelineStageFlags
    ) ---;

    @(link_name="vkCmdResetEvent")
    cmd_reset_event :: proc(
        commandBuffer : CommandBuffer,
        event : Event,
        stageMask : PipelineStageFlags
    ) ---;

    @(link_name="vkCmdWaitEvents")
    cmd_wait_events :: proc(
        commandBuffer : CommandBuffer,
        eventCount : u32,
        pEvents : ^Event,
        srcStageMask : PipelineStageFlags,
        dstStageMask : PipelineStageFlags,
        memoryBarrierCount : u32,
        pMemoryBarriers : ^MemoryBarrier,
        bufferMemoryBarrierCount : u32,
        pBufferMemoryBarriers : ^BufferMemoryBarrier,
        imageMemoryBarrierCount : u32,
        pImageMemoryBarriers : ^ImageMemoryBarrier
    ) ---;

    @(link_name="vkCmdPipelineBarrier")
    cmd_pipeline_barrier :: proc(
        commandBuffer : CommandBuffer,
        srcStageMask : PipelineStageFlags,
        dstStageMask : PipelineStageFlags,
        dependencyFlags : DependencyFlags,
        memoryBarrierCount : u32,
        pMemoryBarriers : ^MemoryBarrier,
        bufferMemoryBarrierCount : u32,
        pBufferMemoryBarriers : ^BufferMemoryBarrier,
        imageMemoryBarrierCount : u32,
        pImageMemoryBarriers : ^ImageMemoryBarrier
    ) ---;

    @(link_name="vkCmdBeginQuery")
    cmd_begin_query :: proc(
        commandBuffer : CommandBuffer,
        queryPool : QueryPool,
        query : u32,
        flags : QueryControlFlags
    ) ---;

    @(link_name="vkCmdEndQuery")
    cmd_end_query :: proc(
        commandBuffer : CommandBuffer,
        queryPool : QueryPool,
        query : u32
    ) ---;

    @(link_name="vkCmdResetQueryPool")
    cmd_reset_query_pool :: proc(
        commandBuffer : CommandBuffer,
        queryPool : QueryPool,
        firstQuery : u32,
        queryCount : u32
    ) ---;

    @(link_name="vkCmdWriteTimestamp")
    cmd_write_timestamp :: proc(
        commandBuffer : CommandBuffer,
        pipelineStage : PipelineStageFlagBits,
        queryPool : QueryPool,
        query : u32
    ) ---;

    @(link_name="vkCmdCopyQueryPoolResults")
    cmd_copy_query_pool_results :: proc(
        commandBuffer : CommandBuffer,
        queryPool : QueryPool,
        firstQuery : u32,
        queryCount : u32,
        dstBuffer : Buffer,
        dstOffset : DeviceSize,
        stride : DeviceSize,
        flags : QueryResultFlags
    ) ---;

    @(link_name="vkCmdPushConstants")
    cmd_push_constants :: proc(
        commandBuffer : CommandBuffer,
        layout : PipelineLayout,
        stageFlags : ShaderStageFlags,
        offset : u32,
        size : u32,
        pValues : rawptr
    ) ---;

    @(link_name="vkCmdBeginRenderPass")
    cmd_begin_render_pass :: proc(
        commandBuffer : CommandBuffer,
        pRenderPassBegin : ^RenderPassBeginInfo,
        contents : SubpassContents
    ) ---;

    @(link_name="vkCmdNextSubpass")
    cmd_next_subpass :: proc(
        commandBuffer : CommandBuffer,
        contents : SubpassContents
    ) ---;

    @(link_name="vkCmdEndRenderPass")
    cmd_end_render_pass :: proc(commandBuffer : CommandBuffer) ---;

    @(link_name="vkCmdExecuteCommands")
    cmd_execute_commands :: proc(
        commandBuffer : CommandBuffer,
        commandBufferCount : u32,
        pCommandBuffers : ^CommandBuffer
    ) ---;

    @(link_name="vkEnumerateInstanceVersion")
    enumerate_instance_version :: proc(pApiVersion : ^u32) -> Result ---;

    @(link_name="vkBindBufferMemory2")
    bind_buffer_memory2 :: proc(
        device : Device,
        bindInfoCount : u32,
        pBindInfos : ^BindBufferMemoryInfo
    ) -> Result ---;

    @(link_name="vkBindImageMemory2")
    bind_image_memory2 :: proc(
        device : Device,
        bindInfoCount : u32,
        pBindInfos : ^BindImageMemoryInfo
    ) -> Result ---;

    @(link_name="vkGetDeviceGroupPeerMemoryFeatures")
    get_device_group_peer_memory_features :: proc(
        device : Device,
        heapIndex : u32,
        localDeviceIndex : u32,
        remoteDeviceIndex : u32,
        pPeerMemoryFeatures : ^PeerMemoryFeatureFlags
    ) ---;

    @(link_name="vkCmdSetDeviceMask")
    cmd_set_device_mask :: proc(
        commandBuffer : CommandBuffer,
        deviceMask : u32
    ) ---;

    @(link_name="vkCmdDispatchBase")
    cmd_dispatch_base :: proc(
        commandBuffer : CommandBuffer,
        baseGroupX : u32,
        baseGroupY : u32,
        baseGroupZ : u32,
        groupCountX : u32,
        groupCountY : u32,
        groupCountZ : u32
    ) ---;

    @(link_name="vkEnumeratePhysicalDeviceGroups")
    enumerate_physical_device_groups :: proc(
        instance : Instance,
        pPhysicalDeviceGroupCount : ^u32,
        pPhysicalDeviceGroupProperties : ^PhysicalDeviceGroupProperties
    ) -> Result ---;

    @(link_name="vkGetImageMemoryRequirements2")
    get_image_memory_requirements2 :: proc(
        device : Device,
        pInfo : ^ImageMemoryRequirementsInfo2,
        pMemoryRequirements : ^MemoryRequirements2
    ) ---;

    @(link_name="vkGetBufferMemoryRequirements2")
    get_buffer_memory_requirements2 :: proc(
        device : Device,
        pInfo : ^BufferMemoryRequirementsInfo2,
        pMemoryRequirements : ^MemoryRequirements2
    ) ---;

    @(link_name="vkGetImageSparseMemoryRequirements2")
    get_image_sparse_memory_requirements2 :: proc(
        device : Device,
        pInfo : ^ImageSparseMemoryRequirementsInfo2,
        pSparseMemoryRequirementCount : ^u32,
        pSparseMemoryRequirements : ^SparseImageMemoryRequirements2
    ) ---;

    @(link_name="vkGetPhysicalDeviceFeatures2")
    get_physical_device_features2 :: proc(
        physicalDevice : PhysicalDevice,
        pFeatures : ^PhysicalDeviceFeatures2
    ) ---;

    @(link_name="vkGetPhysicalDeviceProperties2")
    get_physical_device_properties2 :: proc(
        physicalDevice : PhysicalDevice,
        pProperties : ^PhysicalDeviceProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceFormatProperties2")
    get_physical_device_format_properties2 :: proc(
        physicalDevice : PhysicalDevice,
        format : Format,
        pFormatProperties : ^FormatProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceImageFormatProperties2")
    get_physical_device_image_format_properties2 :: proc(
        physicalDevice : PhysicalDevice,
        pImageFormatInfo : ^PhysicalDeviceImageFormatInfo2,
        pImageFormatProperties : ^ImageFormatProperties2
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceQueueFamilyProperties2")
    get_physical_device_queue_family_properties2 :: proc(
        physicalDevice : PhysicalDevice,
        pQueueFamilyPropertyCount : ^u32,
        pQueueFamilyProperties : ^QueueFamilyProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceMemoryProperties2")
    get_physical_device_memory_properties2 :: proc(
        physicalDevice : PhysicalDevice,
        pMemoryProperties : ^PhysicalDeviceMemoryProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceSparseImageFormatProperties2")
    get_physical_device_sparse_image_format_properties2 :: proc(
        physicalDevice : PhysicalDevice,
        pFormatInfo : ^PhysicalDeviceSparseImageFormatInfo2,
        pPropertyCount : ^u32,
        pProperties : ^SparseImageFormatProperties2
    ) ---;

    @(link_name="vkTrimCommandPool")
    trim_command_pool :: proc(
        device : Device,
        commandPool : CommandPool,
        flags : CommandPoolTrimFlags
    ) ---;

    @(link_name="vkGetDeviceQueue2")
    get_device_queue2 :: proc(
        device : Device,
        pQueueInfo : ^DeviceQueueInfo2,
        pQueue : ^Queue
    ) ---;

    @(link_name="vkCreateSamplerYcbcrConversion")
    create_sampler_ycbcr_conversion :: proc(
        device : Device,
        pCreateInfo : ^SamplerYcbcrConversionCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pYcbcrConversion : ^SamplerYcbcrConversion
    ) -> Result ---;

    @(link_name="vkDestroySamplerYcbcrConversion")
    destroy_sampler_ycbcr_conversion :: proc(
        device : Device,
        ycbcrConversion : SamplerYcbcrConversion,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreateDescriptorUpdateTemplate")
    create_descriptor_update_template :: proc(
        device : Device,
        pCreateInfo : ^DescriptorUpdateTemplateCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pDescriptorUpdateTemplate : ^DescriptorUpdateTemplate
    ) -> Result ---;

    @(link_name="vkDestroyDescriptorUpdateTemplate")
    destroy_descriptor_update_template :: proc(
        device : Device,
        descriptorUpdateTemplate : DescriptorUpdateTemplate,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkUpdateDescriptorSetWithTemplate")
    update_descriptor_set_with_template :: proc(
        device : Device,
        descriptorSet : DescriptorSet,
        descriptorUpdateTemplate : DescriptorUpdateTemplate,
        pData : rawptr
    ) ---;

    @(link_name="vkGetPhysicalDeviceExternalBufferProperties")
    get_physical_device_external_buffer_properties :: proc(
        physicalDevice : PhysicalDevice,
        pExternalBufferInfo : ^PhysicalDeviceExternalBufferInfo,
        pExternalBufferProperties : ^ExternalBufferProperties
    ) ---;

    @(link_name="vkGetPhysicalDeviceExternalFenceProperties")
    get_physical_device_external_fence_properties :: proc(
        physicalDevice : PhysicalDevice,
        pExternalFenceInfo : ^PhysicalDeviceExternalFenceInfo,
        pExternalFenceProperties : ^ExternalFenceProperties
    ) ---;

    @(link_name="vkGetPhysicalDeviceExternalSemaphoreProperties")
    get_physical_device_external_semaphore_properties :: proc(
        physicalDevice : PhysicalDevice,
        pExternalSemaphoreInfo : ^PhysicalDeviceExternalSemaphoreInfo,
        pExternalSemaphoreProperties : ^ExternalSemaphoreProperties
    ) ---;

    @(link_name="vkGetDescriptorSetLayoutSupport")
    get_descriptor_set_layout_support :: proc(
        device : Device,
        pCreateInfo : ^DescriptorSetLayoutCreateInfo,
        pSupport : ^DescriptorSetLayoutSupport
    ) ---;

    @(link_name="vkCmdDrawIndirectCount")
    cmd_draw_indirect_count :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdDrawIndexedIndirectCount")
    cmd_draw_indexed_indirect_count :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCreateRenderPass2")
    create_render_pass2 :: proc(
        device : Device,
        pCreateInfo : ^RenderPassCreateInfo2,
        pAllocator : ^AllocationCallbacks,
        pRenderPass : ^RenderPass
    ) -> Result ---;

    @(link_name="vkCmdBeginRenderPass2")
    cmd_begin_render_pass2 :: proc(
        commandBuffer : CommandBuffer,
        pRenderPassBegin : ^RenderPassBeginInfo,
        pSubpassBeginInfo : ^SubpassBeginInfo
    ) ---;

    @(link_name="vkCmdNextSubpass2")
    cmd_next_subpass2 :: proc(
        commandBuffer : CommandBuffer,
        pSubpassBeginInfo : ^SubpassBeginInfo,
        pSubpassEndInfo : ^SubpassEndInfo
    ) ---;

    @(link_name="vkCmdEndRenderPass2")
    cmd_end_render_pass2 :: proc(
        commandBuffer : CommandBuffer,
        pSubpassEndInfo : ^SubpassEndInfo
    ) ---;

    @(link_name="vkResetQueryPool")
    reset_query_pool :: proc(
        device : Device,
        queryPool : QueryPool,
        firstQuery : u32,
        queryCount : u32
    ) ---;

    @(link_name="vkGetSemaphoreCounterValue")
    get_semaphore_counter_value :: proc(
        device : Device,
        semaphore : Semaphore,
        pValue : ^u64
    ) -> Result ---;

    @(link_name="vkWaitSemaphores")
    wait_semaphores :: proc(
        device : Device,
        pWaitInfo : ^SemaphoreWaitInfo,
        timeout : u64
    ) -> Result ---;

    @(link_name="vkSignalSemaphore")
    signal_semaphore :: proc(
        device : Device,
        pSignalInfo : ^SemaphoreSignalInfo
    ) -> Result ---;

    @(link_name="vkGetBufferDeviceAddress")
    get_buffer_device_address :: proc(
        device : Device,
        pInfo : ^BufferDeviceAddressInfo
    ) -> DeviceAddress ---;

    @(link_name="vkGetBufferOpaqueCaptureAddress")
    get_buffer_opaque_capture_address :: proc(
        device : Device,
        pInfo : ^BufferDeviceAddressInfo
    ) -> u64 ---;

    @(link_name="vkGetDeviceMemoryOpaqueCaptureAddress")
    get_device_memory_opaque_capture_address :: proc(
        device : Device,
        pInfo : ^DeviceMemoryOpaqueCaptureAddressInfo
    ) -> u64 ---;

    @(link_name="vkDestroySurfaceKHR")
    destroy_surface_khr :: proc(
        instance : Instance,
        surface : SurfaceKHR,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetPhysicalDeviceSurfaceSupportKHR")
    get_physical_device_surface_support_khr :: proc(
        physicalDevice : PhysicalDevice,
        queueFamilyIndex : u32,
        surface : SurfaceKHR,
        pSupported : ^Bool32
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceSurfaceCapabilitiesKHR")
    get_physical_device_surface_capabilities_khr :: proc(
        physicalDevice : PhysicalDevice,
        surface : SurfaceKHR,
        pSurfaceCapabilities : ^SurfaceCapabilitiesKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceSurfaceFormatsKHR")
    get_physical_device_surface_formats_khr :: proc(
        physicalDevice : PhysicalDevice,
        surface : SurfaceKHR,
        pSurfaceFormatCount : ^u32,
        pSurfaceFormats : ^SurfaceFormatKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceSurfacePresentModesKHR")
    get_physical_device_surface_present_modes_khr :: proc(
        physicalDevice : PhysicalDevice,
        surface : SurfaceKHR,
        pPresentModeCount : ^u32,
        pPresentModes : ^PresentModeKHR
    ) -> Result ---;

    @(link_name="vkCreateSwapchainKHR")
    create_swapchain_khr :: proc(
        device : Device,
        pCreateInfo : ^SwapchainCreateInfoKHR,
        pAllocator : ^AllocationCallbacks,
        pSwapchain : ^SwapchainKHR
    ) -> Result ---;

    @(link_name="vkDestroySwapchainKHR")
    destroy_swapchain_khr :: proc(
        device : Device,
        swapchain : SwapchainKHR,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetSwapchainImagesKHR")
    get_swapchain_images_khr :: proc(
        device : Device,
        swapchain : SwapchainKHR,
        pSwapchainImageCount : ^u32,
        pSwapchainImages : ^Image
    ) -> Result ---;

    @(link_name="vkAcquireNextImageKHR")
    acquire_next_image_khr :: proc(
        device : Device,
        swapchain : SwapchainKHR,
        timeout : u64,
        semaphore : Semaphore,
        fence : Fence,
        pImageIndex : ^u32
    ) -> Result ---;

    @(link_name="vkQueuePresentKHR")
    queue_present_khr :: proc(
        queue : Queue,
        pPresentInfo : ^PresentInfoKHR
    ) -> Result ---;

    @(link_name="vkGetDeviceGroupPresentCapabilitiesKHR")
    get_device_group_present_capabilities_khr :: proc(
        device : Device,
        pDeviceGroupPresentCapabilities : ^DeviceGroupPresentCapabilitiesKHR
    ) -> Result ---;

    @(link_name="vkGetDeviceGroupSurfacePresentModesKHR")
    get_device_group_surface_present_modes_khr :: proc(
        device : Device,
        surface : SurfaceKHR,
        pModes : ^DeviceGroupPresentModeFlagsKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDevicePresentRectanglesKHR")
    get_physical_device_present_rectangles_khr :: proc(
        physicalDevice : PhysicalDevice,
        surface : SurfaceKHR,
        pRectCount : ^u32,
        pRects : ^Rect2D
    ) -> Result ---;

    @(link_name="vkAcquireNextImage2KHR")
    acquire_next_image2_khr :: proc(
        device : Device,
        pAcquireInfo : ^AcquireNextImageInfoKHR,
        pImageIndex : ^u32
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceDisplayPropertiesKHR")
    get_physical_device_display_properties_khr :: proc(
        physicalDevice : PhysicalDevice,
        pPropertyCount : ^u32,
        pProperties : ^DisplayPropertiesKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceDisplayPlanePropertiesKHR")
    get_physical_device_display_plane_properties_khr :: proc(
        physicalDevice : PhysicalDevice,
        pPropertyCount : ^u32,
        pProperties : ^DisplayPlanePropertiesKHR
    ) -> Result ---;

    @(link_name="vkGetDisplayPlaneSupportedDisplaysKHR")
    get_display_plane_supported_displays_khr :: proc(
        physicalDevice : PhysicalDevice,
        planeIndex : u32,
        pDisplayCount : ^u32,
        pDisplays : ^DisplayKHR
    ) -> Result ---;

    @(link_name="vkGetDisplayModePropertiesKHR")
    get_display_mode_properties_khr :: proc(
        physicalDevice : PhysicalDevice,
        display : DisplayKHR,
        pPropertyCount : ^u32,
        pProperties : ^DisplayModePropertiesKHR
    ) -> Result ---;

    @(link_name="vkCreateDisplayModeKHR")
    create_display_mode_khr :: proc(
        physicalDevice : PhysicalDevice,
        display : DisplayKHR,
        pCreateInfo : ^DisplayModeCreateInfoKHR,
        pAllocator : ^AllocationCallbacks,
        pMode : ^DisplayModeKHR
    ) -> Result ---;

    @(link_name="vkGetDisplayPlaneCapabilitiesKHR")
    get_display_plane_capabilities_khr :: proc(
        physicalDevice : PhysicalDevice,
        mode : DisplayModeKHR,
        planeIndex : u32,
        pCapabilities : ^DisplayPlaneCapabilitiesKHR
    ) -> Result ---;

    @(link_name="vkCreateDisplayPlaneSurfaceKHR")
    create_display_plane_surface_khr :: proc(
        instance : Instance,
        pCreateInfo : ^DisplaySurfaceCreateInfoKHR,
        pAllocator : ^AllocationCallbacks,
        pSurface : ^SurfaceKHR
    ) -> Result ---;

    @(link_name="vkCreateSharedSwapchainsKHR")
    create_shared_swapchains_khr :: proc(
        device : Device,
        swapchainCount : u32,
        pCreateInfos : ^SwapchainCreateInfoKHR,
        pAllocator : ^AllocationCallbacks,
        pSwapchains : ^SwapchainKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceFeatures2KHR")
    get_physical_device_features2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pFeatures : ^PhysicalDeviceFeatures2
    ) ---;

    @(link_name="vkGetPhysicalDeviceProperties2KHR")
    get_physical_device_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pProperties : ^PhysicalDeviceProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceFormatProperties2KHR")
    get_physical_device_format_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        format : Format,
        pFormatProperties : ^FormatProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceImageFormatProperties2KHR")
    get_physical_device_image_format_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pImageFormatInfo : ^PhysicalDeviceImageFormatInfo2,
        pImageFormatProperties : ^ImageFormatProperties2
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceQueueFamilyProperties2KHR")
    get_physical_device_queue_family_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pQueueFamilyPropertyCount : ^u32,
        pQueueFamilyProperties : ^QueueFamilyProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceMemoryProperties2KHR")
    get_physical_device_memory_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pMemoryProperties : ^PhysicalDeviceMemoryProperties2
    ) ---;

    @(link_name="vkGetPhysicalDeviceSparseImageFormatProperties2KHR")
    get_physical_device_sparse_image_format_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pFormatInfo : ^PhysicalDeviceSparseImageFormatInfo2,
        pPropertyCount : ^u32,
        pProperties : ^SparseImageFormatProperties2
    ) ---;

    @(link_name="vkGetDeviceGroupPeerMemoryFeaturesKHR")
    get_device_group_peer_memory_features_khr :: proc(
        device : Device,
        heapIndex : u32,
        localDeviceIndex : u32,
        remoteDeviceIndex : u32,
        pPeerMemoryFeatures : ^PeerMemoryFeatureFlags
    ) ---;

    @(link_name="vkCmdSetDeviceMaskKHR")
    cmd_set_device_mask_khr :: proc(
        commandBuffer : CommandBuffer,
        deviceMask : u32
    ) ---;

    @(link_name="vkCmdDispatchBaseKHR")
    cmd_dispatch_base_khr :: proc(
        commandBuffer : CommandBuffer,
        baseGroupX : u32,
        baseGroupY : u32,
        baseGroupZ : u32,
        groupCountX : u32,
        groupCountY : u32,
        groupCountZ : u32
    ) ---;

    @(link_name="vkTrimCommandPoolKHR")
    trim_command_pool_khr :: proc(
        device : Device,
        commandPool : CommandPool,
        flags : CommandPoolTrimFlags
    ) ---;

    @(link_name="vkEnumeratePhysicalDeviceGroupsKHR")
    enumerate_physical_device_groups_khr :: proc(
        instance : Instance,
        pPhysicalDeviceGroupCount : ^u32,
        pPhysicalDeviceGroupProperties : ^PhysicalDeviceGroupProperties
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceExternalBufferPropertiesKHR")
    get_physical_device_external_buffer_properties_khr :: proc(
        physicalDevice : PhysicalDevice,
        pExternalBufferInfo : ^PhysicalDeviceExternalBufferInfo,
        pExternalBufferProperties : ^ExternalBufferProperties
    ) ---;

    @(link_name="vkGetMemoryFdKHR")
    get_memory_fd_khr :: proc(
        device : Device,
        pGetFdInfo : ^MemoryGetFdInfoKHR,
        pFd : ^_c.int
    ) -> Result ---;

    @(link_name="vkGetMemoryFdPropertiesKHR")
    get_memory_fd_properties_khr :: proc(
        device : Device,
        handleType : ExternalMemoryHandleTypeFlagBits,
        fd : _c.int,
        pMemoryFdProperties : ^MemoryFdPropertiesKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceExternalSemaphorePropertiesKHR")
    get_physical_device_external_semaphore_properties_khr :: proc(
        physicalDevice : PhysicalDevice,
        pExternalSemaphoreInfo : ^PhysicalDeviceExternalSemaphoreInfo,
        pExternalSemaphoreProperties : ^ExternalSemaphoreProperties
    ) ---;

    @(link_name="vkImportSemaphoreFdKHR")
    import_semaphore_fd_khr :: proc(
        device : Device,
        pImportSemaphoreFdInfo : ^ImportSemaphoreFdInfoKHR
    ) -> Result ---;

    @(link_name="vkGetSemaphoreFdKHR")
    get_semaphore_fd_khr :: proc(
        device : Device,
        pGetFdInfo : ^SemaphoreGetFdInfoKHR,
        pFd : ^_c.int
    ) -> Result ---;

    @(link_name="vkCmdPushDescriptorSetKHR")
    cmd_push_descriptor_set_khr :: proc(
        commandBuffer : CommandBuffer,
        pipelineBindPoint : PipelineBindPoint,
        layout : PipelineLayout,
        set : u32,
        descriptorWriteCount : u32,
        pDescriptorWrites : ^WriteDescriptorSet
    ) ---;

    @(link_name="vkCmdPushDescriptorSetWithTemplateKHR")
    cmd_push_descriptor_set_with_template_khr :: proc(
        commandBuffer : CommandBuffer,
        descriptorUpdateTemplate : DescriptorUpdateTemplate,
        layout : PipelineLayout,
        set : u32,
        pData : rawptr
    ) ---;

    @(link_name="vkCreateDescriptorUpdateTemplateKHR")
    create_descriptor_update_template_khr :: proc(
        device : Device,
        pCreateInfo : ^DescriptorUpdateTemplateCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pDescriptorUpdateTemplate : ^DescriptorUpdateTemplate
    ) -> Result ---;

    @(link_name="vkDestroyDescriptorUpdateTemplateKHR")
    destroy_descriptor_update_template_khr :: proc(
        device : Device,
        descriptorUpdateTemplate : DescriptorUpdateTemplate,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkUpdateDescriptorSetWithTemplateKHR")
    update_descriptor_set_with_template_khr :: proc(
        device : Device,
        descriptorSet : DescriptorSet,
        descriptorUpdateTemplate : DescriptorUpdateTemplate,
        pData : rawptr
    ) ---;

    @(link_name="vkCreateRenderPass2KHR")
    create_render_pass2_khr :: proc(
        device : Device,
        pCreateInfo : ^RenderPassCreateInfo2,
        pAllocator : ^AllocationCallbacks,
        pRenderPass : ^RenderPass
    ) -> Result ---;

    @(link_name="vkCmdBeginRenderPass2KHR")
    cmd_begin_render_pass2_khr :: proc(
        commandBuffer : CommandBuffer,
        pRenderPassBegin : ^RenderPassBeginInfo,
        pSubpassBeginInfo : ^SubpassBeginInfo
    ) ---;

    @(link_name="vkCmdNextSubpass2KHR")
    cmd_next_subpass2_khr :: proc(
        commandBuffer : CommandBuffer,
        pSubpassBeginInfo : ^SubpassBeginInfo,
        pSubpassEndInfo : ^SubpassEndInfo
    ) ---;

    @(link_name="vkCmdEndRenderPass2KHR")
    cmd_end_render_pass2_khr :: proc(
        commandBuffer : CommandBuffer,
        pSubpassEndInfo : ^SubpassEndInfo
    ) ---;

    @(link_name="vkGetSwapchainStatusKHR")
    get_swapchain_status_khr :: proc(
        device : Device,
        swapchain : SwapchainKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceExternalFencePropertiesKHR")
    get_physical_device_external_fence_properties_khr :: proc(
        physicalDevice : PhysicalDevice,
        pExternalFenceInfo : ^PhysicalDeviceExternalFenceInfo,
        pExternalFenceProperties : ^ExternalFenceProperties
    ) ---;

    @(link_name="vkImportFenceFdKHR")
    import_fence_fd_khr :: proc(
        device : Device,
        pImportFenceFdInfo : ^ImportFenceFdInfoKHR
    ) -> Result ---;

    @(link_name="vkGetFenceFdKHR")
    get_fence_fd_khr :: proc(
        device : Device,
        pGetFdInfo : ^FenceGetFdInfoKHR,
        pFd : ^_c.int
    ) -> Result ---;

    @(link_name="vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR")
    enumerate_physical_device_queue_family_performance_query_counters_khr :: proc(
        physicalDevice : PhysicalDevice,
        queueFamilyIndex : u32,
        pCounterCount : ^u32,
        pCounters : ^PerformanceCounterKHR,
        pCounterDescriptions : ^PerformanceCounterDescriptionKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR")
    get_physical_device_queue_family_performance_query_passes_khr :: proc(
        physicalDevice : PhysicalDevice,
        pPerformanceQueryCreateInfo : ^QueryPoolPerformanceCreateInfoKHR,
        pNumPasses : ^u32
    ) ---;

    @(link_name="vkAcquireProfilingLockKHR")
    acquire_profiling_lock_khr :: proc(
        device : Device,
        pInfo : ^AcquireProfilingLockInfoKHR
    ) -> Result ---;

    @(link_name="vkReleaseProfilingLockKHR")
    release_profiling_lock_khr :: proc(device : Device) ---;

    @(link_name="vkGetPhysicalDeviceSurfaceCapabilities2KHR")
    get_physical_device_surface_capabilities2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pSurfaceInfo : ^PhysicalDeviceSurfaceInfo2KHR,
        pSurfaceCapabilities : ^SurfaceCapabilities2KHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceSurfaceFormats2KHR")
    get_physical_device_surface_formats2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pSurfaceInfo : ^PhysicalDeviceSurfaceInfo2KHR,
        pSurfaceFormatCount : ^u32,
        pSurfaceFormats : ^SurfaceFormat2KHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceDisplayProperties2KHR")
    get_physical_device_display_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pPropertyCount : ^u32,
        pProperties : ^DisplayProperties2KHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceDisplayPlaneProperties2KHR")
    get_physical_device_display_plane_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pPropertyCount : ^u32,
        pProperties : ^DisplayPlaneProperties2KHR
    ) -> Result ---;

    @(link_name="vkGetDisplayModeProperties2KHR")
    get_display_mode_properties2_khr :: proc(
        physicalDevice : PhysicalDevice,
        display : DisplayKHR,
        pPropertyCount : ^u32,
        pProperties : ^DisplayModeProperties2KHR
    ) -> Result ---;

    @(link_name="vkGetDisplayPlaneCapabilities2KHR")
    get_display_plane_capabilities2_khr :: proc(
        physicalDevice : PhysicalDevice,
        pDisplayPlaneInfo : ^DisplayPlaneInfo2KHR,
        pCapabilities : ^DisplayPlaneCapabilities2KHR
    ) -> Result ---;

    @(link_name="vkGetImageMemoryRequirements2KHR")
    get_image_memory_requirements2_khr :: proc(
        device : Device,
        pInfo : ^ImageMemoryRequirementsInfo2,
        pMemoryRequirements : ^MemoryRequirements2
    ) ---;

    @(link_name="vkGetBufferMemoryRequirements2KHR")
    get_buffer_memory_requirements2_khr :: proc(
        device : Device,
        pInfo : ^BufferMemoryRequirementsInfo2,
        pMemoryRequirements : ^MemoryRequirements2
    ) ---;

    @(link_name="vkGetImageSparseMemoryRequirements2KHR")
    get_image_sparse_memory_requirements2_khr :: proc(
        device : Device,
        pInfo : ^ImageSparseMemoryRequirementsInfo2,
        pSparseMemoryRequirementCount : ^u32,
        pSparseMemoryRequirements : ^SparseImageMemoryRequirements2
    ) ---;

    @(link_name="vkCreateSamplerYcbcrConversionKHR")
    create_sampler_ycbcr_conversion_khr :: proc(
        device : Device,
        pCreateInfo : ^SamplerYcbcrConversionCreateInfo,
        pAllocator : ^AllocationCallbacks,
        pYcbcrConversion : ^SamplerYcbcrConversion
    ) -> Result ---;

    @(link_name="vkDestroySamplerYcbcrConversionKHR")
    destroy_sampler_ycbcr_conversion_khr :: proc(
        device : Device,
        ycbcrConversion : SamplerYcbcrConversion,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkBindBufferMemory2KHR")
    bind_buffer_memory2_khr :: proc(
        device : Device,
        bindInfoCount : u32,
        pBindInfos : ^BindBufferMemoryInfo
    ) -> Result ---;

    @(link_name="vkBindImageMemory2KHR")
    bind_image_memory2_khr :: proc(
        device : Device,
        bindInfoCount : u32,
        pBindInfos : ^BindImageMemoryInfo
    ) -> Result ---;

    @(link_name="vkGetDescriptorSetLayoutSupportKHR")
    get_descriptor_set_layout_support_khr :: proc(
        device : Device,
        pCreateInfo : ^DescriptorSetLayoutCreateInfo,
        pSupport : ^DescriptorSetLayoutSupport
    ) ---;

    @(link_name="vkCmdDrawIndirectCountKHR")
    cmd_draw_indirect_count_khr :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdDrawIndexedIndirectCountKHR")
    cmd_draw_indexed_indirect_count_khr :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkGetSemaphoreCounterValueKHR")
    get_semaphore_counter_value_khr :: proc(
        device : Device,
        semaphore : Semaphore,
        pValue : ^u64
    ) -> Result ---;

    @(link_name="vkWaitSemaphoresKHR")
    wait_semaphores_khr :: proc(
        device : Device,
        pWaitInfo : ^SemaphoreWaitInfo,
        timeout : u64
    ) -> Result ---;

    @(link_name="vkSignalSemaphoreKHR")
    signal_semaphore_khr :: proc(
        device : Device,
        pSignalInfo : ^SemaphoreSignalInfo
    ) -> Result ---;

    @(link_name="vkGetBufferDeviceAddressKHR")
    get_buffer_device_address_khr :: proc(
        device : Device,
        pInfo : ^BufferDeviceAddressInfo
    ) -> DeviceAddress ---;

    @(link_name="vkGetBufferOpaqueCaptureAddressKHR")
    get_buffer_opaque_capture_address_khr :: proc(
        device : Device,
        pInfo : ^BufferDeviceAddressInfo
    ) -> u64 ---;

    @(link_name="vkGetDeviceMemoryOpaqueCaptureAddressKHR")
    get_device_memory_opaque_capture_address_khr :: proc(
        device : Device,
        pInfo : ^DeviceMemoryOpaqueCaptureAddressInfo
    ) -> u64 ---;

    @(link_name="vkGetPipelineExecutablePropertiesKHR")
    get_pipeline_executable_properties_khr :: proc(
        device : Device,
        pPipelineInfo : ^PipelineInfoKHR,
        pExecutableCount : ^u32,
        pProperties : ^PipelineExecutablePropertiesKHR
    ) -> Result ---;

    @(link_name="vkGetPipelineExecutableStatisticsKHR")
    get_pipeline_executable_statistics_khr :: proc(
        device : Device,
        pExecutableInfo : ^PipelineExecutableInfoKHR,
        pStatisticCount : ^u32,
        pStatistics : ^PipelineExecutableStatisticKHR
    ) -> Result ---;

    @(link_name="vkGetPipelineExecutableInternalRepresentationsKHR")
    get_pipeline_executable_internal_representations_khr :: proc(
        device : Device,
        pExecutableInfo : ^PipelineExecutableInfoKHR,
        pInternalRepresentationCount : ^u32,
        pInternalRepresentations : ^PipelineExecutableInternalRepresentationKHR
    ) -> Result ---;

    @(link_name="vkCreateDebugReportCallbackEXT")
    create_debug_report_callback_ext :: proc(
        instance : Instance,
        pCreateInfo : ^DebugReportCallbackCreateInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pCallback : ^DebugReportCallbackEXT
    ) -> Result ---;

    @(link_name="vkDestroyDebugReportCallbackEXT")
    destroy_debug_report_callback_ext :: proc(
        instance : Instance,
        callback : DebugReportCallbackEXT,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkDebugReportMessageEXT")
    debug_report_message_ext :: proc(
        instance : Instance,
        flags : DebugReportFlagsEXT,
        objectType : DebugReportObjectTypeEXT,
        object : u64,
        location : _c.size_t,
        messageCode : i32,
        pLayerPrefix : cstring,
        pMessage : cstring
    ) ---;

    @(link_name="vkDebugMarkerSetObjectTagEXT")
    debug_marker_set_object_tag_ext :: proc(
        device : Device,
        pTagInfo : ^DebugMarkerObjectTagInfoEXT
    ) -> Result ---;

    @(link_name="vkDebugMarkerSetObjectNameEXT")
    debug_marker_set_object_name_ext :: proc(
        device : Device,
        pNameInfo : ^DebugMarkerObjectNameInfoEXT
    ) -> Result ---;

    @(link_name="vkCmdDebugMarkerBeginEXT")
    cmd_debug_marker_begin_ext :: proc(
        commandBuffer : CommandBuffer,
        pMarkerInfo : ^DebugMarkerMarkerInfoEXT
    ) ---;

    @(link_name="vkCmdDebugMarkerEndEXT")
    cmd_debug_marker_end_ext :: proc(commandBuffer : CommandBuffer) ---;

    @(link_name="vkCmdDebugMarkerInsertEXT")
    cmd_debug_marker_insert_ext :: proc(
        commandBuffer : CommandBuffer,
        pMarkerInfo : ^DebugMarkerMarkerInfoEXT
    ) ---;

    @(link_name="vkCmdBindTransformFeedbackBuffersEXT")
    cmd_bind_transform_feedback_buffers_ext :: proc(
        commandBuffer : CommandBuffer,
        firstBinding : u32,
        bindingCount : u32,
        pBuffers : ^Buffer,
        pOffsets : ^DeviceSize,
        pSizes : ^DeviceSize
    ) ---;

    @(link_name="vkCmdBeginTransformFeedbackEXT")
    cmd_begin_transform_feedback_ext :: proc(
        commandBuffer : CommandBuffer,
        firstCounterBuffer : u32,
        counterBufferCount : u32,
        pCounterBuffers : ^Buffer,
        pCounterBufferOffsets : ^DeviceSize
    ) ---;

    @(link_name="vkCmdEndTransformFeedbackEXT")
    cmd_end_transform_feedback_ext :: proc(
        commandBuffer : CommandBuffer,
        firstCounterBuffer : u32,
        counterBufferCount : u32,
        pCounterBuffers : ^Buffer,
        pCounterBufferOffsets : ^DeviceSize
    ) ---;

    @(link_name="vkCmdBeginQueryIndexedEXT")
    cmd_begin_query_indexed_ext :: proc(
        commandBuffer : CommandBuffer,
        queryPool : QueryPool,
        query : u32,
        flags : QueryControlFlags,
        index : u32
    ) ---;

    @(link_name="vkCmdEndQueryIndexedEXT")
    cmd_end_query_indexed_ext :: proc(
        commandBuffer : CommandBuffer,
        queryPool : QueryPool,
        query : u32,
        index : u32
    ) ---;

    @(link_name="vkCmdDrawIndirectByteCountEXT")
    cmd_draw_indirect_byte_count_ext :: proc(
        commandBuffer : CommandBuffer,
        instanceCount : u32,
        firstInstance : u32,
        counterBuffer : Buffer,
        counterBufferOffset : DeviceSize,
        counterOffset : u32,
        vertexStride : u32
    ) ---;

    @(link_name="vkGetImageViewHandleNVX")
    get_image_view_handle_nvx :: proc(
        device : Device,
        pInfo : ^ImageViewHandleInfoNVX
    ) -> u32 ---;

    @(link_name="vkGetImageViewAddressNVX")
    get_image_view_address_nvx :: proc(
        device : Device,
        imageView : ImageView,
        pProperties : ^ImageViewAddressPropertiesNVX
    ) -> Result ---;

    @(link_name="vkCmdDrawIndirectCountAMD")
    cmd_draw_indirect_count_amd :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdDrawIndexedIndirectCountAMD")
    cmd_draw_indexed_indirect_count_amd :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkGetShaderInfoAMD")
    get_shader_info_amd :: proc(
        device : Device,
        pipeline : Pipeline,
        shaderStage : ShaderStageFlagBits,
        infoType : ShaderInfoTypeAMD,
        pInfoSize : ^_c.size_t,
        pInfo : rawptr
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceExternalImageFormatPropertiesNV")
    get_physical_device_external_image_format_properties_nv :: proc(
        physicalDevice : PhysicalDevice,
        format : Format,
        type : ImageType,
        tiling : ImageTiling,
        usage : ImageUsageFlags,
        flags : ImageCreateFlags,
        externalHandleType : ExternalMemoryHandleTypeFlagsNV,
        pExternalImageFormatProperties : ^ExternalImageFormatPropertiesNV
    ) -> Result ---;

    @(link_name="vkCmdBeginConditionalRenderingEXT")
    cmd_begin_conditional_rendering_ext :: proc(
        commandBuffer : CommandBuffer,
        pConditionalRenderingBegin : ^ConditionalRenderingBeginInfoEXT
    ) ---;

    @(link_name="vkCmdEndConditionalRenderingEXT")
    cmd_end_conditional_rendering_ext :: proc(commandBuffer : CommandBuffer) ---;

    @(link_name="vkCmdSetViewportWScalingNV")
    cmd_set_viewport_w_scaling_nv :: proc(
        commandBuffer : CommandBuffer,
        firstViewport : u32,
        viewportCount : u32,
        pViewportWScalings : ^ViewportWScalingNV
    ) ---;

    @(link_name="vkReleaseDisplayEXT")
    release_display_ext :: proc(
        physicalDevice : PhysicalDevice,
        display : DisplayKHR
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceSurfaceCapabilities2EXT")
    get_physical_device_surface_capabilities2_ext :: proc(
        physicalDevice : PhysicalDevice,
        surface : SurfaceKHR,
        pSurfaceCapabilities : ^SurfaceCapabilities2EXT
    ) -> Result ---;

    @(link_name="vkDisplayPowerControlEXT")
    display_power_control_ext :: proc(
        device : Device,
        display : DisplayKHR,
        pDisplayPowerInfo : ^DisplayPowerInfoEXT
    ) -> Result ---;

    @(link_name="vkRegisterDeviceEventEXT")
    register_device_event_ext :: proc(
        device : Device,
        pDeviceEventInfo : ^DeviceEventInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pFence : ^Fence
    ) -> Result ---;

    @(link_name="vkRegisterDisplayEventEXT")
    register_display_event_ext :: proc(
        device : Device,
        display : DisplayKHR,
        pDisplayEventInfo : ^DisplayEventInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pFence : ^Fence
    ) -> Result ---;

    @(link_name="vkGetSwapchainCounterEXT")
    get_swapchain_counter_ext :: proc(
        device : Device,
        swapchain : SwapchainKHR,
        counter : SurfaceCounterFlagBitsEXT,
        pCounterValue : ^u64
    ) -> Result ---;

    @(link_name="vkGetRefreshCycleDurationGOOGLE")
    get_refresh_cycle_duration_google :: proc(
        device : Device,
        swapchain : SwapchainKHR,
        pDisplayTimingProperties : ^RefreshCycleDurationGOOGLE
    ) -> Result ---;

    @(link_name="vkGetPastPresentationTimingGOOGLE")
    get_past_presentation_timing_google :: proc(
        device : Device,
        swapchain : SwapchainKHR,
        pPresentationTimingCount : ^u32,
        pPresentationTimings : ^PastPresentationTimingGOOGLE
    ) -> Result ---;

    @(link_name="vkCmdSetDiscardRectangleEXT")
    cmd_set_discard_rectangle_ext :: proc(
        commandBuffer : CommandBuffer,
        firstDiscardRectangle : u32,
        discardRectangleCount : u32,
        pDiscardRectangles : ^Rect2D
    ) ---;

    @(link_name="vkSetHdrMetadataEXT")
    set_hdr_metadata_ext :: proc(
        device : Device,
        swapchainCount : u32,
        pSwapchains : ^SwapchainKHR,
        pMetadata : ^HdrMetadataEXT
    ) ---;

    @(link_name="vkSetDebugUtilsObjectNameEXT")
    set_debug_utils_object_name_ext :: proc(
        device : Device,
        pNameInfo : ^DebugUtilsObjectNameInfoEXT
    ) -> Result ---;

    @(link_name="vkSetDebugUtilsObjectTagEXT")
    set_debug_utils_object_tag_ext :: proc(
        device : Device,
        pTagInfo : ^DebugUtilsObjectTagInfoEXT
    ) -> Result ---;

    @(link_name="vkQueueBeginDebugUtilsLabelEXT")
    queue_begin_debug_utils_label_ext :: proc(
        queue : Queue,
        pLabelInfo : ^DebugUtilsLabelEXT
    ) ---;

    @(link_name="vkQueueEndDebugUtilsLabelEXT")
    queue_end_debug_utils_label_ext :: proc(queue : Queue) ---;

    @(link_name="vkQueueInsertDebugUtilsLabelEXT")
    queue_insert_debug_utils_label_ext :: proc(
        queue : Queue,
        pLabelInfo : ^DebugUtilsLabelEXT
    ) ---;

    @(link_name="vkCmdBeginDebugUtilsLabelEXT")
    cmd_begin_debug_utils_label_ext :: proc(
        commandBuffer : CommandBuffer,
        pLabelInfo : ^DebugUtilsLabelEXT
    ) ---;

    @(link_name="vkCmdEndDebugUtilsLabelEXT")
    cmd_end_debug_utils_label_ext :: proc(commandBuffer : CommandBuffer) ---;

    @(link_name="vkCmdInsertDebugUtilsLabelEXT")
    cmd_insert_debug_utils_label_ext :: proc(
        commandBuffer : CommandBuffer,
        pLabelInfo : ^DebugUtilsLabelEXT
    ) ---;

    @(link_name="vkCreateDebugUtilsMessengerEXT")
    create_debug_utils_messenger_ext :: proc(
        instance : Instance,
        pCreateInfo : ^DebugUtilsMessengerCreateInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pMessenger : ^DebugUtilsMessengerEXT
    ) -> Result ---;

    @(link_name="vkDestroyDebugUtilsMessengerEXT")
    destroy_debug_utils_messenger_ext :: proc(
        instance : Instance,
        messenger : DebugUtilsMessengerEXT,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkSubmitDebugUtilsMessageEXT")
    submit_debug_utils_message_ext :: proc(
        instance : Instance,
        messageSeverity : DebugUtilsMessageSeverityFlagBitsEXT,
        messageTypes : DebugUtilsMessageTypeFlagsEXT,
        pCallbackData : ^DebugUtilsMessengerCallbackDataEXT
    ) ---;

    @(link_name="vkCmdSetSampleLocationsEXT")
    cmd_set_sample_locations_ext :: proc(
        commandBuffer : CommandBuffer,
        pSampleLocationsInfo : ^SampleLocationsInfoEXT
    ) ---;

    @(link_name="vkGetPhysicalDeviceMultisamplePropertiesEXT")
    get_physical_device_multisample_properties_ext :: proc(
        physicalDevice : PhysicalDevice,
        samples : SampleCountFlagBits,
        pMultisampleProperties : ^MultisamplePropertiesEXT
    ) ---;

    @(link_name="vkGetImageDrmFormatModifierPropertiesEXT")
    get_image_drm_format_modifier_properties_ext :: proc(
        device : Device,
        image : Image,
        pProperties : ^ImageDrmFormatModifierPropertiesEXT
    ) -> Result ---;

    @(link_name="vkCreateValidationCacheEXT")
    create_validation_cache_ext :: proc(
        device : Device,
        pCreateInfo : ^ValidationCacheCreateInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pValidationCache : ^ValidationCacheEXT
    ) -> Result ---;

    @(link_name="vkDestroyValidationCacheEXT")
    destroy_validation_cache_ext :: proc(
        device : Device,
        validationCache : ValidationCacheEXT,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkMergeValidationCachesEXT")
    merge_validation_caches_ext :: proc(
        device : Device,
        dstCache : ValidationCacheEXT,
        srcCacheCount : u32,
        pSrcCaches : ^ValidationCacheEXT
    ) -> Result ---;

    @(link_name="vkGetValidationCacheDataEXT")
    get_validation_cache_data_ext :: proc(
        device : Device,
        validationCache : ValidationCacheEXT,
        pDataSize : ^_c.size_t,
        pData : rawptr
    ) -> Result ---;

    @(link_name="vkCmdBindShadingRateImageNV")
    cmd_bind_shading_rate_image_nv :: proc(
        commandBuffer : CommandBuffer,
        imageView : ImageView,
        imageLayout : ImageLayout
    ) ---;

    @(link_name="vkCmdSetViewportShadingRatePaletteNV")
    cmd_set_viewport_shading_rate_palette_nv :: proc(
        commandBuffer : CommandBuffer,
        firstViewport : u32,
        viewportCount : u32,
        pShadingRatePalettes : ^ShadingRatePaletteNV
    ) ---;

    @(link_name="vkCmdSetCoarseSampleOrderNV")
    cmd_set_coarse_sample_order_nv :: proc(
        commandBuffer : CommandBuffer,
        sampleOrderType : CoarseSampleOrderTypeNV,
        customSampleOrderCount : u32,
        pCustomSampleOrders : ^CoarseSampleOrderCustomNV
    ) ---;

    @(link_name="vkCreateAccelerationStructureNV")
    create_acceleration_structure_nv :: proc(
        device : Device,
        pCreateInfo : ^AccelerationStructureCreateInfoNV,
        pAllocator : ^AllocationCallbacks,
        pAccelerationStructure : ^AccelerationStructureNV
    ) -> Result ---;

    @(link_name="vkDestroyAccelerationStructureKHR")
    destroy_acceleration_structure_khr :: proc(
        device : Device,
        accelerationStructure : AccelerationStructureKHR,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkDestroyAccelerationStructureNV")
    destroy_acceleration_structure_nv :: proc(
        device : Device,
        accelerationStructure : AccelerationStructureKHR,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkGetAccelerationStructureMemoryRequirementsNV")
    get_acceleration_structure_memory_requirements_nv :: proc(
        device : Device,
        pInfo : ^AccelerationStructureMemoryRequirementsInfoNV,
        pMemoryRequirements : ^MemoryRequirements2KHR
    ) ---;

    @(link_name="vkBindAccelerationStructureMemoryKHR")
    bind_acceleration_structure_memory_khr :: proc(
        device : Device,
        bindInfoCount : u32,
        pBindInfos : ^BindAccelerationStructureMemoryInfoKHR
    ) -> Result ---;

    @(link_name="vkBindAccelerationStructureMemoryNV")
    bind_acceleration_structure_memory_nv :: proc(
        device : Device,
        bindInfoCount : u32,
        pBindInfos : ^BindAccelerationStructureMemoryInfoKHR
    ) -> Result ---;

    @(link_name="vkCmdBuildAccelerationStructureNV")
    cmd_build_acceleration_structure_nv :: proc(
        commandBuffer : CommandBuffer,
        pInfo : ^AccelerationStructureInfoNV,
        instanceData : Buffer,
        instanceOffset : DeviceSize,
        update : Bool32,
        dst : AccelerationStructureKHR,
        src : AccelerationStructureKHR,
        scratch : Buffer,
        scratchOffset : DeviceSize
    ) ---;

    @(link_name="vkCmdCopyAccelerationStructureNV")
    cmd_copy_acceleration_structure_nv :: proc(
        commandBuffer : CommandBuffer,
        dst : AccelerationStructureKHR,
        src : AccelerationStructureKHR,
        mode : CopyAccelerationStructureModeKHR
    ) ---;

    @(link_name="vkCmdTraceRaysNV")
    cmd_trace_rays_nv :: proc(
        commandBuffer : CommandBuffer,
        raygenShaderBindingTableBuffer : Buffer,
        raygenShaderBindingOffset : DeviceSize,
        missShaderBindingTableBuffer : Buffer,
        missShaderBindingOffset : DeviceSize,
        missShaderBindingStride : DeviceSize,
        hitShaderBindingTableBuffer : Buffer,
        hitShaderBindingOffset : DeviceSize,
        hitShaderBindingStride : DeviceSize,
        callableShaderBindingTableBuffer : Buffer,
        callableShaderBindingOffset : DeviceSize,
        callableShaderBindingStride : DeviceSize,
        width : u32,
        height : u32,
        depth : u32
    ) ---;

    @(link_name="vkCreateRayTracingPipelinesNV")
    create_ray_tracing_pipelines_nv :: proc(
        device : Device,
        pipelineCache : PipelineCache,
        createInfoCount : u32,
        pCreateInfos : ^RayTracingPipelineCreateInfoNV,
        pAllocator : ^AllocationCallbacks,
        pPipelines : ^Pipeline
    ) -> Result ---;

    @(link_name="vkGetRayTracingShaderGroupHandlesKHR")
    get_ray_tracing_shader_group_handles_khr :: proc(
        device : Device,
        pipeline : Pipeline,
        firstGroup : u32,
        groupCount : u32,
        dataSize : _c.size_t,
        pData : rawptr
    ) -> Result ---;

    @(link_name="vkGetRayTracingShaderGroupHandlesNV")
    get_ray_tracing_shader_group_handles_nv :: proc(
        device : Device,
        pipeline : Pipeline,
        firstGroup : u32,
        groupCount : u32,
        dataSize : _c.size_t,
        pData : rawptr
    ) -> Result ---;

    @(link_name="vkGetAccelerationStructureHandleNV")
    get_acceleration_structure_handle_nv :: proc(
        device : Device,
        accelerationStructure : AccelerationStructureKHR,
        dataSize : _c.size_t,
        pData : rawptr
    ) -> Result ---;

    @(link_name="vkCmdWriteAccelerationStructuresPropertiesKHR")
    cmd_write_acceleration_structures_properties_khr :: proc(
        commandBuffer : CommandBuffer,
        accelerationStructureCount : u32,
        pAccelerationStructures : ^AccelerationStructureKHR,
        queryType : QueryType,
        queryPool : QueryPool,
        firstQuery : u32
    ) ---;

    @(link_name="vkCmdWriteAccelerationStructuresPropertiesNV")
    cmd_write_acceleration_structures_properties_nv :: proc(
        commandBuffer : CommandBuffer,
        accelerationStructureCount : u32,
        pAccelerationStructures : ^AccelerationStructureKHR,
        queryType : QueryType,
        queryPool : QueryPool,
        firstQuery : u32
    ) ---;

    @(link_name="vkCompileDeferredNV")
    compile_deferred_nv :: proc(
        device : Device,
        pipeline : Pipeline,
        shader : u32
    ) -> Result ---;

    @(link_name="vkGetMemoryHostPointerPropertiesEXT")
    get_memory_host_pointer_properties_ext :: proc(
        device : Device,
        handleType : ExternalMemoryHandleTypeFlagBits,
        pHostPointer : rawptr,
        pMemoryHostPointerProperties : ^MemoryHostPointerPropertiesEXT
    ) -> Result ---;

    @(link_name="vkCmdWriteBufferMarkerAMD")
    cmd_write_buffer_marker_amd :: proc(
        commandBuffer : CommandBuffer,
        pipelineStage : PipelineStageFlagBits,
        dstBuffer : Buffer,
        dstOffset : DeviceSize,
        marker : u32
    ) ---;

    @(link_name="vkGetPhysicalDeviceCalibrateableTimeDomainsEXT")
    get_physical_device_calibrateable_time_domains_ext :: proc(
        physicalDevice : PhysicalDevice,
        pTimeDomainCount : ^u32,
        pTimeDomains : ^TimeDomainEXT
    ) -> Result ---;

    @(link_name="vkGetCalibratedTimestampsEXT")
    get_calibrated_timestamps_ext :: proc(
        device : Device,
        timestampCount : u32,
        pTimestampInfos : ^CalibratedTimestampInfoEXT,
        pTimestamps : ^u64,
        pMaxDeviation : ^u64
    ) -> Result ---;

    @(link_name="vkCmdDrawMeshTasksNV")
    cmd_draw_mesh_tasks_nv :: proc(
        commandBuffer : CommandBuffer,
        taskCount : u32,
        firstTask : u32
    ) ---;

    @(link_name="vkCmdDrawMeshTasksIndirectNV")
    cmd_draw_mesh_tasks_indirect_nv :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        drawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdDrawMeshTasksIndirectCountNV")
    cmd_draw_mesh_tasks_indirect_count_nv :: proc(
        commandBuffer : CommandBuffer,
        buffer : Buffer,
        offset : DeviceSize,
        countBuffer : Buffer,
        countBufferOffset : DeviceSize,
        maxDrawCount : u32,
        stride : u32
    ) ---;

    @(link_name="vkCmdSetExclusiveScissorNV")
    cmd_set_exclusive_scissor_nv :: proc(
        commandBuffer : CommandBuffer,
        firstExclusiveScissor : u32,
        exclusiveScissorCount : u32,
        pExclusiveScissors : ^Rect2D
    ) ---;

    @(link_name="vkCmdSetCheckpointNV")
    cmd_set_checkpoint_nv :: proc(
        commandBuffer : CommandBuffer,
        pCheckpointMarker : rawptr
    ) ---;

    @(link_name="vkGetQueueCheckpointDataNV")
    get_queue_checkpoint_data_nv :: proc(
        queue : Queue,
        pCheckpointDataCount : ^u32,
        pCheckpointData : ^CheckpointDataNV
    ) ---;

    @(link_name="vkInitializePerformanceApiINTEL")
    initialize_performance_api_intel :: proc(
        device : Device,
        pInitializeInfo : ^InitializePerformanceApiInfoINTEL
    ) -> Result ---;

    @(link_name="vkUninitializePerformanceApiINTEL")
    uninitialize_performance_api_intel :: proc(device : Device) ---;

    @(link_name="vkCmdSetPerformanceMarkerINTEL")
    cmd_set_performance_marker_intel :: proc(
        commandBuffer : CommandBuffer,
        pMarkerInfo : ^PerformanceMarkerInfoINTEL
    ) -> Result ---;

    @(link_name="vkCmdSetPerformanceStreamMarkerINTEL")
    cmd_set_performance_stream_marker_intel :: proc(
        commandBuffer : CommandBuffer,
        pMarkerInfo : ^PerformanceStreamMarkerInfoINTEL
    ) -> Result ---;

    @(link_name="vkCmdSetPerformanceOverrideINTEL")
    cmd_set_performance_override_intel :: proc(
        commandBuffer : CommandBuffer,
        pOverrideInfo : ^PerformanceOverrideInfoINTEL
    ) -> Result ---;

    @(link_name="vkAcquirePerformanceConfigurationINTEL")
    acquire_performance_configuration_intel :: proc(
        device : Device,
        pAcquireInfo : ^PerformanceConfigurationAcquireInfoINTEL,
        pConfiguration : ^PerformanceConfigurationINTEL
    ) -> Result ---;

    @(link_name="vkReleasePerformanceConfigurationINTEL")
    release_performance_configuration_intel :: proc(
        device : Device,
        configuration : PerformanceConfigurationINTEL
    ) -> Result ---;

    @(link_name="vkQueueSetPerformanceConfigurationINTEL")
    queue_set_performance_configuration_intel :: proc(
        queue : Queue,
        configuration : PerformanceConfigurationINTEL
    ) -> Result ---;

    @(link_name="vkGetPerformanceParameterINTEL")
    get_performance_parameter_intel :: proc(
        device : Device,
        parameter : PerformanceParameterTypeINTEL,
        pValue : ^PerformanceValueINTEL
    ) -> Result ---;

    @(link_name="vkSetLocalDimmingAMD")
    set_local_dimming_amd :: proc(
        device : Device,
        swapChain : SwapchainKHR,
        localDimmingEnable : Bool32
    ) ---;

    @(link_name="vkGetBufferDeviceAddressEXT")
    get_buffer_device_address_ext :: proc(
        device : Device,
        pInfo : ^BufferDeviceAddressInfo
    ) -> DeviceAddress ---;

    @(link_name="vkGetPhysicalDeviceToolPropertiesEXT")
    get_physical_device_tool_properties_ext :: proc(
        physicalDevice : PhysicalDevice,
        pToolCount : ^u32,
        pToolProperties : ^PhysicalDeviceToolPropertiesEXT
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceCooperativeMatrixPropertiesNV")
    get_physical_device_cooperative_matrix_properties_nv :: proc(
        physicalDevice : PhysicalDevice,
        pPropertyCount : ^u32,
        pProperties : ^CooperativeMatrixPropertiesNV
    ) -> Result ---;

    @(link_name="vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV")
    get_physical_device_supported_framebuffer_mixed_samples_combinations_nv :: proc(
        physicalDevice : PhysicalDevice,
        pCombinationCount : ^u32,
        pCombinations : ^FramebufferMixedSamplesCombinationNV
    ) -> Result ---;

    @(link_name="vkCreateHeadlessSurfaceEXT")
    create_headless_surface_ext :: proc(
        instance : Instance,
        pCreateInfo : ^HeadlessSurfaceCreateInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pSurface : ^SurfaceKHR
    ) -> Result ---;

    @(link_name="vkCmdSetLineStippleEXT")
    cmd_set_line_stipple_ext :: proc(
        commandBuffer : CommandBuffer,
        lineStippleFactor : u32,
        lineStipplePattern : u16
    ) ---;

    @(link_name="vkResetQueryPoolEXT")
    reset_query_pool_ext :: proc(
        device : Device,
        queryPool : QueryPool,
        firstQuery : u32,
        queryCount : u32
    ) ---;

    @(link_name="vkGetGeneratedCommandsMemoryRequirementsNV")
    get_generated_commands_memory_requirements_nv :: proc(
        device : Device,
        pInfo : ^GeneratedCommandsMemoryRequirementsInfoNV,
        pMemoryRequirements : ^MemoryRequirements2
    ) ---;

    @(link_name="vkCmdPreprocessGeneratedCommandsNV")
    cmd_preprocess_generated_commands_nv :: proc(
        commandBuffer : CommandBuffer,
        pGeneratedCommandsInfo : ^GeneratedCommandsInfoNV
    ) ---;

    @(link_name="vkCmdExecuteGeneratedCommandsNV")
    cmd_execute_generated_commands_nv :: proc(
        commandBuffer : CommandBuffer,
        isPreprocessed : Bool32,
        pGeneratedCommandsInfo : ^GeneratedCommandsInfoNV
    ) ---;

    @(link_name="vkCmdBindPipelineShaderGroupNV")
    cmd_bind_pipeline_shader_group_nv :: proc(
        commandBuffer : CommandBuffer,
        pipelineBindPoint : PipelineBindPoint,
        pipeline : Pipeline,
        groupIndex : u32
    ) ---;

    @(link_name="vkCreateIndirectCommandsLayoutNV")
    create_indirect_commands_layout_nv :: proc(
        device : Device,
        pCreateInfo : ^IndirectCommandsLayoutCreateInfoNV,
        pAllocator : ^AllocationCallbacks,
        pIndirectCommandsLayout : ^IndirectCommandsLayoutNV
    ) -> Result ---;

    @(link_name="vkDestroyIndirectCommandsLayoutNV")
    destroy_indirect_commands_layout_nv :: proc(
        device : Device,
        indirectCommandsLayout : IndirectCommandsLayoutNV,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkCreatePrivateDataSlotEXT")
    create_private_data_slot_ext :: proc(
        device : Device,
        pCreateInfo : ^PrivateDataSlotCreateInfoEXT,
        pAllocator : ^AllocationCallbacks,
        pPrivateDataSlot : ^PrivateDataSlotEXT
    ) -> Result ---;

    @(link_name="vkDestroyPrivateDataSlotEXT")
    destroy_private_data_slot_ext :: proc(
        device : Device,
        privateDataSlot : PrivateDataSlotEXT,
        pAllocator : ^AllocationCallbacks
    ) ---;

    @(link_name="vkSetPrivateDataEXT")
    set_private_data_ext :: proc(
        device : Device,
        objectType : ObjectType,
        objectHandle : u64,
        privateDataSlot : PrivateDataSlotEXT,
        data : u64
    ) -> Result ---;

    @(link_name="vkGetPrivateDataEXT")
    get_private_data_ext :: proc(
        device : Device,
        objectType : ObjectType,
        objectHandle : u64,
        privateDataSlot : PrivateDataSlotEXT,
        pData : ^u64
    ) ---;

}
