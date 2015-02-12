{-# LANGUAGE BangPatterns, MagicHash, UnboxedTuples #-}

module Factorial where

import Data.Int

factorial :: (Num a, Eq a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

factorial' :: (Num a, Eq a) => a -> a
factorial' 0 = 1
factorial' n = (factorial (n-1)) * n

factorial'' :: (Num a, Eq a) => a -> a
factorial'' n = if n /= 0
                  then n * factorial (n-1)
                  else 1


fac :: (Num a, Eq a) => a -> a -> a
fac a 0 = a
fac a n = fac (n*a) (n-1)
