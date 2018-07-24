module CsvHandling (
    readPrices
) where

import qualified Data.ByteString.Lazy.Char8 as L

readPrice :: L.ByteString -> Maybe Int
readPrice s =
    case L.readInt s of
        Nothing -> Nothing
        Just (dollars, rest) ->
            case L.readInt (L.tail rest) of
                Nothing -> Nothing
                Just (cents, more) -> Just (dollars * 100 + cents)

closing = readPrice . (!!4) . L.split ','

highestClose = maximum . (Nothing:) . map closing . L.lines

readPrices :: String -> IO ()
readPrices file = do
    content <- L.readFile file
    print (highestClose content)
