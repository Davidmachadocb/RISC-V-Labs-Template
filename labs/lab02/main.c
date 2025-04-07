#include<stdio.h>

extern void func(int* a, int* result);

int main(){
    int input=0b101010, count=0;
    func(&input, &count);
    
    printf("count is: %d\n", input, count);
    
    return 0;
}