#include <stdio.h>

extern void fibonacci(int n, int* array);

int main() {
    int N = 6;
    int fib[100]; // tamanho suficiente para testes

    fibonacci(N, fib);

    printf("Fibonacci até %d termos:\n", N);
    for (int i = 0; i < N; i++) {
        printf("%d ", fib[i]);
    }
    printf("\n");

    return 0;
}
