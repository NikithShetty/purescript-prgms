module Test.Exercises5 where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow, log)
import Data.Exercises5

p1 :: Person
p1 = {
	name: "Paul",
	address : {
		street: "Street",
		city: "City"
	}
}

p2 :: Person
p2 = {
	name: "Ethan",
	address : {
		street: "StreetFake",
		city: "City"
	}
}

p3 :: Person
p3 = {
	name: "Ethan",
	address : {
		street: "StreetFake",
		city: "City2"
	}
}

point1 :: Point
point1 = Point {
	x : 1.2,
	y : 2.2
}

centerCircle :: Shape
centerCircle = Circle p n
	where 
		p = Point {x: 0.0, y: 0.0}
		n = 10.0

main :: Eff (console :: CONSOLE) Unit
main = do

	log "gcd' 4 56"
	logShow $ gcd' 4 56

	-- log "binom 4 6"
	-- logShow $ binom 4 6

	log "sameCity p1 p2"
	logShow $ sameCity p1 p2

	log "showPoint point1"
	logShow $ showPoint point1

	log "showShape centerCircle"
	logShow $ showShape centerCircle

	log "scale centerCircle 3.0"
	logShow $ showShape $ scale centerCircle 3.0
