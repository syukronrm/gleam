module Order

export Order(..), reverse/1, to_int/1, compare/2, max/2, min/2


type Order
  = LT
  | EQ
  | GT

let reverse(order) =
  match order
  | LT => GT
  | EQ => EQ
  | GT => LT

test "reverse/1" =
  reverse(LT) |> Assert.equal(_, GT)
  reverse(EQ) |> Assert.equal(_, EQ)
  reverse(GT) |> Assert.equal(_, LT)

let to_int(order) =
  match order
  | LT => -1
  | EQ => 0
  | GT => 1

test "to_int/1" =
  to_int(LT) |> Assert.equal(_, -1)
  to_int(EQ) |> Assert.equal(_, 0)
  to_int(GT) |> Assert.equal(_, 1)

let compare(a, b) =
  match (a, b)
  | (LT, LT) => EQ
  | (LT, _) => LT
  | (EQ, EQ) => EQ
  | (GT, GT) => EQ
  | (EQ, GT) => LT
  | _ => GT

test "compare/1" =
  compare(LT, LT) |> Assert.equal(_, EQ)
  compare(LT, EQ) |> Assert.equal(_, LT)
  compare(LT, GT) |> Assert.equal(_, LT)
  compare(EQ, LT) |> Assert.equal(_, GT)
  compare(EQ, EQ) |> Assert.equal(_, EQ)
  compare(EQ, GT) |> Assert.equal(_, LT)
  compare(GT, LT) |> Assert.equal(_, GT)
  compare(GT, EQ) |> Assert.equal(_, GT)
  compare(GT, GT) |> Assert.equal(_, EQ)

let max(a, b) =
  match (a, b)
  | (GT, _) => GT
  | (EQ, LT) => EQ
  | _ => b

test "max/1" =
  max(LT, LT) |> Assert.equal(_, LT)
  max(LT, EQ) |> Assert.equal(_, EQ)
  max(LT, GT) |> Assert.equal(_, GT)
  max(EQ, LT) |> Assert.equal(_, EQ)
  max(EQ, EQ) |> Assert.equal(_, EQ)
  max(EQ, GT) |> Assert.equal(_, GT)
  max(GT, LT) |> Assert.equal(_, GT)
  max(GT, EQ) |> Assert.equal(_, GT)
  max(GT, GT) |> Assert.equal(_, GT)

let min(a, b) =
  match (a, b)
  | (LT, _) => LT
  | (EQ, GT) => EQ
  | _ => b

test "min/1" =
  min(LT, LT) |> Assert.equal(_, LT)
  min(LT, EQ) |> Assert.equal(_, LT)
  min(LT, GT) |> Assert.equal(_, LT)
  min(EQ, LT) |> Assert.equal(_, LT)
  min(EQ, EQ) |> Assert.equal(_, EQ)
  min(EQ, GT) |> Assert.equal(_, EQ)
  min(GT, LT) |> Assert.equal(_, LT)
  min(GT, EQ) |> Assert.equal(_, EQ)
  min(GT, GT) |> Assert.equal(_, GT)