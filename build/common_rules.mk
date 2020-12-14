OBJS = $(SRCS_ASM:.S=.o)
OBJS += $(SRCS_C:.c=.o)
OBJS += $(SRCS_CPP:.cpp=.o)
OBJS += $(SRCS_CC:.cc=.o)

OUTPUT_OBJS = $(addprefix $(OBJ_DIR)/,${OBJS})
OUTPUT_DEPS = $(OUTPUT_OBJS:.o=.o.d)

%.o : %.cpp
	@OUTPUT_DIR=`dirname $(OBJ_DIR)/$@`; if [ ! -e $$OUTPUT_DIR ]; then mkdir -p $$OUTPUT_DIR; fi
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(OBJ_DIR)/$@.d -o $(OBJ_DIR)/$@ $<

%.o : %.cc
	@OUTPUT_DIR=`dirname $(OBJ_DIR)/$@`; if [ ! -e $$OUTPUT_DIR ]; then mkdir -p $$OUTPUT_DIR; fi
	$(RELPWD) $(CPP) $(CPPFLAGS) -MD -MF $(OBJ_DIR)/$@.d -o $(OBJ_DIR)/$@ $<

%.o : %.c
	@OUTPUT_DIR=`dirname $(OBJ_DIR)/$@`; if [ ! -e $$OUTPUT_DIR ]; then mkdir -p $$OUTPUT_DIR; fi
	$(RELPWD) $(CC) $(CFLAGS) -MD -MF $(OBJ_DIR)/$@.d -o $(OBJ_DIR)/$@ $<

%.o : %.S
	@OUTPUT_DIR=`dirname $(OBJ_DIR)/$@`; if [ ! -e $$OUTPUT_DIR ]; then mkdir -p $$OUTPUT_DIR; fi
	$(RELPWD) $(CC) $(AFLAGS) -MD -MF $(OBJ_DIR)/$@.d -o $(OBJ_DIR)/$@ $<

.PHONY : dumpobjs
dumpobjs:
	@echo $(OUTPUT_OBJS) >> ${PATH_DUMPOBJS}

.PHONY : clean
clean:
	$(RM) $(OUTPUT_OBJS)
	$(RM) $(OUTPUT_DEPS)
