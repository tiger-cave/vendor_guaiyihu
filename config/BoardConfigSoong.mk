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
    target_process_sdk_version_override

# Soong value variables
SOONG_CONFIG_guaiyihuGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
