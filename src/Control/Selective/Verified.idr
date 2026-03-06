module Control.Selective.Verified

import Control.Selective
import Data.Either

%default total

public export
interface Selective f => VerifiedSelective (f : Type -> Type) where
  selectiveIdentity :
    {0 a : Type} ->
    (x : f (Either a a)) ->
    select x (pure Basics.id) = map (either Basics.id Basics.id) x

  selectiveDistributivity :
    {0 a, b : Type} ->
    (x : Either a b) ->
    (y : f (a -> b)) ->
    (z : f (a -> b)) ->
    select (pure x) (y *> z) = (select (pure x) y) *> (select (pure x) z)
