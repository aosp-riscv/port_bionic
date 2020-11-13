
#include <errno.h>
#include <malloc.h>
#include <string.h>
#include <unistd.h>

extern "C" int __getcwd(char* buf, size_t size);

/*
int func()
{
    char * b = NULL;
    int rc = __getcwd(b, 100);
   0:   06400593                li      a1,100
   4:   4501                    li      a0,0
   6:   00000317                auipc   t1,0x0
   a:   00030067                jr      t1 # 6 <_Z4funcv+0x6>
*/
int func()
{
    char * b = NULL;
    int rc = __getcwd(b, 100);
    return rc;
}