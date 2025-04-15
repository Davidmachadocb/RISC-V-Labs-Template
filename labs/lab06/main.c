#include <stdio.h>

// a0 = 0 → push
// a0 = 1 → pop
extern int stack_operation(int op, int value);

int main() {
    // Push de alguns valores
    stack_operation(0, 10);  // push 10
    stack_operation(0, 20);  // push 20
    stack_operation(0, 30);  // push 30

    // pop e impressão
    int x = stack_operation(1, 0);  // pop
    printf("Valor retirado: %d\n", x);

    x = stack_operation(1, 0);
    printf("Valor retirado: %d\n", x);

    return 0;
}
