type Item* = tuple[id: int, name: string, price: int]
type Items* = seq[Item]

proc total*(items: Items): int =
  var n = 0
  for i in items:
    n += i.price
  n

type DiscountRule* = ref object of RootObj
  items*: Items

method apply(this: DiscountRule): int {.base.} =
  this.items.total()

type Over500ThenDiscount50 = ref object of DiscountRule

method apply(this: Over500ThenDiscount50): int =
  this.items.total() - 50

proc newDiscountRule*(items: Items): DiscountRule =
  if items.total() >= 500:
    Over500ThenDiscount50(items: items)
  else:
    DiscountRule(items: items)

proc discount*(rule: DiscountRule): int =
  rule.apply()

proc main() =
  block:
    let items = @[
      (id: 1, name: "Item1", price: 100),
      (id: 1, name: "Item2", price: 400)
    ]
    let rule: DiscountRule = newDiscountRule(items)
    let t = items.total()
    let d = rule.discount()
    echo "total=" & $t & ", discounted=" & $d

  block:
    let items = @[
      (id: 1, name: "Item1", price: 100),
      (id: 1, name: "Item2", price: 300)
    ]
    let rule: DiscountRule = newDiscountRule(items)
    let t = items.total()
    let d = rule.discount()
    echo "total=" & $t & ", discounted=" & $d

when isMainModule:
  main()