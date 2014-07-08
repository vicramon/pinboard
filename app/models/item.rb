class Item < ActiveRecord::Base
  belongs_to :board

  def owner
    board.user
  end

end
