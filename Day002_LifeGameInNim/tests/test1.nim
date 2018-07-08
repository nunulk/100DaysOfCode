import lifegame

proc initial(): array[7, Position] =
  [[0,1],[0,3],[1,2],[2,0],[2,1],[3,2],[3,3]]

var game: LifeGame = newGame(4, 4, initial())

doAssert game.board == @[@[0,1,0,1],@[0,0,1,0],@[1,1,0,0],@[0,0,1,1]], "初期生成エラー"
