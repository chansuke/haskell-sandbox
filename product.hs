import Data.List

productOdds :: Integer -> Integer
productOdds n = product $ filter (\x -> odd x) [1..2* n + 1]
