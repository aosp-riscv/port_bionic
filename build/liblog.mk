# NOTE: we only do static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  liblog
# Variant: android_x86_core_static
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: system/core/liblog/Android.bp:66:1

m.liblog_android_riscv64_core_static.cflags = \
	-Werror -DLIBLOG_LOG_TAG=1006 -DSNET_EVENT_LOG_TAG=1397638484 \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC -D_USING_LIBCXX

m.liblog_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

# note
# system/core/libutils/include and system/core/libsystem/include
# are added to pass build, don't know why in build.ninja they are
# not presented!
CPPFLAGS += \
	-Isystem/core/liblog \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ToolchainCflags} \
	${g.android.soong.cc.config.RISCV64VariantClangCflags} \
	-Isystem/core/liblog/include -Iexternal/libcxx/include \
	-Iexternal/libcxxabi/include -Ibionic/libc/include \
	-Isystem/core/libcutils/include \
	-Isystem/core/libutils/include \
	-Isystem/core/libsystem/include \
	-D__LIBC_API__=10000 -D__LIBM_API__=10000 \
	-D__LIBDL_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.liblog_android_riscv64_core_static.cflags} \
	${m.liblog_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_CPP = \
	system/core/liblog/config_read.cpp \
	system/core/liblog/config_write.cpp \
	system/core/liblog/log_event_list.cpp \
	system/core/liblog/log_event_write.cpp \
	system/core/liblog/logger_lock.cpp \
	system/core/liblog/logger_name.cpp \
	system/core/liblog/logger_read.cpp \
	system/core/liblog/logger_write.cpp \
	system/core/liblog/logprint.cpp \
	system/core/liblog/stderr_write.cpp \
	system/core/liblog/event_tag_map.cpp \
	system/core/liblog/log_time.cpp \
	system/core/liblog/properties.cpp \
	system/core/liblog/pmsg_reader.cpp \
	system/core/liblog/pmsg_writer.cpp \
	system/core/liblog/logd_reader.cpp \
	system/core/liblog/logd_writer.cpp

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/liblog.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/liblog.a @${LIB_DIR}/static/liblog.a.rsp