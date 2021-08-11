main :: IO ()
main = do
  print "Who is email for"
  recipient <- getLine
  print "What is title"
  title <- getLine
  print "Who is Author"
  author <- getLine
  print ("Dear" ++recipient++ ",\n" ++ "Thanks for buying " ++ title ++ "\nthanks,\n" ++ author)
