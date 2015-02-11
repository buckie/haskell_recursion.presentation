module CLI where

import qualified System.Environment as Env

import qualified Factorial

main :: IO ()
main = do args <- Env.getArgs

          let (command:factorialArgsRaw) = args
          let fArgs = map read factorialArgsRaw :: [Integer]
          case command of
            "factorial" -> print $ Factorial.factorial (head fArgs)
            "facc"      -> print $ Factorial.facc (head fArgs) 1
            _           -> error "command not recognized"

