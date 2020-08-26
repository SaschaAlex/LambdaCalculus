module Expression where

data LambadExp = Var  String 
                | Abs LambadExp LambadExp -- The first argument is a "Var"
                | App LambadExp LambadExp 
    deriving (Show,Eq)