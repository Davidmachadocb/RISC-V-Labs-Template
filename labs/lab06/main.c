#include<stdio.h>

extern void func(int a, int op, int* result);

int main() {
    int arg = 42;
    int op = 0;
    int result = 0;

    func(arg, op, &result);
    printf("Pushed: %d\n", arg);

    arg = 12;
    func(arg, op, &result);
    printf("Pushed: %d\n", arg);

    op = 1;
    func(arg, op, &result);
    printf("Popped: %d\n", result);
    func(arg, op, &result);
    printf("Popped: %d\n", result);
    return 0;
}
