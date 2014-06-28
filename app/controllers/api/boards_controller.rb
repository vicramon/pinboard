class Api::BoardsController < Api::BaseController

  respond_to :json

  def index
    respond_with boards
  end

  def show
    respond_with boards.find(params[:id])
  end

  private

  def boards
    Board.where(user_id: current_user.id)
  end

end
