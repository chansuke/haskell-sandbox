import Text.Read (readMaybe)

displayAge maybeAge =
    case maybeAge of
        Nothing -> putStrLn "You provided invalid number"
        Just age -> putStrLn $ "In 2021, you will be: " ++ show age

yearToAge year = 2021 - year

main = do
    putStrLn "Please enter your birth year"
    yearString <- getLine
    let maybeAge = do
          yearInteger <- readMaybe yearString
          return $ yearToAge yearInteger
    displayAge maybeAge
