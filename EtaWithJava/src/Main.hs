module Main where

import Java

data Counter = Counter @counter.Counter
    deriving Class

foreign import java unsafe "@new" newCounter :: Java a Counter
foreign import java unsafe increment :: Java Counter ()
foreign import java unsafe getValue :: Java Counter Int

main = do
    count <- java $ do
        counter <- newCounter
        counter <.> increment
        counter <.> increment
        counter <.> getValue
    putStrLn $ show count
