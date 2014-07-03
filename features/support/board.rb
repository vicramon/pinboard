def create_board
  @board = Fabricate(:board, user: @user)
end

def visit_board
  visit board_path(@board)
end
