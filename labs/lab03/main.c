#include <stdio.h>

extern void func(int* input, int* result);

int main() {

    char bin[] = "010010"; //
    int result;

    func((int*)bin, &result);  
    
    printf("Resultado: %d\n", result); 
}
