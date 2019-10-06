bandas :: [[String]]
bandas = [["Gilberto Gil"], ["Victor","Leo"],["Gonzagao"],["Claudinho","Bocheca"]]

musicas :: [(String, Int, Int)]

musicas = [("Aquele Abraco", 1,100), ("Esperando na Janela", 1, 150),("Borboletas", 2, 120),("Asa Branca", 3, 120),("Assum Preto", 3, 140),("Vem Morena", 3, 200),("Nosso Sonho", 4, 150),("Quero te Encontrar", 4, 100)]

first :: (String, Int, Int) -> String
first(x,y,z) = x 

duration(x,y,z) = z >= 120

let  a = 0
greater(x,y,z) if z > a 
    then a = z
    else a 

-- Apenas nomes das musicas
-- main = print(map first musicas)

-- Nomes músicas com >=2 minutos
-- main = print(map first (filter duration musicas))

-- Maior duração
main = print(greater musicas)


-- Nomes das músicas com >=2 minutos
-- main = print(filter duration musicas)

