module Expression where

type Variable = String
data LambdaExp =  Var Variable 
                | Abs Variable LambdaExp 
                | App LambdaExp LambdaExp 
    deriving (Eq)


instance Show LambdaExp where 
    show (Var x) = x
    show (Abs string x) = '(':'\\':string ++ "." ++ show x ++ ")" 
    show (App x y) = '(' : show x ++ " " ++ show y ++ ")"