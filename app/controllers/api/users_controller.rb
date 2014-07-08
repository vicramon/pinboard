class Api::UsersController < Api::BaseController

  respond_to :json

  def index
    respond_with current_user.boards
  end

end
