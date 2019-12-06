xs :: [Int]
xs = [1,2,3,4]

duplica :: Int -> Int
duplica x = x*2

-- MAP
ys :: [Int]
ys = map duplica xs



maior2 :: Int -> Bool
maior2 n = n>2


--FILTER
zs :: [Int]
zs = filter maior2 xs


n :: Int
-- FOLDR : Soma todos os elementos de xs
n = foldr (+) 0 xs

soma :: [Int] -> Int
soma vs = foldr (+) 0 vs

m :: Int
m = soma xs

ehpar :: Int -> Bool
ehpar n =   if n `mod` 2 == 0 then 
                True
            else False 

pares :: [Int]
pares = filter ehpar xs 

inc :: Int -> Int
inc x = x + 1

incs :: [Int]
incs = map inc xs

dups :: [Int]
dups = map duplica xs

maiorq :: Int -> Int -> Int
maiorq x y = if x> y then
                x
            else 
                y


maior :: [Int] -> Int
maior (x:xs) = foldr maiorq x xs

menorq :: Int-> Int -> Int
menorq x y =    if x < y then
                    x
                else 
                    y

menor :: [Int] -> Int
menor (x:xs)= foldr menorq x xs

main = print $ (menor xs)


