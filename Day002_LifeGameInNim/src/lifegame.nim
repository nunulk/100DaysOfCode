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

proc nextGeneration*(game: LifeGame) =
  discard

proc main() =
  discard

when isMainModule:
  main()
