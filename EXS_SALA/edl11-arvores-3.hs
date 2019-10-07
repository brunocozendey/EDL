data Arvore = Galho Arvore Arvore | Folha Int
  deriving Show

soma :: Arvore -> Int
soma (Folha x)      = x
soma (Galho a1 a2)  = soma a1 + soma a2

dobra :: Arvore -> Arvore
dobra (Folha x)     = Folha (2*x)
dobra (Galho a1 a2) = Galho (dobra a1) (dobra a2)

possui :: Arvore -> Int -> Bool
possui (Folha x) y      = y == x
possui (Galho a1 a2) y  = possui a1 y || possui a2 y

possui2 :: Arvore -> Int -> Bool
possui2 (Folha x) y       =  if y < x then False else x == y --else (possui2 a1) y || (possui2 a2) y
possui2 (Galho a1 a2) y   = possui2 a1 y || possui2 a2 y  

--maximo :: Arvore -> Int
--maximo Folha            = 0
--maximo (Galho x a1 a2)  = maximo a2

--insere :: Arvore -> Int -> Arvore
--insere Folha x              = Folha
--insere (Galho x a1 a2) y    = x == y || if y > x then () 

a0 = Galho (Folha 1) a1 
a1 = Galho a2 a3
a2 = Galho (Folha 6) (Folha 7)
a3 = Galho (Folha 2) (Folha 9)

main = print $ (a0, soma a0, dobra a0, possui a0 2, possui a0 9, possui2 a0 2)
