#include <stdio.h>

extern void func(int* input, int* result);

int main() {

    char bin[] = "1011"; // 11 em decimal
    int result;

    func((int*)bin, &result);  
    
    printf("Resultado: %d\n", result); 
}
