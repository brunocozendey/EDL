-- Repetição em haskell, implementando em expressao

avaliaCmd mem(Rep cnd corpo) = 
    if avaliaExp mem cnd == 0 then
        mem
    else 
        avaliaCmd mem'(Rep cnd corpo)
            where 
                mem' = avaliaCmd mem corpo
        