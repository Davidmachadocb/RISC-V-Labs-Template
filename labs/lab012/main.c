#include <stdio.h>

struct car {
    int color;
    int type;
    char *idString;
};

extern void num_to_string(struct car *c);  

int main() {
    struct car my_car = {2, 0, "Ferrari"};  // Red Supercar
    num_to_string(&my_car);  // Deve imprimir: "A [Red] [Supercar]!"
    return 0;
}