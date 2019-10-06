type Time = (String, (Int,Int,Int), (Int,Int))

brasil19 :: [ Time ] 
brasil19 = [("Corinthians",(8,7,2),(19,9)),("Goias",(6,3,8),(16,27)),("Flamengo",(11,3,3),(38,18)),("Gremio",(5,7,5),(20,21))]

-- 1
getNome :: Time -> String
getNome ((nm,(_,_,_),(_,_))) = nm

nomes :: [String]
nomes = (map getNome brasil19)

--2 
getPts :: (Int,Int,Int) -> Int
getPts (v,e,d) = 3*v+1*e+0*d

getNmPt :: Time -> (String, Int)
getNmPt(nm,ved,_) = (nm, getPts ved)

pontos:: [(String,Int)]
pontos = map getNmPt brasil19

--3
positivos :: [Time] -> [Time]
positivos tab = filter eh_pos tab

eh_pos :: Time -> Bool
eh_pos (_,_,(gp,gc)) = gp > gc

-- 4
maisN :: [Time] -> Int -> [String]
maisN times n = map getNome (filter g times) where
                    g :: Time -> Bool
                    g (_,ved,_) = getPts ved > n -- Esse n é vísivel pois está dentro da função
                                                 -- maisN, se estivesse fora não funcionaria. 

-- 5 
campeao :: (String, Int)
--campeao = foldr f ini tab
campeao = foldr f ("",0) pontos where
    f :: (String, Int) -> (String, Int) -> (String, Int) -- Vai dobrar o time do acumulador, com o time que ela receber, tem que ter o cuidado com a primeira dobra. 
    f (nmN, ptN) (nmA, ptA) = if ptN >= ptA then (nmN,ptN) else (nmA,ptA)

-- 6
mediaGols :: [Time] -> Float
mediaGols tab = (fromIntegral totGols) / totJogos where
                    totGols = foldr f 0 tab where
                                    f :: Time -> Int -> Int -- Os dois ultimos valores tem que ser iguais, pois é o acumulador e o que será o resultado final.
                                    f(_,_,(gp,_)) acc = gp + acc -- Ele sempre dobra o acumulador com os pontos.
                    totJogos = fromIntegral (getJogos(head tab)*(length tab))/2.0 where
                                getJogos :: Time -> Int
                                getJogos (_,(v,e,d),_) = v+e+d 

main = print (mediaGols brasil19)
