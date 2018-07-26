import random

type Suit {.pure.} = enum
  Club
  Diamond
  Heart
  Spade

type Card = tuple[suit: Suit, value: int]

type Deck = ref seq[Card]

proc `$`(deck: Deck): string =
  result = ""
  for c in deck[]:
    result = result & $c

proc makeCards: seq[Card] =
  var cards = newSeq[Card]()
  for s in Suit.Club..Suit.Spade:
    for i in 1..13:
      let c = (suit: s, value: i)
      cards.add(c)
  randomize()
  shuffle(cards)
  cards

proc newDeck(): Deck =
  var deck = new Deck
  let cards = makeCards()
  deck[] = cards
  deck

proc main() = 
  var deck: Deck = newDeck()
  echo $deck

when isMainModule:
   main()
