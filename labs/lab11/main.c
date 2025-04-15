#include<stdio.h>

extern void func(int n, int (*a)[2], int (*b)[2], int (*result)[2]);

int main(){
    int m = 2, n = 2;
    int m1[2][2] = { {1, 2}, {3, 4} }, 
        m2[2][2] = { {5, 6}, {7, 8} },
        result[2][2] = { {0, 0}, {0, 0} };
    func(n, m1,m2,result);
    for(int i = 0; i<n;i++){
        for(int j = 0; j<n;j++)
            printf("v[%d][%d]=%d\n",i,j,result[i][j]);
    }
    
    return 0;
}
