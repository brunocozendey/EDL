#include <stdio.h>

v[][] = 

typedef struct Exp {
    enum{NUM,ADD,SUB} tag;
    union {
        int Num;
        struct Add
        {
            struct  Exp *e1;
            struct  Exp *e2;          
        } Add;
        
        struct Sub
        {
            struct  Exp *e1;
            struct  Exp *e2;          
        } Sub;
    };
}Exp;

typedef struct Cmd {
    enum{ATR,SEQ,CND} tag;
    union {
        struct Atr
        {
            char[20] String;
            struct  Exp *e1;          
        } Atr;
        
        struct Seq
        {
            struct  Cmd *c1;
            struct  Cmd *c2;          
        } Seq;
        struct Cnd
        {
            struct  Exp *e1;
            struct  Cmd *c1;
            struct  Cmd *c2;          
        } Seq;
    };
}Cmd;

int avalia (Exp e){
    if (e.tag == 0) return e.Num;
    else if (e.tag == 1) {
        return avalia(*e.Add.e1)+avalia(*e.Add.e2);
    }
    else {
        return avalia(*e.Add.e1)-avalia(*e.Add.e2);
    }

}

int main (void) {
    Exp exp1;
    Exp exp2;
    Exp exp3;
    
    Exp add;
    Exp sub;
    Exp e1;
    
    exp1.Num = 1;
    exp1.tag = NUM;
    exp2.Num = 2;
    exp2.tag = NUM;
    exp3.Num = 5;
    exp3.tag = NUM;
    

    add.Add.e1 = &exp1;
    add.Add.e2 = &exp2;
    add.tag = ADD;

    sub.Sub.e1 = &add;
    sub.Sub.e2 = &exp3;
    sub.tag = SUB;

    e1 = sub;
    
    printf(">>> %d\n",avalia(e1) );
    return 0;
}

/*
data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
e1 = Sub (Add (Num 1) (Num 2)) (Num 5)
avalia :: Expr -> Int
*/