class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_many :items, include: true, embed: :ids
end
