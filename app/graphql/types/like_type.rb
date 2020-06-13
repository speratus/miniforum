module Types
  class LikeType < Types::BaseObject
    field :user, Types::UserType, null: true
    field :post, Types::PostType, null: true
    field :id, ID, null: true
  end
end
