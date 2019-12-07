bandas :: [[String]]
bandas = [ ["Gilberto Gil"],
           ["Victor","Leo"],
           ["Gonzagao"],
           ["Claudinho","Bochecha"] ]

musicas :: [(String, Int, Int)]
musicas = [ ("Aquele Abraco",       1, 100),
            ("Esperando na Janela", 1, 150),
            ("Borboletas",          2, 120),
            ("Asa Branca",          3, 120),
            ("Assum Preto",         3, 140),
            ("Vem Morena",          3, 200),
            ("Nosso Sonho",         4, 150),
            ("Quero te Encontrar",  4, 100) ]


nomesMusicas :: [String]
nomesMusicas = map (\(s,_,_) -> s)  musicas

mais2min :: [(String, Int, Int)]
mais2min = filter (\(_,_,t) -> t>=120) musicas

maiorDuracao :: Int
maiorDuracao = foldr (\(x) t -> if (x > t) then x else t ) 0 (map (\(_,_,t) -> t ) musicas)

musicasMais2Min :: [String]
musicasMais2Min = map (\(s,_,_) -> s) mais2min

artista :: Int -> [String]
artista i = bandas !! (i-1)

formata :: (String, Int, Int) -> String -> String
formata (n,b,d) acc = "Nome:"++n++" Autores:"++nome_artista++" Duracao:"++show d++"\n"++acc where
                            nome_artista = if tam == 1 then
                                        head nome
                                    else 
                                        (head nome) ++", "++(last nome)
                            tam = length(nome)
                            nome = artista b
                                        
pretty :: String
pretty = foldr formata "" musicas
                              
                    


main = print $ (pretty)