module Result

export Result(..), ok?/1, none?/1, map/2, map_error/2, flatten/1, flat_map/2,
       unwrap/2, to_maybe/1, from_maybe/1

import Maybe exposing Maybe(..)


/// Result represents the result of something that may succeed or fail.
/// `Ok` means it was successful, `Error` means it failed.
///
type Result(error, value)
  = Ok(value)
  | Error(error)

let ok?(result) =
  match result
  | Error(_) => False
  | Ok(_) => True

let none?(result) =
  match result
  | Ok(_) => False
  | Error(_) => True

let map(result, fun) =
  match result
  | Ok(x) => fun(x)
  | Error(_) => result

let map_error(result, fun) =
  match result
  | Ok(_) => result
  | Error(error) => error |> fun |> Error

let flatten(result) =
  match result
  | Ok(x) => x
  | Error(_) => result

let flat_map(result, fun) =
  result
    |> unwrap(_, fun)
    |> flatten

let unwrap(result, default) =
  match result
  | Ok(v) => v
  | Error(_) => default

let to_maybe(result) =
  match result
  | Ok(v) => Just(v)
  | Error(_) => Nothing

let from_maybe(error, maybe) =
  match maybe
  | Just(v) => Ok(v)
  | Nothing => Error(error)