import Data.List

fahrenheitACelsius :: Fractional a => a -> a
fahrenheitACelsius gradosFahr = (gradosFahr - 32) / 1.8

celsiusAFahrenheit :: Fractional a => a -> a
celsiusAFahrenheit gradosCels = gradosCels * 1.8 + 32

dispersion :: (Ord a, Num a) => a -> a -> a -> a
dispersion a b c = max3 a b c - min3 a b c

max3 :: Ord a => a -> a -> a -> a
max3 a b c = max a (max b c)

min3 :: Ord a => a -> a -> a -> a
min3 a b c = min a (min b c)

notasAlgoritmos :: [Float]
notasAlgoritmos = [9, 4, 6]

esNotaAprobada :: Float -> Bool
esNotaAprobada nota = nota >= 6

notasAprobadas :: [Float] -> [Float]
notasAprobadas = filter esNotaAprobada


tieneLongitudImpar palabra = mod (length palabra) 2 /= 0

masCuarenta = (+40)

porOcho = (*8)


funcionLoca unosNumeros = 
    (filter (100 >)) ((map ((+40).(*8))) unosNumeros)
--   --------------    ----------------  -----------
--         f                  g               x
--   --------------   ------------------------------ 
--         f                     y = g(x)

funcionLoca2 unosNumeros = 
    (filter (100 >) . map ((+40).(*8))) unosNumeros

funcionLoca3 = filter (100 >) . map ((+40).(*8))


funcionReloca :: (p -> Bool) -> (l -> p) -> ([l] -> [p])
funcionReloca         f             g     = (.) (filter f) (map g)

{-

    filter :: (k -> Bool) -> [k] -> [k]

    map    ::   (l -> m)  -> [l] -> [m]


    (.)    :: ( b  ->  c )  ->  ( a  ->  b ) -> ( a  ->  c )
              ([p] -> [p])  ->  ([l] -> [p]) -> ([l] -> [p])

    (.) (filter f) (map g) :: ([l] -> [p])

-}