#include<stdio.h>

extern int func(int m, int n);

int main(){
    int m=4, n=1, f;
    f = func(m, n);
    printf("A(%d, %d) = %d\n", m, n, f);
    return 0;
}
