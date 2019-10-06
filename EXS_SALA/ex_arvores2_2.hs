data Arvore = Folha | Galho Int Arvore Arvore
    deriving Show

--soma :: Arvore -> Int
--soma x = 

quantasFolhas :: Arvore -> Int
quantasFolhas Folha             = 1
quantasFolhas (Galho _ a1 a2)  = quantasFolhas a1 + quantasFolhas a2

alturaArvore :: Arvore -> Int
alturaArvore Folha              = 1
alturaArvore (Galho _ a1 a2)    = 1 + maior (alturaArvore a1) (alturaArvore a2)
    where
        maior :: Int -> Int -> Int
        maior x y = if x > y then x else y

espelho :: Arvore -> Arvore
espelho Folha           = Folha
espelho (Galho x a1 a2) = Galho x (espelho a2) (espelho a1)

soma :: Arvore -> Int
soma Folha              = 0
soma (Galho x a1 a2)    = x + (soma a1) + (soma a2)

dobra :: Arvore -> Arvore
dobra Folha             = Folha
dobra (Galho x a1 a2)   = Galho (2*x) (dobra a1) (dobra a2)

possui :: Arvore -> Int -> Bool
possui Folha _              = False
possui (Galho x a1 a2) y    =  x == y || (possui a1 y) || (possui a2 y)

possui2 :: Arvore -> Int -> Bool
possui2 Folha _             = False
possui2 (Galho x a1 a2) y   =  x == y || if y > x then (possui a2 y) else possui (possui a1 y)


maximo :: Arvore -> Int
maximo Folha            = 0
maximo (Galho x a1 a2)  = maximo a2

insere :: Arvore -> Int -> Arvore
insere Folha x              = Folha
insere (Galho x a1 a2) y    = x == y || if y > x then () 

a2 = Galho 4 (Galho 5 (Galho 6 Folha Folha) Folha) Folha
a1 =  Galho 1 (Galho 2 a2 Folha) (Galho 3 Folha Folha)

main = print $(quantasFolhas a1, alturaArvore a1, espelho a1, soma a1, dobra a1, possui a1 2, possui a1 9, possui2 2, maximo a1)