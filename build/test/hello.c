#include <stdio.h>

#ifdef DNAMIC_EXPLICIT
#include <dlfcn.h>
#else
extern void foo(void);
#endif

__attribute((constructor)) void before_main()
{
    printf("%s\n",__FUNCTION__);
}

__attribute((destructor)) void after_main()
{
    printf("%s\n",__FUNCTION__);
}

int main(int argc, const char * argv[])
{
    int i;

#ifdef DNAMIC_EXPLICIT
    void *handle;
    void (*handler_foo)(void);
#endif

	printf("argc = %d\n", argc);
	for (i = 0; i < argc; i++) {
		printf("argv[%d] = %s\n", i, argv[i]);
	}

#ifdef DNAMIC_EXPLICIT
    printf("explictly link libtest in running time!\n");

    handle = dlopen ("libtest.so", RTLD_NOW);
    if (!handle) {
        fprintf (stderr, "%s\n", dlerror());
        return 1;
    }

    handler_foo = dlsym(handle, "foo");
    if (NULL == handler_foo) {
        fprintf (stderr, "%s\n", dlerror());
        return 1;
    }

    handler_foo();

	dlclose(handle);

#else
    printf("implictly link libtest in running time!\n");
    foo();
#endif

    return 0;
}
