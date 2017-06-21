module Data.Excersise3 where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head, null, nubBy)
import Data.Maybe (Maybe)
import Data.Array (concatMap)

type Address =
  { street :: String
  , city   :: String
  , state  :: String
  }

type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }

type AddressBook = List Entry

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.city <> ", " <> addr.state

showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <> entry.firstName <> ": " <> showAddress entry.address

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = head <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

findEntryArr :: String -> String -> AddressBook -> AddressBook
findEntryArr firstName lastName = filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

findEntryuStreet :: String -> AddressBook -> Maybe Entry
findEntryuStreet street = head <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.address.street == street

isNameExist :: String -> String -> AddressBook -> Boolean
isNameExist firstName lastName book = 
  if null book
    then false
    else 
      if null (findEntryArr firstName lastName book)
        then false
        else true

removeDups :: AddressBook -> AddressBook
removeDups book = nubBy (\a b -> a.firstName == b.firstName && a.lastName == b.lastName) book

-- showAddressBook :: AddressBook -> List String
-- showAddressBook book = concatMap (\n -> [showEntry n]) book