longitud :: String -> Int
longitud = length

doble :: Int -> Int
doble x = 2 * x

edadNico :: Int
edadNico = 19

edadDeOtroNico :: Int
edadDeOtroNico = 20

inicialMarcelo :: Char
inicialMarcelo = 'M'

nombreIan :: String
nombreIan = "Ian"

estoEsPdep :: Bool
estoEsPdep = False

esPar :: Int -> Bool
esPar n = mod n 2 == 0
 
esLongitudPar :: String -> Bool
esLongitudPar  palabra = esPar (longitud palabra)
esLongitudPar' palabra = (esPar . longitud) palabra
esLongitudPar''        = (esPar . longitud)

esMultiploDe multiplo divisor =
  mod multiplo divisor == 0

