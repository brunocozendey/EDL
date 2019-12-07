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
medias turma = map media turma

notas1 :: [Float]
notas1 = map nota1 turma1

maior8 :: (String,Float,Float) -> Bool
maior8 (_,x,y) = (x >= 8) || (y >= 8)

oitos :: [ (String,Float,Float) ] -> [String]
oitos alunos = map nome (filter maior8 alunos)

mediasnota :: [Float] -> Float
mediasnota turma = (foldr (+) 0 turma) / (fromIntegral(length(turma)))   

notasp1 :: [ (String,Float,Float) ] -> [Float]
notasp1 turma = map nota1 turma

notasp2 :: [ (String,Float,Float) ] -> [Float]
notasp2 turma = map nota2 turma

somanota :: (String, Float, Float) -> Float
somanota (_,x,y) = x + y

menor5 :: [ (String,Float,Float) ] -> [Float]
menor5 turma = filter (\x -> x<=5) (foldr (\(s, f1, f2) acc -> f1:f2:acc) [] turma)

aprovado :: (String,Float,Float) -> String
aprovado a = if (media a) >= 5 then
                "(Aprovado)"
            else
                "(Reprovado)"

pretty :: [(String, Float, Float)] -> String
pretty turma = nome where
                nome = foldr (\(s,n1,n2) acc -> s++" "++show (media (s,n1,n2))++" "++aprovado (s,n1,n2)++"\n"++acc) "" turma


main = print $ (pretty turma1)
