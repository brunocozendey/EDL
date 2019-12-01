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

notasp1p2 :: [ (String,Float,Float) ] -> [Float]
notasp1p2 turma = map somanota turma

todas :: [ (String,Float,Float) ] -> (Float, Float, Float)
todas turma = ( (mediasnota (notasp1 turma)), (mediasnota (notasp2 turma)), (mediasnota (notasp1p2 turma)))

menor5 :: (String, Float, Float) -> Bool
menor5 (_, x, y) =  (x <= 5) || (y <= 5)    

notas1e2 :: (String, Float, Float) -> [Float]
notas1e2 (_,n1, n2) = if n1 <= 5 then
                        if n2<= 5 then
                            [n1,n2]
                        else
                            [n1]
                    else 
                        if n2 <= 5 then
                            [n2]
                        else []

baixas :: [(Float, Float)]
baixas = map teste2 (filter menor5 turma1)

teste2 :: (String, Float, Float) -> (Float, Float)
teste2(_,f1,f2) = (f1,f2)

tto :: (Float, Float) -> [Float]
tt0 (f1,f2) = f1:f2

merge :: [(Float, Float)] -> [Float]
merge list = map tt0 [] list


main = print $ (merge baixas)
