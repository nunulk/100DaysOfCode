module Main where

import Lib
import SafeList
import System.Environment (getArgs)

main :: IO ()
main = mainWith myFunction
  where
    mainWith function = do
      args <- getArgs
      case args of
        ["SafeList"]                  -> testSafeList
        ["splitLines",input]          -> putStrLn $ show $ splitLines input
        ["interactWith",input,output] -> interactWith function input output
        _ -> putStrLn "error: exactly three arguments needed"

    myFunction = id
