module ReadFile where

import Parser
import Expression
import Evaluator

parseFile :: FilePath -> IO (Maybe LambadExp)
parseFile fileName = do
  input <- readFile fileName
  return (snd <$> runParser mainParser input)