#include <stdio.h>

typedef struct Add Add;
typedef struct Sub Sub;
typedef union Exp Exp;

union Exp{
    int num;
    Add add;
    Sub sub;
} exp;

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
/*    enum operacao {Num,Add,Sub};
    struct Exp {
        
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

    Exp e1;
    e1.num = 2;
    printf("%d",e1.Num);


    Exp e1 = Sub (Add (Num 1) (Num 2)) (Num 5);
*/


    return 0;

}