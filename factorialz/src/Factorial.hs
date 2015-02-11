module Factorial where

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n-1)

facc :: Integer -> Integer -> Integer
facc 0 a = a
facc n !a = facc (n-1) $! (a*n)


