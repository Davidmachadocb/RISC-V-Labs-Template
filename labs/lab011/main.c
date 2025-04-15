#include <stdio.h>

extern void func(int* A, int* B, int* C, int m, int p, int n);

int main() {
    int A[2][2] = {
        {1, 2},
        {3, 4}
    };

    int B[2][2] = {
        {5, 6},
        {7, 8}
    };

    int C[2][2];  // Matriz resultado

    printf("Matriz A:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            printf("%d ", A[i][j]);
        }
        printf("\n");
    }

    printf("\nMatriz B:\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            printf("%d ", B[i][j]);
        }
        printf("\n");
    }

    func(&A[0][0], &B[0][0], &C[0][0], 2, 2, 2);

    printf("\nMatriz C (resultado de A * B):\n");
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            printf("%d ", C[i][j]);
        }
        printf("\n");
    }

    return 0;
}
