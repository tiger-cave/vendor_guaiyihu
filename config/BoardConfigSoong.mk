PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.

SOONG_CONFIG_NAMESPACES += guaiyihuVarsPlugin

SOONG_CONFIG_guaiyihuVarsPlugin :=

define addVar
  SOONG_CONFIG_guaiyihuVarsPlugin += $(1)
  SOONG_CONFIG_guaiyihuVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += guaiyihuGlobalVars
SOONG_CONFIG_guaiyihuGlobalVars += \
    additional_gralloc_10_usage_bits \
    disable_postrender_cleanup \
    has_memfd_backport \
    target_init_vendor_lib \
    target_process_sdk_version_override \
    uses_camera_parameter_lib \
    uses_qcom_bsp_legacy

# Soong bool variables
SOONG_CONFIG_guaiyihuGlobalVars_disable_postrender_cleanup := $(TARGET_DISABLE_POSTRENDER_CLEANUP)

# Set default values
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY ?= libcamera_parameters

# Soong value variables
SOONG_CONFIG_guaiyihuGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_guaiyihuGlobalVars_has_memfd_backport := $(TARGET_HAS_MEMFD_BACKPORT)
SOONG_CONFIG_guaiyihuGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_guaiyihuGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_guaiyihuGlobalVars_uses_camera_parameter_lib := $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)
SOONG_CONFIG_guaiyihuGlobalVars_uses_qcom_bsp_legacy := $(TARGET_USES_QCOM_BSP_LEGACY)
