module SafeList (
  testSafeList
  ) where

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_:xs) = Just xs

value :: Maybe a -> a -> a
value (Just x) _ = x
value Nothing x = x

testSafeList :: IO ()
testSafeList = do
  let eh = safeHead [] :: Maybe Int
  print $ value eh 0
  let h  = safeHead [1,2,3]
  print $ value h 0
  let et = safeTail [] :: Maybe [Int]
  print $ value et []
  let t = safeTail [1,2,3]
  print $ value t []
