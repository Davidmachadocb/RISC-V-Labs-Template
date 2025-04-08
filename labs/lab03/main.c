#include <stdio.h>

extern void func(char* input, int* result);

int main() {

    char bin[] = "010010"; //
    int result;

    func(bin, &result);
    
    printf("Resultado: %d\n", result); 
}
