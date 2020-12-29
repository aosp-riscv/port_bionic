# NOTE: we only do static
PRJPATH = .

include $(PRJPATH)/build/common.mk

##################################################
# Module:  libm
# Variant: android_arm64_armv8-a_core_static
# Type:    cc_library
# Factory: android/soong/android.ModuleFactoryAdaptor.func1
# Defined: bionic/libm/Android.bp:6:1

m.libm_android_riscv64_core_static.cflags = \
	-D__BIONIC_LP32_USE_LONG_DOUBLE \
	-D__BIONIC_NO_MATH_INLINES \
	-D_BSD_SOURCE \
	-DFLT_EVAL_METHOD=0 \
	-include freebsd-compat.h \
	-fno-math-errno \
	-Wall -Werror -Wno-missing-braces -Wno-parentheses -Wno-sign-compare \
	-Wno-unknown-pragmas -Wno-unused-const-variable -Wno-unused-variable \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-DANDROID_STRICT -fPIC

m.libm_android_riscv64_core_static.cppflags = \
	-std=gnu++17 \
	${g.android.soong.cc.config.CommonClangGlobalCppflags} \
	${g.android.soong.cc.config.DeviceGlobalCppflags} \
	-fno-rtti \
	${g.android.soong.cc.config.RISCV64ClangCppflags}

m.libm_android_riscv64_core_static.asflags = \
	-target riscv64-unknown-linux-gnu \
	-B${g.android.soong.cc.config.RISCV64GccRoot}/riscv64/bin \
	-D__ASSEMBLY__

AFLAGS += \
	-Ibionic/libm/upstream-freebsd/lib/msun/ld128 \
	-Ibionic/libm/upstream-freebsd/android/include \
	-Ibionic/libm/upstream-freebsd/lib/msun/src \
	-Ibionic/libc -Ibionic/libm \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ClangArmv8ACflags} \
	-Ibionic/libc/include -D__LIBC_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libm_android_riscv64_core_static.asflags}

