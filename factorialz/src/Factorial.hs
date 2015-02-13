{-# LANGUAGE BangPatterns, MagicHash, UnboxedTuples #-}

module Factorial where

import Data.Int
-- import  GHC.TypeLits

factorial :: (Num a, Eq a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

factorial_Int :: Int -> Int
factorial_Int 0 = 1
factorial_Int n = n * factorial_Int (n-1 )

factorial_Integer :: Integer -> Integer
factorial_Integer 0 = 1
factorial_Integer n = n * factorial_Integer (n-1 )


fac :: (Num a, Eq a) => a -> a -> a
fac a 0 = a
fac a n = fac (n*a) (n-1)

fac_strict_int :: Int -> Int
fac_strict_int n = go 0 n
  where
    go :: Int -> Int -> Int
    go !accum !0 = accum
    go !accum !n = go (n* accum) (n-1)


fac_strict_integer :: Integer -> Integer
fac_strict_integer n = go 0 n
  where
    go :: Integer -> Integer -> Integer
    go !accum !0 = accum
    go !accum !n = go (n* accum) (n-1)
