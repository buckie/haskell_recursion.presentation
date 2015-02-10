module Main where

import qualified System.Environment as Env

import qualified Factorial

main :: IO ()
main = do args <- Env.getArgs

          let (command:factorialArgsRaw) = args
          let fArgs = map read factorialArgsRaw :: [Integer]
          print $ case command of
                    "factorial" -> Factorial.factorial (head fArgs)
                    "facc"      -> Factorial.facc (head fArgs) (fArgs !! 1)
                    _           -> error "command not recognized"
