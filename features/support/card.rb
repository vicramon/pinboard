def create_card(board=nil)
  board ||= @board
  @card = Fabricate(:card, board: board, top: 200, left: 300)
end
