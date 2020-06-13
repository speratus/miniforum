module Types
  class UserType < Types::BaseObject
    field :username, String, null: true
    field :name, String, null: true
    field :email, String, null: true
    field :id, ID, null: true
    field :comments, [Types::ReplyType], null: true
    field :likes, [Types::LikeType], null: true
    field :topics, [Types::TopicType], null: true
  end
end
