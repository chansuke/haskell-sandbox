module Main where

import Nginx

main :: IO ()
main = runConf $ do
  http $ do
    server $ do
      location "/" $ do
        listen "*:80"
        index "index.html"
