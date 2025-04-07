#include<stdio.h>

extern void func(char* s);

int main(){
    char s[]= "Hello";
    func(s);

    printf("%s\n", s);

    return 0;
}
