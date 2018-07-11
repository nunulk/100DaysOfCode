import sequtils

const Dead = 0
const Alive = 1

# [y, x]
type Position* = array[2, int]

type Board = seq[seq[int]]

type LifeGame* = ref object
  width: int
  height: int
  board*: Board

proc newBoard(w: int, h: int): Board =
  result = newSeq[seq[int]]()
  for i in 0..<h:
    result.add(newSeq[int](w))

proc setAlive*(game: var LifeGame, y: int, x: int) =
  game.board[y][x] = Alive

proc newGame*(w: int, h: int, initial: openArray[Position]): LifeGame =
  var game = LifeGame(width: w, height: h, board: newBoard(w, h))
  for cell in initial:
    game.setAlive(cell[0], cell[1])

  game

proc countAlive(game: LifeGame, y: int, x: int): int =
  var around: seq[int] = @[]
  for dy in -1..1:
     for dx in -1..1:
        if (dy == 0 and dx == 0):
          continue
        if y + dy < 0 or x + dx < 0 or y + dy >= game.height or x + dx >= game.width:
          continue
        let cell = game.board[y + dy][x + dx]
        around.add(cell)
  return foldl(around, a + b)

proc deadOrAlive(game: LifeGame, y: int, x: int): int =
  let aroundAlive = game.countAlive(y, x);
  if game.board[y][x] == ALIVE:
    if aroundAlive > 1 and aroundAlive < 4:
      return Alive
    else:
      return Dead
  else:
    if aroundAlive == 3:
      return Alive
    else:
      return Dead

proc nextGeneration*(game: var LifeGame) =
  var new_board = newSeq[seq[int]]()
  for y in 0..<len(game.board):
    var row = newSeq[int]()
    for x in 0..<len(game.board[y]):
      row.add(game.deadOrAlive(y, x))
    new_board.add(row)
  game.board = new_board

proc main() =
  discard

when isMainModule:
  main()
