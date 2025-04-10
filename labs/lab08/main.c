#include<stdio.h>

extern int fibo(int a);

int main(){
    int n=10, f_n;
    f_n = fibo(n);
    printf("f(%d) = %d\n", n, f_n);
    return 0;
}
