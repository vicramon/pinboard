def create_image(board=nil)
  board ||= @board
  @image = Fabricate(:image, board: board, top: 200, left: 300)
end
