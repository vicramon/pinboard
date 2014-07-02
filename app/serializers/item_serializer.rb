class ItemSerializer < ActiveModel::Serializer
  attributes :id, :x_position, :y_position, :width, :height, :kind, :board_id, :text
end
