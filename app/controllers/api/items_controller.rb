class Api::ItemsController < Api::BaseController
  respond_to :json

  def index
    respond_with Item.all
  end

  def create
    respond_with :api, Item.create(item_params)
  end

  def update
    respond_with Item.find(params[:id]).update(item_params)
  end

  def destroy
    respond_with Item.find(params[:id]).destroy
  end

  private

  def item_params
    params.require(:item).permit(:text, :top, :left, :width, :height, :kind, :board_id, :url)
  end

end
