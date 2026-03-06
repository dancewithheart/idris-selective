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
    (x : f (Either a b)) ->
    (y : a -> b) ->
    select x (pure y) = map (either y Basics.id) x
