# λ Untyped . Lambda Calculus [![Build Status](https://travis-ci.org/SaschaAlex/LambdaCalculus.svg?branch=master)](https://travis-ci.org/github/SaschaAlex/LambdaCalculus) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


This is an interpreter for lambda calculus based on church original [paper](https://www.ics.uci.edu/~lopes/teaching/inf212W12/readings/church.pdf).

## Cod Exemple

```m
(
    (\p.((p (\x.(\y.y))) (\x.(\y.x)))) 
                                        (\u.(\v.u))
                                                    )
```
Equivelent code in haskell
```hs
not True
```
```
NOT  = (\p.((p (\x.(\y.y))) (\x.(\y.x))))
TRUE = (\u.(\v.u))
```


## Build
This project is build using stack.
```bash
git clone git@github.com:SaschaAlex/LambdaCalculus.git
cd ./LambdaCalculus
stack build
```