CFLAGS += \
	-Ibionic/libm/upstream-freebsd/lib/msun/ld128 \
	-Ibionic/libm/upstream-freebsd/android/include \
	-Ibionic/libm/upstream-freebsd/lib/msun/src \
	-Ibionic/libc -Ibionic/libm \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags}\
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ClangArmv8ACflags} \
	-Ibionic/libc/include -D__LIBC_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libm_android_riscv64_core_static.cflags} \
	-std=gnu99 \
	${g.android.soong.cc.config.CommonGlobalConlyflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

CPPFLAGS += \
	-Ibionic/libm/upstream-freebsd/lib/msun/ld128 \
	-Ibionic/libm/upstream-freebsd/android/include \
	-Ibionic/libm/upstream-freebsd/lib/msun/src \
	-Ibionic/libc -Ibionic/libm \
	${g.android.soong.cc.config.RISCV64ClangCflags} \
	${g.android.soong.cc.config.CommonClangGlobalCflags} \
	${g.android.soong.cc.config.DeviceClangGlobalCflags} \
	${g.android.soong.cc.config.RISCV64ClangArmv8ACflags} \
	-Ibionic/libc/include -D__LIBC_API__=10000 \
	${g.android.soong.cc.config.CommonGlobalIncludes} \
	${g.android.soong.cc.config.RISCV64IncludeFlags} \
	${g.android.soong.cc.config.CommonNativehelperInclude} \
	${m.libm_android_riscv64_core_static.cflags} \
	${m.libm_android_riscv64_core_static.cppflags} \
	${g.android.soong.cc.config.NoOverrideClangGlobalCflags}

SRCS_C = \
	bionic/libm/upstream-freebsd/lib/msun/bsdsrc/b_exp.c \
	bionic/libm/upstream-freebsd/lib/msun/bsdsrc/b_log.c \
	bionic/libm/upstream-freebsd/lib/msun/bsdsrc/b_tgamma.c \
	bionic/libm/upstream-freebsd/lib/msun/src/catrig.c \
	bionic/libm/upstream-freebsd/lib/msun/src/catrigf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_acos.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_acosf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_acosh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_acoshf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_asin.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_asinf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_atan2.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_atan2f.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_atanh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_atanhf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_cosh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_coshf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_fmod.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_fmodf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_gamma.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_gammaf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_gammaf_r.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_gamma_r.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_hypot.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_hypotf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_j0.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_j0f.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_j1.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_j1f.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_jn.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_jnf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_lgamma.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_lgammaf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_lgammaf_r.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_lgamma_r.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_log10.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_log10f.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_remainder.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_remainderf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_rem_pio2.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_rem_pio2f.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_scalb.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_scalbf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_sinh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_sinhf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_sqrt.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_sqrtf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_cos.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_cosf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_exp.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_expf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_rem_pio2.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_sin.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_sinf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_tan.c \
	bionic/libm/upstream-freebsd/lib/msun/src/k_tanf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_asinh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_asinhf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_atan.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_atanf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_carg.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cargf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cargl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cbrt.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cbrtf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ccosh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ccoshf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ceil.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ceilf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cexp.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cexpf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cimag.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cimagf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cimagl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_clog.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_clogf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_conj.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_conjf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_conjl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_copysign.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_copysignf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cos.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cpow.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cpowf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cpowl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cproj.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cprojf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cprojl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_creal.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_crealf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_creall.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_csinh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_csinhf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_csqrt.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_csqrtf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ctanh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ctanhf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_erf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_erff.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_expm1.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_expm1f.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fdim.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_finite.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_finitef.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_floor.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_floorf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fma.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fmaf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fmax.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fmaxf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fmin.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fminf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_frexp.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_frexpf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ilogb.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ilogbf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_llrint.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_llrintf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_llround.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_llroundf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_log1p.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_log1pf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_logb.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_logbf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_lrint.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_lrintf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_lround.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_lroundf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_modf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_modff.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nan.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nearbyint.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nextafter.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nextafterf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_remquo.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_remquof.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_rint.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_rintf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_round.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_roundf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_scalbln.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_scalbn.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_scalbnf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_signgam.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_significand.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_significandf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_sin.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_sincos.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tan.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tanf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tanh.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tanhf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tgammaf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_trunc.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_truncf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/w_cabs.c \
	bionic/libm/upstream-freebsd/lib/msun/src/w_cabsf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/w_cabsl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/w_drem.c \
	bionic/libm/upstream-freebsd/lib/msun/src/w_dremf.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/ccoshl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/ccosl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/cephes_subrl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/cexpl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/csinhl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/csinl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/ctanhl.c \
	bionic/libm/upstream-netbsd/lib/libm/complex/ctanl.c \
	bionic/libm/digittoint.c \
	bionic/libm/significandl.c \
	bionic/libm/fake_long_double.c \
	bionic/libm/upstream-freebsd/lib/msun/src/catrigl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_acosl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_acoshl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_asinl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_atan2l.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_atanhl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_fmodl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_hypotl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_lgammal.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_remainderl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_sqrtl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_asinhl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_atanl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cbrtl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ceill.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_clogl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_copysignl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_coshl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_cosl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_csqrtl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_floorl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fmal.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fmaxl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_fminl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_modfl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_frexpl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_ilogbl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_llrintl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_llroundl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_logbl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_lrintl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_lroundl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nextafterl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nexttoward.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_nexttowardf.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_remquol.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_rintl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_roundl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_scalbnl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_sincosl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/e_sinhl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_sinl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tanhl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_tanl.c \
	bionic/libm/upstream-freebsd/lib/msun/src/s_truncl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/invtrig.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/e_lgammal_r.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/e_powl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/k_cosl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/k_sinl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/k_tanl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/s_erfl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/s_exp2l.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/s_expl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/s_logl.c \
	bionic/libm/upstream-freebsd/lib/msun/ld128/s_nanl.c

SRCS_CPP = \
	bionic/libm/builtins.cpp \
	bionic/libm/signbit.cpp \

# TBD, assemblely to be added
SRCS_ASM = 

include $(PRJPATH)/build/common_rules.mk

.DEFAULT_GOAL := all
all : $(OBJS)
	@if [ ! -e $(LIB_DIR) ]; then mkdir -p $(LIB_DIR); fi
	@if [ ! -e $(LIB_DIR)/static ]; then mkdir -p $(LIB_DIR)/static; fi
	@echo $(OUTPUT_OBJS) >> $(LIB_DIR)/static/libm.a.rsp
	llvm-ar crsD -format=gnu $(LIB_DIR)/static/libm.a @${LIB_DIR}/static/libm.a.rsp