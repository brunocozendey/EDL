-- Crie uma função que recebe um Cmd e retornar um valor *final* da var "main"
-- main = print (1+3*2)

avaliaProg :: Cmd -> int
avaliaProg prog = avalia mem' (Var "main") where
                    mem' = avaliaCmd [] prog -- o [] é considerando uma memória vazia 