module Test.Exercises6 where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow, log)
import Data.Exercises6

num :: Complex
num = Complex {
	real : 1.2,
	imaginary : 2.2
}

main :: Eff (console :: CONSOLE) Unit
main = do
	log "show num"
	logShow $ show num