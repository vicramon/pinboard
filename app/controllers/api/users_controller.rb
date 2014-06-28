class Api::UsersController < Api::BaseController

  respond_to :json

  def index
    respond_with Board.all
  end

end
