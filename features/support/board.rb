def create_board
  @board = Fabricate(:board, user: @user)
end
