#include<stdio.h>

struct car{
    int color;      // 4 bytes
    int type;       // 4 bytes
    char *idstring; // min: 1 byte
};

extern void func(struct car *c);

int main(){
    struct car mycar;
    mycar.color = 3;
    mycar.type  = 0;
    
    func(&mycar);    
    return 0;
}
