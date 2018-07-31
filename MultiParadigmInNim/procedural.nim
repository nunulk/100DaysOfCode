type Item* = tuple[id: int, name: string, price: int]
type Items* = seq[Item]

proc total*(items: Items): int =
  var n = 0
  for i in items:
    n += i.price
  n

proc discount*(items: Items): int =
  let total = total(items)
  if total >= 500:
    total - 50
  else:
    total

proc main() =
  block:
    let items = @[
      (id: 1, name: "Item1", price: 100),
      (id: 1, name: "Item2", price: 400)
    ]
    let t = total(items)
    let d = discount(items)
    echo "total=" & $t & ", discounted=" & $d

  block:
    let items = @[
      (id: 1, name: "Item1", price: 100),
      (id: 1, name: "Item2", price: 300)
    ]
    let t = total(items)
    let d = discount(items)
    echo "total=" & $t & ", discounted=" & $d

when isMainModule:
  main()