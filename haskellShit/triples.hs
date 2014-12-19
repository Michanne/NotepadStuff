trd (_,_,a) = a

dropWhile' _[] = []
dropWhile' bool xxs@(x:xs) =
	if bool x then dropWhile' bool xs else xxs

map' _[] = []
map' f (x:xs) = f x : map' f xs

addOneToi i = i + 1

last5 [] = []
last5 xxs@(_:xs)
	| length xxs <=5 = xxs
	| otherwise		 = last5 xs