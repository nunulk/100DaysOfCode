import sequtils

type Item* = tuple[id: int, name: string, price: int]
type Items* = seq[Item]

proc total*(items: Items): int =
  foldl(items, a + b.price, 0)

type Match = proc(n: int): bool
type Apply = proc(n: int): int
type DiscountRule = tuple[match: Match, apply: Apply]

proc find(rules: seq[DiscountRule], pred: proc(rule: DiscountRule): bool): DiscountRule {.inline.} =
  for i in 0..<len(rules):
    if pred(rules[i]):
      return rules[i]

  let m: Match = proc (n: int): bool = true
  let a: Apply = proc (n: int): int = n
  (m, a)

proc discount*(items: Items): int =
  let m1: Match = proc (n: int): bool = n >= 500
  let a1: Apply = proc (n: int): int = n - 50

  let rules: seq[DiscountRule] = @[(m1, a1)]

  let total = total(items)
  let rule = find(rules, proc (r: DiscountRule): bool = r.match(total))

  rule.apply(total)

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