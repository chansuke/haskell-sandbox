module Main where

import Control.Exception (bracket, finally)
import Control.Monad (forM_)
import System.IO
  ( stdout, Handle, FilePath, IOMode(..)
  , openFile, hClose, hIsEOF, hGetLine, hPutStrLn
  )

import System.Environment (getArgs)
import Data.Char (toUpper)

main :: IO ()
main = do
  filePaths <- getArgs
  concatMultiFiles filePaths stdout

concatMultiFiles :: [FilePath] -> Handle -> IO ()
concatMultiFiles filePaths dst =
  forM_ filePaths $ \filePath ->
    bracket
      (openFile filePath ReadMode)
      (\hdl -> hClose hdl)
      (\hdl -> copyFile hdl dst)

copyFileWithConvert :: Handle -> Handle -> (String -> String) -> IO ()
copyFileWithConvert src dst convert = loop
  where
    loop = do
      isEof <- hIsEOF src
      if isEof
        then return ()
        else do
          line <- hGetLine src
          outputLine <- ioAction line
          hPutStrLn dst (map toUpper line)
          loop
