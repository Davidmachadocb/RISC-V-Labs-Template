#include<stdio.h>

extern void func(int* a, int* result);

int main(){

    // n_b = 4'b1010
    int n_b[] = {0, 1, 0, 1}, n_d;

    func(n_b, &n_d);
    printf("Result is: %d\n", n_d);
    return 0;
}
