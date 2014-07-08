class Api::ItemsController < Api::BaseController
  respond_to :json

  def create
    respond_with :api, Item.create(item_params)
  end

  def update
    respond_with item.update(item_params)
  end

  def destroy
    respond_with item.destroy
  end

  private

  def item
    Item.find(params[:id]).tap do |obj|
      render_unauthorized unless obj.owner == current_user
    end
  end

  def item_params
    params.require(:item).permit(:text, :top, :left, :width, :height, :kind, :board_id, :url)
  end

end
