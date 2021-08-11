-- 型定義
intToArray :: Int -> Int -> [Int]
-- 関数定義
intToArray i l = take l (repeat i)

main :: IO ()
main = do
  print (intToArray 3 4) -- [3, 3, 3, 3]
  print (intToArray 500 12.0999)
