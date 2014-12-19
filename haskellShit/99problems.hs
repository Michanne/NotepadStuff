
-- Problem #1: find the last element of a list
myLast :: [a] -> a
myLast [] 		= error "Cannot into empty list"
myLast [x] 		= x
myLast (_:xs) 	= myLast xs

-- Problem #2: find the last but one element of a list
myLastButOne :: [a] -> a
myLastButOne [] 	= error "Cannot into empty list"
myLastButOne [x,_]	= x
myLastButOne (_:xs) = myLastButOne xs

-- Problem #3: find the K'th element of a list starting from elem 1
elementAt :: [a] -> Int -> a
elementAt (x:_) 1 	= x
elementAt (_:xs) i 	= elementAt xs (i-1)
elementAt _ _ 		= error "Index out of bounds"

-- Problem #4: find the number of elements in a list
myLength :: [a] -> Int
myLength [] 	= error "Cannot into empty list"
myLength [x] 	= 1
myLength (x:xs) = 1 + myLength xs

-- Problem #5: reverse a list
myReverse :: [a] -> [a]
myReverse [] 		= error "Cannot into empty list"
myReverse [x,y] 	= [y,x]
myReverse (x:xs) 	= myReverse xs ++ [x]

-- Problem #6: evaluate whether a list is palindrome
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] 		= error "Cannot into empty list"
isPalindrome xxs@(x:xs) = myReverse xxs == xxs

-- Problem #7: flatten a nested list
data NestedList a = Elem a | List [NestedList a]
flatten :: NestedList a -> [a]
flatten (Elem x		) = [x]
flatten (List (x:xs)) = flatten x ++ flatten (List xs)
flatten (List []	) = []

-- Problem #8: eliminate consecutive duplicates of list elements
compress :: Eq a => [a] -> [a]
compress [] 	= error "Cannot into empty list"
compress (x:ys@(y:_))
	| x == y 	= compress ys
	| otherwise = x : compress ys
compress ys = ys

-- Problem #9: pack consecutive duplicates of list elements into sublists
-- dont understand
pack :: Eq a => [a] -> [[a]]
pack [] 	= []
pack [x] 	= [[x]]
pack (x:xs)
	| x == head h_p_xs 			= (x:h_p_xs):t_p_hs
	| otherwise					= [x]:p_xs
	where p_xs@(h_p_xs:t_p_hs) 	= pack xs

-- Problem #10: run-length encode a list
encode :: Eq a => [a] -> [(Int, a)]
encode [] = []
encode (x:xs) = (encode' 1 x xs) where
	encode' n x [] = [(n, x)]
	encode' n x (y:ys)
		| x == y	= encode' (n+1) x ys
		| otherwise = (n, x) : encode' 1 y ys
		
-- Problem #11: modified run-length encode a list
data Coden a = Multiple Int a | Single a deriving (Show)
encodeM :: Eq a => [a] -> [Coden a]
encodeM [] = []
encodeM (x:xs) = (encode' 1 x xs) where
	encode' n x [] = [Single x]
	encode' n x (y:ys)
		| x == y	= encode' (n+1) x ys
		| n == 1	= Single x : encode' 1 y ys
		| otherwise = Multiple n x : encode' 1 y ys
		
-- Problem #12: decode a run-length encoded list
decode :: [Coden a] -> [a]
decode [] = []
decode (x:xs) = decode' x ++ decode xs where
	decode' (Single x) 		= [x]
	decode' (Multiple 1 x) 	= [x]
	decode' (Multiple n x) 	= replicate n x
	
-- Problem #14: duplicate the elements of a list
dupe :: [a] -> [a]
dupe [] = []
dupe (x:xs) = dupe' x ++ dupe xs where
	dupe' x = [x,x]

-- Problem #15: replicate the elements of a list N times
dupeM :: [a] -> Int -> [a]
dupeM [] _ = []
dupeM xxs@(_:_) 1 = xxs
dupeM (x:xs) n = dupeM' x n ++ dupeM xs n where
	dupeM' x 1 = [x]
	dupeM' x n = x : dupeM' x (n-1)
	
-- Problem #16: drop every N'th element from a list
dropEvery :: [a] -> Int -> [a]
dropEvery [] _ 			= []
dropEvery xxs@(_:_) 0 	= xxs
dropEvery xxs@(_:_) n 	= drop' xxs n where
	drop' [] _ 		= []
	drop' (x:xs) 1 	= [] ++ dropEvery xs n
	drop' (x:xs) y 	= x : drop' xs (y-1)
	
-- Problem #17: split a list into two parts, whose first part has N length
split :: [a] -> Int -> ([a], [a])
split [] _ 			= ([], [])
split xxs@(x:xs) n
	| n > 0			= (x : ys, zs)
	| otherwise 	= ([], xxs)
	where (ys, zs) 	= split xs (n-1) 
	
