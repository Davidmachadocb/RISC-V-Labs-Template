#include<stdio.h>

extern void func(char* src, char* dst);

int main(){
    char src[] = "Hello";
    char dst[6];
    func(src, dst);

    printf("%s\n", dst);

    return 0;
}
