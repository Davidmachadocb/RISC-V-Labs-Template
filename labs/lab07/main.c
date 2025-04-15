#include <stdio.h>

extern void bubble_sort(char* arr, int len);

int main() {
    char arr[] = {5, 3, 7, -1, 0, 2};  // array de signed char
    int len = sizeof(arr) / sizeof(arr[0]);

    bubble_sort(arr, len);  // chamada da função em assembly

    printf("Array ordenado: ");
    for (int i = 0; i < len; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
