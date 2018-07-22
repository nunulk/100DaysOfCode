{-# LANGUAGE StandaloneDeriving #-}

module Instance (
    testInstance
) where

data Color = Red | Green | Blue deriving Show

data Color' = Red' | Green' | Blue'

instance Show Color' where
    show Red'   = "#f00"
    show Green' = "#f00"
    show Blue'  = "#00f"

data Color'' = Red'' | Green'' | Blue''

deriving instance Show Color''

testInstance :: IO()
testInstance = do
    print $ show [Red, Green, Blue]
    print $ show [Red', Green', Blue']
    print $ show [Red'', Green'', Blue'']