dupHead :: [a] -> [a]
dupHead xxs@(x: _) = x: x: xxs
dupHead [] = []
