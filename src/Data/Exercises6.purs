module Data.Exercises6 where

import Prelude

newtype Complex = Complex {
	real :: Number,
	imaginary :: Number
}

instance showComplex :: Show Complex where
	show (Complex {real, imaginary}) = "real : " <> show real <> ", imaginary : " <> show imaginary 