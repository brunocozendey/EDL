import Debug.Trace

type Amb = String -> Int

-------------------------------------------------------------------------------

data Exp = Num Int
         | Add Exp Exp
         | Sub Exp Exp
         | Var String
  deriving Show

avaliaExp :: Amb -> Exp -> Int
avaliaExp amb (Num v)     = v
avaliaExp amb (Add e1 e2) = (avaliaExp amb e1) + (avaliaExp amb e2)
avaliaExp amb (Sub e1 e2) = (avaliaExp amb e1) - (avaliaExp amb e2)
avaliaExp amb (Var id)    = amb id

-------------------------------------------------------------------------------

data Cmd = Atr String Exp
         | Seq Cmd Cmd
         | Cnd Exp Cmd Cmd
         | Rep Exp Cmd
  deriving Show

avaliaCmd :: Amb -> Cmd -> Amb
avaliaCmd amb (Atr id exp) = (\x -> if x==id then v
                                             else amb x)
                             where v = avaliaExp amb exp

avaliaCmd amb (Seq c1 c2)  = avaliaCmd amb' c2
                             where amb' = avaliaCmd amb c1


avaliaCmd amb (Cnd exp cmd0 cmd1) = if (avaliaExp amb exp) /= 0 then
                                        avaliaCmd amb cmd0
                                    else
                                        avaliaCmd amb cmd1   

avaliaCmd amb (Rep exp cmd) = if (avaliaExp amb exp) /= 0 then
                                    avaliaCmd amb (Rep exp cmd)
                                else 
                                    amb
                    
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
amb0 :: Amb
amb0 id = 0

prog :: Cmd
prog = Seq ( Rep )

main = print ((avaliaCmd amb0 prog) "x")