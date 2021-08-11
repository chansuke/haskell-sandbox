luhndouble :: Int -> Int
luhndouble x | x * 2 > 9 = (x * 2) - 9
             | otherwise = x * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d | (luhndouble a  + b  + luhndouble c + d) `mod` 10 == 0 = True
             | otherwise = False
