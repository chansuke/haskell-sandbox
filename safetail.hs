safetail :: [a] -> [a]
safetail x = if null x then [] else tail x
