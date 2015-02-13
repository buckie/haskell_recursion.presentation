module Main where

import Criterion.Main
import Factorial

benchF :: (Show a) => (a -> b) -> a -> Benchmark
benchF f x = bench (show x) $ whnf f x

inputs_integer :: [Integer]
inputs_integer = [10..13]

inputs_int :: [Int]
inputs_int = [10..13]

main :: IO ()
main = defaultMain [ bgroup "generic factorial Integer" $ fmap (benchF factorial) inputs_integer
                   , bgroup "integer specialized factorial" $ fmap (benchF factorial_Integer) inputs_integer
                   , bgroup "generic lazy fac int" $ fmap (benchF (fac 1)) inputs_integer
                   , bgroup "integer strict fact" $ fmap (benchF (fac_strict_integer )) inputs_integer

                   ,bgroup "generic factorial Int" $ fmap (benchF factorial) inputs_int
                   , bgroup "int specialized factorial" $ fmap (benchF factorial_Int) inputs_int
                   , bgroup "generic lazy fac int" $ fmap (benchF (fac 1)) inputs_int
                   , bgroup "integer strict fact" $ fmap (benchF (fac_strict_int )) inputs_int
                   ]
