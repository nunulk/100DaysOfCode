module FileHandling (
    copyFileToUpper
) where

import System.IO
import Data.Char(toUpper)

copyFileToUpper :: String -> String -> IO ()
copyFileToUpper input output = do
    inHandle <- openFile input ReadMode
    outHandle <- openFile output WriteMode

    mainLoop inHandle outHandle

    hClose inHandle
    hClose outHandle

mainLoop :: Handle -> Handle -> IO ()
mainLoop inHandle outHandle =
    do inEof <- hIsEOF inHandle
       if inEof
            then return ()
            else do line <- hGetLine inHandle
                    hPutStrLn outHandle (map toUpper line)
                    mainLoop inHandle outHandle