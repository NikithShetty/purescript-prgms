module Test.Exercises4 where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow, log)
import Data.Exercises4
import Data.Maybe (Maybe)

arrA = [1,2,3]
arrB = [4,5]

main :: Eff (console :: CONSOLE) Unit
main = do

	log "factors 3"
	logShow $ factors 3

	log "isPrime 3"
	logShow $ isPrime 3

	logShow arrA
	logShow arrB
	log "crossProd arrA arrB"
	logShow $ crossProd arrA arrB

	log "pyth 5"
	logShow $ pyth 5

	log "count [1,2,3,4,5,6,7,8,9,0]"
	logShow $ count [1,2,3,4,5,6,7,8,9,0]