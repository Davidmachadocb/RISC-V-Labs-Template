#include <stdio.h>

extern int ackermann(int m, int n);

int main() {
    int resultado = ackermann(1, 1); 
    printf("\nResultado = %d\n", resultado);
    return 0;
}
