brasil19 :: [(String, (Int,Int,Int), (Int,Int))] 
brasil19 = [("Corinthians",(8,7,2),(19,9)),("Goias",(6,3,8),(16,27)),("Flamengo",(11,3,3),(38,18)),("Gremio",(5,7,5),(20,21))]

getGols :: (String, (Int,Int,Int), (Int,Int)) -> (Int, Int)
getGols (nome, ved,gols) = gols

nome :: (String, (Int,Int,Int), (Int,Int)) -> String
nome ((nm,(_,_,_),(_,_))) = nm

--calcP :: (String, (Int,Int,Int), (Int,Int)) -> (String -> Int)
--calcP((nm,(v,e,_),(_,_))) = nm, v*3+e*1

calcP :: (String, (Int,Int,Int), (Int,Int)) -> [Int]
calcP((_,(v,e,_),(_,_))) = v*3+e*1

nomes :: [String]
nomes = (map nome brasil19)

maior :: (String, (Int,Int,Int), (Int,Int)) -> Bool
maior((_,(_,_,_),(x,y))) = x>y

positivos :: [(String, (Int,Int,Int), (Int,Int))] -> [(String, (Int,Int,Int), (Int,Int))]
positivos tabela = filter maior tabela 

--pontos :: [(String, (Int,Int,Int), (Int,Int))] -> [String, Int] 

--maisN :: [(String, (Int,Int,Int), (Int,Int))] -> Int -> [Int]
--maisN tabela x = filter (calcP>n) tabela 

--main = print(getGols(head brasil19))
--main = print(map calcP brasil19)
--main = print(positivos brasil19)

main = print(map calcP brasil19)



--http://www.toves.org/books/hslist/