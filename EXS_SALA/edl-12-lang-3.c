#include <stdio.h>

int main(){

    struct Exp {
        enum {Num,Add,Sub} type;
        union {
            int num;
            Add add;
            Sub sub;
        } value;
    };

    struct Sub
    {
        Exp ex0;
        Exp ex1;
    }; 

    struct Add
    {
        Exp ex0;
        Exp ex1;
    };

    Exp Num;

    Exp e1 = Sub (Add (Num 1) (Num 2)) (Num 5);


    return 0;

}