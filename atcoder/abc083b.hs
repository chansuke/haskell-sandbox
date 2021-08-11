calculate k = sum [read [c] | c <- show k]

main :: IO ()
main = do
  [n, a, b] <- map read . words <$> getLine
  print $ sum [k | k <- [1..n], calculate k >= a, calculate k <= b]

