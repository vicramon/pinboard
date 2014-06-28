class Api::ItemsController < Api::BaseController
  respond_to :json

  def index
    respond_with Item.all
  end

end
