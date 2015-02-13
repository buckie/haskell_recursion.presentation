{-# LANGUAGE BangPatterns, MagicHash, UnboxedTuples #-}

module Factorial where

import Data.Int

factorial :: Int64 -> Int64
factorial 0 = 1
factorial n = n * factorial (n-1)

factorial' :: Int64 -> Int64
factorial' 0 = 1
factorial' n = (factorial (n-1)) * n

factorial'' :: Int64 -> Int64
factorial'' n = if n /= 0
                  then n * factorial (n-1)
                  else 1


fac :: Int64 -> Int64 -> Int64
fac a 0 = a
fac a n = fac (n*a) (n-1)
