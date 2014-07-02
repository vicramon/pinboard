class Api::ItemsController < Api::BaseController
  respond_to :json

  def index
    respond_with Item.all
  end

  def update
    respond_with Item.find(params[:id]).update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:text, :x_position,
      :y_position, :width, :height)
  end

end
