class ItemSerializer < ActiveModel::Serializer
  attribute :name, key: :item_name
  attributes :description
  
end
