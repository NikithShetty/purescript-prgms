module Data.Exercises5 where

import Prelude

import Control.MonadZero (guard)

gcd' :: Int -> Int -> Int
gcd' n 0 = n
gcd' 0 m = m
gcd' n m = if n > m
			then gcd (n - m) m
			else gcd n (m - n)

fact :: Int -> Int
fact 0 = 1
fact n = n * fact ( n - 1)

--binomial coefficients
binom :: Int -> Int -> Int
binom n 0 = 1
binom n k = 
	if n == k
		then 1
		else (binom (n - 1) (k - 1)) + (binom (n - 1) k)


--same city
type Address = { street :: String, city :: String }
type Person = { name :: String, address :: Address }

sameCity :: Person -> Person -> Boolean  	
sameCity {address: {city: x}} {address: {city: y}}
	| x == y = true
	| otherwise = false