def create_text(board=nil)
  board ||= @board
  @text = Fabricate(:text, board: board, top: 200, left: 300)
end
