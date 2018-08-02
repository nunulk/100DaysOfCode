module GetPassword (
    getPassword
    ) where

import System.IO
import Data.List

getPassword :: String -> Integer -> IO ()
getPassword input uid = do
    content <- readFile input
    let username = findByUid content uid

    case username of
        Just x  -> putStrLn x
        Nothing -> putStrLn "UID not found"

findByUid :: String -> Integer -> Maybe String
findByUid content uid =
    let al = map parseLine (filter (not . ("#" `isPrefixOf`)) (lines content))
        in lookup uid al

parseLine :: String -> (Integer, String)
parseLine line =
    let fields = split ':' line
        -- in (read (fields !! 2), fields !! 0)
        in (1, fields !! 0)
split :: Eq a => a -> [a] -> [[a]]
split _ [] = [[]]
split delim str =
    let (before, reminder) = span (/= delim) str
        in
        before : case reminder of
                      [] -> []
                      x  -> split delim (tail x)