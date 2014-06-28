class ItemsSerializer < ActiveModel::Serializer
  attributes :id, :text, :board_id, :x_position, :y_position, :width, :height
end
