PRJPATH = .

include $(PRJPATH)/build/common.mk

INC_LOCAL =

CFLAGS_LOCAL = -fno-stack-protector

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS = bionic/libc/bionic/libc_init_static.cpp

OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/out/
	mv $@.d $(PRJPATH)/out/

all : $(OBJS)
	@echo DONE!	

.PHONY : clean
clean:
	$(RM) $(OBJS) $(DEPS)
