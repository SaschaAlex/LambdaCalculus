module Evaluator where

import Expression

--Exemple of AST :: Maybe LambdaExp
{-Just (App
  (Abs (
      Var "x") 
      (App (App (
            Var "x") 
            (Var "y")) 
          (Abs (
              Var "y") 
              (Var "y"))))
  (Var "x")
  )-}

sub :: Variable -- The old Variable
    -> LambdaExp -- The new expression 
    -> LambdaExp
    -> LambdaExp
sub old new (Var x) 
    | old == x = new
    | otherwise = Var x
sub old new (App x y) = App (sub old new x) (sub old new y)
sub old new (Abs string x) = Abs string (sub old new x)


runReduction :: LambdaExp -> LambdaExp
runReduction (App x y) = reduction x y
runReduction x = x

reduction :: LambdaExp -> LambdaExp -> LambdaExp
reduction (Var _) exp = exp
reduction (Abs s exp) exp' = runReduction $ sub s exp' exp
reduction (App x y) exp = reduction (reduction x y) exp
