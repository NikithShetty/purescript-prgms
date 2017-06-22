module Data.Exercises5 where

import Prelude

import Control.MonadZero (guard)
import Data.Maybe

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


data Point = Point {
	x :: Number,
	y :: Number
}

data Shape = 
	Circle Point Number
	| Rectangle Point Number Number
	| Line Point Point
	| Text Point String

showShape :: Shape -> String
showShape (Circle (Point{x,y}) r)      = "Circle - point : " <> show x <> ", " <> show y <> ", radius : " <> show r
showShape (Rectangle (Point{x,y}) w h) = "Rect - point : " <> show x <> ", " <> show y <> ", w : " <> show w <> ", h : " <> show h
showShape (Line (Point{x,y}) (Point{x:u,y:v}))  = "Line - p1 : " <> show x <> ", " <> show y <> ", p2 : " <> show u <> ", " <> show v
showShape (Text (Point{x,y}) text) = "Text - p : " <> show x <> ", " <>  show y <> ", text : " <> text

showPoint :: Point -> String
showPoint (Point {x, y}) = 
	"x : " <> show x <> ", y : " <> show y

scale :: Shape -> Number -> Shape
scale (Circle c r) fac = (Circle c (r*fac)) 
scale (Rectangle c w h) fac = (Rectangle c (w*fac) (h*fac))
scale (Line start (Point {x,y})) fac = (Line start (Point {x:x1, y:y1}))
	where
		x1 = x*fac
		y1 = y*fac
scale (Text loc text) fac = (Text loc text)

getText :: Shape -> Maybe String
getText s = case s of
	(Text loc text) -> Just text
	_ -> Nothing
