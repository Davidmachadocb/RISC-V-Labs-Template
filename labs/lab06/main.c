#include<stdio.h>

#define POP 0
#define PUSH 1

extern void func(int a, int op, int* result);

int main() {
    int arg = 42;
    int result = 0;

    func(arg, PUSH, &result);
    printf("Pushed: %d\n", arg);

    arg = 12;
    func(arg, PUSH, &result);
    printf("Pushed: %d\n", arg);

    func(arg, POP, &result);
    printf("Popped: %d\n", result);
    
    func(arg, POP, &result);
    printf("Popped: %d\n", result);

    return 0;
}
