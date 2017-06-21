module Excersise5 where

import Prelude

gcd :: Int -> Int -> Int
gcd n 0 = n
gcd 0 m = m
gcd n m = if n > m
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