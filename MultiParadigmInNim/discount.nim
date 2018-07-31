import procedural
import objectoriented
import functional

proc main() =
  let cases = @[
    @[
      (id: 1, name: "Item1", price: 100),
      (id: 1, name: "Item2", price: 400)
    ],
    @[
      (id: 1, name: "Item1", price: 100),
      (id: 1, name: "Item2", price: 300)
    ]
  ]

  block:
    for items in cases:
      let t = procedural.total(items)
      let d = procedural.discount(items)
      echo "total=" & $t & ", discounted=" & $d

  block:
    for items in cases:
      let rule: DiscountRule = newDiscountRule(items)
      let t = objectoriented.total(items)
      let d = objectoriented.discount(rule)
      echo "total=" & $t & ", discounted=" & $d

  block:
    for items in cases:
      let t = functional.total(items)
      let d = functional.discount(items)
      echo "total=" & $t & ", discounted=" & $d

when isMainModule:
  main()