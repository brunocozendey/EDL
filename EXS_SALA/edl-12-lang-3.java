class void Exp{
    abstract class avalia(){
        avalia :: Exp -> Int
    }
}

class Num extends Exp{
    int num;
}

class Add extends Exp{
    Exp e1, e2;
    int avalia (){return num;}
}

class Sub extends Exp{
    Exp e1,e2;
}