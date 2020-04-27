class PostSerializer < ActiveModel::Serializer
  attribute :title, key: :name
  attribute :body
end
