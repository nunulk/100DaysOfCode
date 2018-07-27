import random

type Suit {.pure.} = enum
  Club
  Diamond
  Heart
  Spade

type Card = tuple[suit: Suit, value: int]

type Deck = ref seq[Card]

type Hand = seq[Card]

type ObjPlayer = object
  name: string
  hand: Hand

type Player = ref ObjPlayer

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

proc take(player: Player, deck: Deck, num: int) =
  for n in 0..<num:
    var c: Card = deck[].pop
    player[].hand.add(c)

proc main() = 
  var deck: Deck = newDeck()
  var dealer = Player(name: "Dealder", hand: @[])
  var player = Player(name: "You", hand: @[])

  echo $deck

  take(dealer, deck, 2)
  take(player, deck, 2)

  echo $dealer[], $player[]

when isMainModule:
   main()
