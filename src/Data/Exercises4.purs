module Data.Exercises4 where

import Prelude
import Data.Array (null, (..))
import Data.Array.Partial (tail, head)
import Data.Foldable
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

--Cartesian Product of Arrays
crossProd :: Array Int -> Array Int -> Array (Array Int)
crossProd arrA arrB = do
	i <- arrA
	j <- arrB
	[[i,j]]

--Pythagorean triplets
pyth :: Int -> Array (Array Int)
pyth n = do
	i <- 1 .. n
	j <- i .. n
	k <- j .. n
	guard $ i*i + j*j == k*k
	[[i,j,k]]

--reverse
reverse :: forall a. Array a -> Array a
reverse = foldr (\x xs -> xs <> [x]) []

reverse' :: forall a. Array a -> Array a
reverse' = foldl (\xs x -> [x] <> xs) []

--check whether all true in bool array
isAllTrue :: Array Boolean -> Boolean
isAllTrue = foldl (\ns n -> n && ns) true

length :: forall a. Array a -> Int
length arr =
  if null arr
    then 0
    else 1 + length (unsafePartial tail arr)


--count even numbers in array
count :: Array Int -> Int
count arr = 
	foldl check 0 arr
	where
		check :: Int -> Int -> Int
		check sumv a = 
			if (mod a 2) == 0
				then (sumv + 1)
				else sumv