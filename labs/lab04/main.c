#include <stdio.h>

extern int max_array(int* arr, int len);

int main() {
    int numeros[] = {14, 9, -3, 7, 15, -20, 8};
    int tamanho = sizeof(numeros) / sizeof(numeros[0]);

    int max = max_array(numeros, tamanho);
    printf("Maior elemento: %d\n", max);

    return 0;
}
