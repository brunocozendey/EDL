#include <stdio.h>

typedef struct Add Add;
typedef struct Sub Sub;
typedef union Exp Exp;

struct Exp{
    int tag;
    union{
        int num;
        struct {
            struct Exp* e1;
            struct Exp* e2;
            {
                /* data */
            };
            
            {
                /* data */
            };
            
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

int main(){

    Exp e1 = 2;
    Exp e2 = 5;
    Exp e3 = 1;

    mul = Exp {MUL, &e1 , &e2};
    add = Exp {ADD, &e3, &mul};
    return 0;

}