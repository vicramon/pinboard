class ItemSerializer < ActiveModel::Serializer
  attributes :id, :top, :left, :width, :height, :kind, :board_id, :text
end
