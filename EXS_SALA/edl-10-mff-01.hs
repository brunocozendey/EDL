xs :: [Int] -- isso é um valor
xs = [1,2,3,4]

isPar :: Int -> Bool
isPar(x) = x `mod` 2 == 0 

pares :: [Int] -- valores pares
pares = (filter isPar xs)

increment :: Int -> Int
increment(x) = x+1 

incs :: [Int]
incs = (map increment xs)

dup :: Int -> Int
dup(x) = x*2

duplicated :: [Int]
duplicated = (map dup xs)

greater:: Int -> Int -> Int
greater x y = if x>y then 
    x
    else
        y

maior :: Int
maior = foldr greater (last xs) xs

lower:: Int -> Int -> Int
lower x y = if x<y then 
    x
    else
        y

menor :: Int
menor = foldr lower (last xs) xs

main = print(menor)

