turma1 :: [ (String,Float,Float) ]
turma1 = [ ("Joao",7.5,3.5), ("Maria",10.0,8.0), ("Jose",5.0,3.0)]

nome :: (String,Float,Float) -> String
nome (nm,_,_) = nm

nota1 :: (String,Float,Float) -> Float
nota1 (_,n1,_) = n1

nota2 :: (String,Float,Float) -> Float
nota2 (_,_,n2) = n2

media :: (String,Float,Float) -> Float
media aluno = ((nota1 aluno) + (nota2 aluno)) / 2

medias :: [ (String,Float,Float) ] -> [Float]
medias turma1 = map media turma1

notas1 :: [Float]
notas1 = (map nota1 turma1)

greater8 :: (String,Float,Float) -> Bool
greater8(x,y,z) = ((y >= 8.0) || (z >= 8.0))

--oitos :: [(String,Float,Float)] -> [(String)]
oitos = map nome (filter greater8 turma1)

teste :: [Float] -> Float
teste = foldl (+) notas1

--todas :: [ (String,Float,Float) ] -> (Float, Float, Float)
--todas turma = foldl

--main = print(medias turma1)        
--main = print(notas1)
--main = print(oitos)
main = print(teste)