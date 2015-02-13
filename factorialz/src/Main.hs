module Main where

import Criterion.Main
import Factorial
import Data.Int

benchF :: (Show a) => (a -> b) -> a -> Benchmark
benchF f x = bench (show x) $ whnf f x

inputs :: [Int64]
inputs = [10..13]

main :: IO ()
main = defaultMain [ bgroup "factorial" $ fmap (benchF factorial) inputs
                   , bgroup "factorial backwards" $ fmap (benchF factorial') inputs
                   , bgroup "factorial with if" $ fmap (benchF factorial'') inputs
                   , bgroup "fac" $ fmap (benchF (fac 1)) inputs
                   ]
