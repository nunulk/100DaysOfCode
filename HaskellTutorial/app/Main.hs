module Main where

import Lib
import System.Environment (getArgs)

main :: IO ()
main = mainWith myFunction
  where
    mainWith function = do
      args <- getArgs
      case args of
        ["interactWith",input,output] -> interactWith function input output
        _ -> putStrLn "error: exactly three arguments needed"

    myFunction = id
