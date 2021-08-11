main :: IO ()
main = do
  s <- getLine
  putStr $ show $ length $ filter (== '1') s
