PRJPATH = .

include $(PRJPATH)/build/common.mk

INC_LOCAL = \
	-Ibionic/libstdc++/include \
	-Ibionic/libc/system_properties/include \
	-Ibionic/libc/system_properties \
	-Isystem/core/property_service/libpropertyinfoparser/include

CFLAGS_LOCAL =

CPPFLAGS += \
	$(INC_LOCAL) \
	$(INC_LIBC) \
	$(CFLAGS_COMMON_GLOBAL) \
	$(INC_COMMON_GLOBAL) \
	$(CFLAGS_LIBC) \
	$(CFLAGS_LOCAL) \
	$(CPPFLAGS_COMPILER) \
	$(CFLAGS_NOOVERRIDECLANGGLOBAL)

SRCS_C =

SRCS_CPP = \
	bionic/libc/system_properties/context_node.cpp \
	bionic/libc/system_properties/contexts_split.cpp \
	bionic/libc/system_properties/contexts_serialized.cpp \
	bionic/libc/system_properties/prop_area.cpp \
	bionic/libc/system_properties/prop_info.cpp \
	bionic/libc/system_properties/system_properties.cpp

OBJS = $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)
DEPS = $(OBJS:.o=.o.d)

%.o : %.cpp
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

%.o : %.c
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(PRJPATH)/$@.d -o $(PRJPATH)/$@ $<
	mv $@ $(PRJPATH)/$(OBJ_DIR)/
	mv $@.d $(PRJPATH)/$(OBJ_DIR)/

all : $(OBJS)
	@echo DONE!

.PHONY : clean
clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)
