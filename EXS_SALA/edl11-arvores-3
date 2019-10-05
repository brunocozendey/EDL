data Arvore = Galho Arvore Arvore | Folha Int
  deriving Show

soma :: Arvore -> Int
soma (Folha x)      = x
soma (Galho a1 a2)  = soma a1 + soma a2

dobra :: Arvore -> Arvore
dobra (Folha x)     = Folha (2*x)
dobra (Galho a1 a2) = Galho (dobra a1) (dobra a2)

possui :: Arvore -> Int -> Bool
possui (Folha x) y = y == x
possui (Galho a1 a2) y = possui a1 y || possui a2 y

a0 = Galho a1 (Folha 1)
a1 = Galho a2 a3
a2 = Galho (Folha 6) (Folha 7)
a3 = Galho (Folha 8) (Folha 9)

main = print $ (a0, soma a0, dobra a0, possui a1 2, possui a1 9)
