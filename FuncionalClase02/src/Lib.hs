module Lib where

import Text.Show.Functions

longitud :: String -> Int
longitud = length

tieneLongitudPar :: (String -> Bool)
tieneLongitudPar = esMultiploDe 2 . longitud

esMultiploDe :: Int -> Int -> Bool
esMultiploDe multiplo multiplicador = mod multiplo multiplicador == 0

composicion :: (b -> c) -> (a -> b) -> (a -> c)
composicion f g x = f (g x)  -- es la funcion (.) definida por nosotros

darVuelta :: (a -> b -> c) -> b -> a -> c
darVuelta f a b = f b a      -- es la funcion flip definida por nosotros

  