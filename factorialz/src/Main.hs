module Main where

import Criterion.Main

import Factorial

benchF :: (Show a) => (a -> b) -> a -> Benchmark
benchF f x = bench (show x) $ whnf f x

inputs :: [Integer]
inputs =  drop 13 $ take 17 $ iterate (*2) 1

main :: IO ()
main = defaultMain [ bgroup "factorial" $ map (benchF factorial) inputs
                   , bgroup "facc" $ map (benchF (`facc` 1)) inputs
                   ]
