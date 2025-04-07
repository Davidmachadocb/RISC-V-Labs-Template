#include<stdio.h>

extern void func(int* a, int* max);

int main(){
    int v[] = {100, 1, 2, 3, 421, 5, 6, 7, 8, -1}, max;
    func(v, &max);

    printf("Max value of array is %d\n", max);

    return 0;
}
