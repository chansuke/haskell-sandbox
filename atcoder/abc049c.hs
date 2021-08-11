main :: IO ()
main = do
  s <- getLine
  putStrLn $ replace $ s

replace ('m':'a':'e':'r':'d':xs) = replace xs
replace ('r':'e':'m':'a':'e':'r':'d':xs) = replace xs
replace ('e':'s':'a':'r':'e':xs) = replace xs
replace ('r':'e':'s':'a':'r':'e':xs) = replace xs
trim "" = "YES"
trim _ = "NO"
