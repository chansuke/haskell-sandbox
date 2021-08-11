import Data.List

main = do
  getLine
  as <- map read . words <$> getLine
  print $ sum $ zipWith (*) (cycle [1, -1]) $ reverse $ sort as
