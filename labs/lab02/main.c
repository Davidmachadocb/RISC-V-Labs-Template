#include <stdio.h>

// Ponto de ligação com a função escrita em Assembly
extern void func(int* input, int* result);

int main() {
    int input, result;

    // 🔁 Aqui você pode trocar o valor para testar cada exercício
    input = 0b1101; // por exemplo, para contar bits 1

    func(&input, &result);

    printf("Número de bits 1 em %d = %d\n", input, result);
    return 0;
}
