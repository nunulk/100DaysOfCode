module SafeList (
  safeHead,
  testSafeList
  ) where

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

testSafeList :: IO ()
testSafeList = do
  print $ safeHead [1,2,3]
  print $ safeTail [1,2,3]
