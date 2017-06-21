module Data.Excersise4 where

import Prelude
import Data.Array (null, (..))
import Data.Array.Partial (tail, head)
import Partial.Unsafe
import Control.MonadZero (guard)

factors :: Int -> Array (Array Int)
factors n = do
	i <- 1 .. n
	j <- i .. n
	guard $ i * j == n
	[[i, j]]

isEven :: Int -> Boolean
isEven 0 = true
isEven n = isOdd (n - 1)

isOdd :: Int -> Boolean
isOdd 1 = true
isOdd n = isEven (n - 1)

isPrime :: Int -> Boolean
isPrime n = 
	if (factors n) == [[1,n]]
		then true
		else false

crossProd :: Array Int -> Array Int -> Array (Array Int)
crossProd arrA arrB = do
	i <- arrA
	j <- arrB
	[[i,j]]