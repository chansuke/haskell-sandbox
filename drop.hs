-- 型定義
-- 1. 整数(Int)
-- 2. カリー化
-- 3. 読みやすさ
-- 4. 多相化
drop :: Integer b => b -> [a] -> [a]
-- 場合分け
drop :: Int -> [a] -> [a]
drop 0 xs     = xs
drop _ []     = []
drop n (_:xs) = drop (n-1) xs


