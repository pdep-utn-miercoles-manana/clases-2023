factorial :: Int -> Int
factorial 0 = 1
factorial n = n * (factorial (n - 1))

fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n - 1) + fibo (n - 2)

esVocal 'a' = True
esVocal 'e' = True
esVocal 'i' = True
esVocal 'o' = True
esVocal 'u' = True
esVocal  _  = False

esVocal' = flip elem "aeiou"

head' (x : _) = x
head'' ((:) x _) = x

tail' (_ : xs) = xs

null' [] = True
null'  _ = False

sum' []       = 0
sum' (n : ns) = n + sum' ns

product' []       = 1
product' (n : ns) = n * product' ns

concat' []         = []
concat' (xs : xss) = xs ++ concat' xss

and' []       = True
and' (x : xs) = x && and' xs

or' []       = False
or' (x : xs) = x || or' xs

length' []       = 0
length' (_ : xs) = 1 + length' xs

maximum' [x]            = x
maximum' (x : xs) = max x (maximum' xs)

foldr' :: (a -> b -> b)  -> b -> [a] -> b
foldr' _ valor [] = valor
foldr' op valor (x : xs) = op x (foldr' op valor xs)

-- foldl usa recursividad de cola

sum'' :: (Num a) => [a] -> a
sum'' xs = foldr' (+) 0

product'' :: (Num a) => [a] -> a
product'' xs = foldr' (*) 1

concat'' :: [[a]] -> [a]
concat'' xs = foldr' (++) []

and'' :: [Bool] -> Bool
and'' xs = foldr' (&&) True

or'' :: [Bool] -> Bool
or'' xs = foldr' (||) False

length'' :: [a] -> Int
length'' xs = foldr' (\_ acum -> 1 + acum) 0

maximum'' :: (Ord a) => [a] -> a
maximum'' (x : xs) = foldr' max x xs

-- T/N: fold = plegar
