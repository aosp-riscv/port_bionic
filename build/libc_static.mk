PRJPATH = .

include $(PRJPATH)/build/common.mk

OBJS = $(wildcard $(OBJ_DIR)/*.o)

all : $(OBJS)
	@rm -f $(LIB_DIR)/static/libc.a && llvm-ar crsD -format=gnu $(LIB_DIR)/static/libc.a $(OBJS)

.PHONY : clean
clean:
	$(RM) $(LIB_DIR)/static/libc.a
