{-# LANGUAGE OverloadedStrings #-}
import Test.HUnit
main :: IO ()
main = do
  runTestTT $ TestList
    [ jqFilterParserTest ]
  return ()

jqFilterParserTest :: Test
jqFilterParserTest = TestList
  [ "jqFilterParser test 1" ~: parseJqFilter "." ~?= Right JqNil ]
