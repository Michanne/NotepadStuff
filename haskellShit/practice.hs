import Data.List

-- Practice #1 List Comprehension
boomBang xs = [ if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = let 
		smallerSorted 	= quicksort $ filter (<= x) xs
		biggerSorted	= quicksort $ filter ( > x) xs
	in smallerSorted ++ [x] ++ biggerSorted

pruneSort :: (Ord a) => [a] -> [a]
pruneSort = nub . quicksort
	
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

largestDiv :: (Integral a) => a
largestDiv = head $ filter p [100000, 99999..]
	where p x = x `mod` 3829 == 0
	
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
	| even n = n:chain (n `div` 2)
	| odd n  = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length $ filter isLong $ map chain [1..100]
	where isLong xs = length xs > 15