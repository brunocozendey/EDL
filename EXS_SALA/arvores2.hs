data Arvore a = Galho a [Arvore a] | Folha
    deriving Show

x = Galho 20 [Galho 1 [Folha, Folha, Folha, Folha],Folha]
y = Galho 2 [Folha]
z = Galho 30 [Folha, Galho 3 [Folha]]

a1 = Galho 10 [x, y, z, Folha]

nfolhas :: Arvore a -> Int
nfolhas Folha           = 1
nfolhas (Galho _ xs)  = foldr f 0 xs where -- No fold o tipo de f e o q esta dentro da lista e o final e o que eu quero, que geralmente e um tipo difrente
        f :: Arvore a -> Int -> Int
        f x acc = nfolhas x + acc -- E o tipo mais complicado de recursao, pois e feito na parte de fora. 



        
main = print $ nfolhas a1