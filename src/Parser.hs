module Parser where

import Expression
import Data.Char
import Control.Applicative

newtype Parser a = Parser {runParser :: String -> Maybe (String, a)} 

instance Functor Parser where
    fmap f (Parser p) = Parser $ \input -> do
        (input',x) <- p input
        return (input' , f x)

instance Applicative Parser where
    pure x = Parser $  \input -> Just (input,x)
    (Parser f)  <*> (Parser p) = Parser $ \input -> do
        (input',g)  <- f input
        (input'',x) <- p input'
        return (input'', g x)

instance Alternative Parser where
  empty = Parser $ const Nothing
  (Parser p1) <|> (Parser p2) = Parser $ \input -> p1 input <|> p2 input

mainParser :: Parser LambdaExp
mainParser =   parserVar  <|> parserAbs <|> parserApp

parserVar :: Parser LambdaExp
parserVar =  Var <$> parserVariable

parserAbs :: Parser LambdaExp
parserAbs =  parserCharacter '(' *> ws *> parserCharacter '\\' *> ws *> expression <* ws <* parserCharacter ')'
    where 
        expression = Abs <$> parserVariable  <*>
         (ws *>parserCharacter '.' *> ws *> mainParser <* ws)    

 
parserApp :: Parser LambdaExp
parserApp = parserCharacter '(' *> ws  *> expression <* ws <* parserCharacter ')'
    where 
        expression = App <$>  (ws *> mainParser <* parseIf isSpace) <*> ( ws *> mainParser <* ws)

parserVariable :: Parser Variable
parserVariable = (:) <$> parseIf isLower <*> spanParser isLetter

ws :: Parser String
ws = spanParser isSpace

spanParser :: (Char -> Bool) -> Parser String
spanParser = many . parseIf

parserString ::  String -> Parser String
parserString  = traverse parserCharacter

parserCharacter :: Char -> Parser Char
parserCharacter c = parseIf (==c)

parseIf :: (Char -> Bool) -> Parser Char
parseIf predicate = Parser f
  where
    f (x : xs)
      | predicate x = Just (xs, x)
      | otherwise = Nothing
    f [] = Nothing

