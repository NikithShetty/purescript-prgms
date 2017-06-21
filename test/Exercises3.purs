module Test.Exercises3 where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow, log)
import Data.Exercises3
import Data.Maybe (Maybe)

example :: Entry
example =
  { firstName: "John"
  , lastName: "Smith"
  , address: { street: "123 Fake St."
             , city: "Faketown"
             , state: "CA"
             }
  }

example1 :: Entry
example1 =
  { firstName: "Paul"
  , lastName: "Smulders"
  , address: { street: "Fake St."
             , city: "Faketown"
             , state: "CA"
             }
  }

book0 :: AddressBook
book0 = emptyBook

printEntry :: String -> String -> AddressBook -> Maybe String
printEntry firstName lastName book = showEntry <$> findEntry firstName lastName book

printEntryuStreet :: String -> AddressBook -> Maybe String
printEntryuStreet street book = showEntry <$> findEntryuStreet street book

main :: Eff (console :: CONSOLE) Unit
main = do
  let 
    book1 = insertEntry example book0
    book2 = insertEntry example1 book1

  --retrieve record using name
  log "printEntry \"John\" \"Smith\" book0"
  logShow $ printEntry "John" "Smith" book0
  log "printEntry \"John\" \"Smith\" book1"
  logShow $ printEntry "John" "Smith" book1

  --retrieve record using street address
  log "printEntryuStreet \"Fake St.\" book2"
  logShow $ printEntryuStreet "Fake St." book2

  --check whether record exists
  log "isNameExist 'John' 'Smith' book2"
  logShow $ isNameExist "John" "Smith" book2




