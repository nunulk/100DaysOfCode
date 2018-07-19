module Lib
    ( someFunc,
      interactWith,
      splitLines
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

splitLines :: String -> [String]
splitLines [] = []
splitLines ss =
  let (pre, suf) = break isLineTerminator ss
  in pre : case suf of
            ('\r' : '\n' : rest) -> splitLines rest
            ('\r' : rest)        -> splitLines rest
            ('\n' : rest)        -> splitLines rest
            _                    -> []

isLineTerminator c = c == '\r' || c == '\n'