module Main where

import System.Environment
import Parser
import Evaluator
import Expression

main = do 
  input  <- getArgs
  parsed <- parseFile (head input)
  Just result <- executeFile parsed
  print result

parseFile :: String -> IO (Maybe LambdaExp)
parseFile fileName = do
  input <- readFile fileName
  return (snd <$> runParser mainParser input)

executeFile :: Maybe LambdaExp -> IO (Maybe LambdaExp)
executeFile mx = return (runReduction <$> mx)