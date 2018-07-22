module Main where

import Lib
import SafeList
import Instance
import System.Environment (getArgs)

main :: IO ()
main = mainWith myFunction
  where
    mainWith function = do
      args <- getArgs
      case args of
        ["instance"]                  -> testInstance
        ["safeList"]                  -> testSafeList
        ["splitLines",input]          -> print $ splitLines input
        ["interactWith",input,output] -> interactWith function input output
        _ -> putStrLn "error: exactly three arguments needed"

    myFunction = id
