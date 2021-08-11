import qualified Data.Vector as V

main :: IO ()
main = do
  let animals = V.fromList ["Dog", "Pig", "Cat", "Human"]

  print . V.sum . V.map length $ animals
