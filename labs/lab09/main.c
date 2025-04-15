#include <stdio.h>

extern int printlen(char* str);

int main() {
    char mensagem[] = "Oi, Glenda!";
    int len = printlen(mensagem);
    printf("Comprimento: %d\n", len);
    return 0;
}
