import Control.Applicative (Alternative(..))
import Data.Maybe (listToMaybe, fromJust)
import Data.Char (isDigit, isSpace, digitToInt)

newtype Parse a = Parse { runParse :: String -> [(a, String)] }

succeed :: a -> Parse a
succeed v = Parse $ \inp -> [(v, inp)]

check :: (Char -> Bool) -> Parse Char
check p = Parse $ \inp -> case inp of
        c : cs | p c -> [(c, cs)]
        _ -> []

char :: Char -> Parse Char
char = check . (==)

instance Functor Parse where
      fmap f (Parse p) = Parse $ \inp -> [(f x, r) | (x, r) <- p inp]
instance Applicative Parse where
instance Alternative Parse where
      Parse p1 <|> Parse p2 = Parse $ \inp -> p1 inp ++ p2 inp
      empty = Parse $ \_ -> []
