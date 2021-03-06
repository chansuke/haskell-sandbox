module Nml (Nml, nml) where
import Data.Char (isSpace)
import Data.Tree (Tree(..))
import Data.List (unfoldr)

-- 開きタグ、閉じタグ、文字列
data Token = Open String | Close String | Text String deriving Show
token :: String -> Maybe (Token, String)
token "" = Nothing
token ('<' : '/' : s) = tag Close s
token ('<' : s) = tag Open s
token s | all isSpace tx = token r
        | otherwise = Just (Text tx, r)
        where (tx, r) = span (/= '<') s

tag :: (String -> Token) -> String -> Maybe (Token, String)
tag f s = case span (/= '>') s of
        (tg, _: r) -> Just (f tg, r)
        _ -> Nothing

type Nml = Tree String

parse :: [Token] -> Maybe (Nml, [Token])
parse (Open o: ts) = case parseL ts of
        (ns, Close c: r) | o == c -> Just (Node o ns, r)
        _ -> Nothing
parse (Text tx: ts) = Just (Node tx [], ts)
parse _ = Nothing

parseL :: [Token] -> ([Nml], [Token])
parseL ts = case parse ts of
        Nothing -> ([], ts)
        Just (n, r) -> (n: ns, r')
            where (ns, r') = parseL r

nml :: String -> Maybe Nml
nml = fmap fst . parse . unfoldr token

