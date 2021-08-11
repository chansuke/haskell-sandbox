{-# LANGUAGE ScopedTypeVariables #-} -- GHCの言語拡張有効に
import Control.Exception

main :: IO ()
main =
  (readFile "dummyFileName" >>= putStrLn)
    `catch`
  (\(e :: SomeException) ->
    putStrLn $ "readFile failure!!! : " ++ displayException e)
    `finally`
  (putStrLn "finallization")
