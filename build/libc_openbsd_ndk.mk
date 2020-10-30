PRJPATH = .

include $(PRJPATH)/build/common.mk

INC_LOCAL = \
	-Ibionic/libc/private -Ibionic/libc/stdio \
	-Ibionic/libc/upstream-openbsd/android/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/include \
	-Ibionic/libc/upstream-openbsd/lib/libc/gdtoa

CFLAGS_LOCAL = \
	-Wno-sign-compare \
	-Wno-unused-parameter \
	-include openbsd-compat.h

CFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_ASM = 

SRCS_C = \
	bionic/libc/upstream-openbsd/lib/libc/gen/alarm.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/ctype_.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/daemon.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/err.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/errx.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/fnmatch.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/ftok.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/getprogname.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/isctype.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/setprogname.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/tolower_.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/toupper_.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/verr.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/verrx.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/vwarn.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/vwarnx.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/warn.c \
	bionic/libc/upstream-openbsd/lib/libc/gen/warnx.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/btowc.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/mbrlen.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/mbstowcs.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/mbtowc.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcscoll.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstoimax.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstol.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstoll.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstombs.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstoul.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstoull.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcstoumax.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wcsxfrm.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wctob.c \
	bionic/libc/upstream-openbsd/lib/libc/locale/wctomb.c \
	bionic/libc/upstream-openbsd/lib/libc/net/base64.c \
	bionic/libc/upstream-openbsd/lib/libc/net/htonl.c \
	bionic/libc/upstream-openbsd/lib/libc/net/htons.c \
	bionic/libc/upstream-openbsd/lib/libc/net/inet_lnaof.c \
	bionic/libc/upstream-openbsd/lib/libc/net/inet_makeaddr.c \
	bionic/libc/upstream-openbsd/lib/libc/net/inet_netof.c \
	bionic/libc/upstream-openbsd/lib/libc/net/inet_ntoa.c \
	bionic/libc/upstream-openbsd/lib/libc/net/inet_ntop.c \
	bionic/libc/upstream-openbsd/lib/libc/net/inet_pton.c \
	bionic/libc/upstream-openbsd/lib/libc/net/ntohl.c \
	bionic/libc/upstream-openbsd/lib/libc/net/ntohs.c \
	bionic/libc/upstream-openbsd/lib/libc/net/res_random.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fgetln.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fgetwc.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fgetws.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/flags.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fpurge.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fputwc.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fputws.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fvwrite.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/fwide.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/getdelim.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/gets.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/makebuf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/mktemp.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/open_memstream.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/open_wmemstream.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/rget.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/setvbuf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/tempnam.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/tmpnam.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/ungetc.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/ungetwc.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/vasprintf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/vdprintf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/vsscanf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/vswprintf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/vswscanf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/wbuf.c \
	bionic/libc/upstream-openbsd/lib/libc/stdio/wsetup.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/abs.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/div.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/getenv.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/getsubopt.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/insque.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/imaxabs.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/imaxdiv.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/labs.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/ldiv.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/llabs.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/lldiv.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/lsearch.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/remque.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/setenv.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/tfind.c \
	bionic/libc/upstream-openbsd/lib/libc/stdlib/tsearch.c \
	bionic/libc/upstream-openbsd/lib/libc/string/memccpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcasecmp.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcasestr.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcoll.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strcspn.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strdup.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strndup.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strpbrk.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strsep.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strspn.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strstr.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strtok.c \
	bionic/libc/upstream-openbsd/lib/libc/string/strxfrm.c \
	bionic/libc/upstream-openbsd/lib/libc/string/wcslcpy.c \
	bionic/libc/upstream-openbsd/lib/libc/string/wcswidth.c

SRCS_CPP =

OBJS = $(SRCS_ASM:.S=.o)
OBJS += $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)

DEPS = $(OBJS:.o=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

%.o : %.S
	$(RELPWD) $(CC) $(AFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS) $(DEPS)	
