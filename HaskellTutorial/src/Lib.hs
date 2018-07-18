module Lib
    ( someFunc,
      interactWith
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

