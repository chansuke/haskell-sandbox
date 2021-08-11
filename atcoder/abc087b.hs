main :: IO ()
main = do
  a <- readLn
  b <- readLn
  c <- readLn
  x <- readLn

  print $ length [() | a <- [0..a], b <- [0..b], c <- [0..c], 50 * c + 100 * b + 500 * a == x]
