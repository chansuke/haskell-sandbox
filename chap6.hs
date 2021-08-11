merge :: Ord a => [a] -> [a] -> [a]
merge a [] = a
merge [] a = a
merge (a:as) (b:bs)
  | a < b = a : merge as (b:bs)
  | otherwise = b: merge bs (a:as)

halve :: [a] -> ([a], [a])
halve xs = splitAt ((length xs) `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge (msort left) (msort right)
  where
    (left, right) = halve xs

sum :: [a] -> a
sum = foldr (+) 0

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' n (x:xs) = x : take' (n - 1) xs

last' :: [a] -> a
last' [x] = x
last' (x:xs) = last' xs
