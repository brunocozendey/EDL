lista = [1,2,3]
tupla = (1,2,3)

prim3 :: (Int, Int, Int) -> Int
prim3 (x,y,z) = x

main = print(prim3 tupla)