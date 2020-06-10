module Types
  class ReplyType < Types::BaseObject
    field :content, String, null: true
    field :id, Integer, null: true
    field :user, Types::UserType, null: true
    field :post, Types::PostType, null: true
  end
end
