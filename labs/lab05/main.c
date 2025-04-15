#include <stdio.h>

extern void func(char* str);

int main() {
    char str[] = "glenda";
    printf("Original: %s\n", str);

    func(str);

    printf("Reverso: %s\n", str);

    return 0;
}
