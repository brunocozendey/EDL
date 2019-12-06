iniciais :: String -> String -> String
iniciais nome sobrenome = [n] ++ ". " ++ [s] ++ "."
    where   (n:_) = nome
            (s: _) = sobrenome


main = print (iniciais "Bruno" "Cozendey")