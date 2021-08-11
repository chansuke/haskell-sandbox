main :: IO ()
main = do
  let abs n | n >= 0 = n
            | otherwise = -n
