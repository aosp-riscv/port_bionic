PRJPATH=.

include $(PRJPATH)/build/common.mk

SRCS_C = \
	$(SRCPATH_LIBC)/stdlib/atexit.c

SRCS_CPP = \
	$(SRCPATH_LIBC)/bionic/bionic_elf_tls.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_atfork.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_attr.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_barrier.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_cond.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_create.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_detach.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_equal.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_exit.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_getcpuclockid.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_getschedparam.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_gettid_np.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_internal.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_join.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_key.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_kill.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_mutex.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_once.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_rwlock.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_sigqueue.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_self.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_setname_np.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_setschedparam.cpp \
	$(SRCPATH_LIBC)/bionic/pthread_spinlock.cpp \
	$(SRCPATH_LIBC)/bionic/__cxa_thread_atexit_impl.cpp \
	$(SRCPATH_LIBC)/bionic/fork.cpp

OBJS = $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)
DEPS = $(OBJS:.o=.o.d)

INC_LOCAL = -Ibionic/libstdc++/include

CFLAGS_LOCAL =

CPPFLAGS_COMPILER += -Wold-style-cast

CFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

all : $(OBJS)
	@echo DONE!	

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

