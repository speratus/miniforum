module Types
  class TopicType < Types::BaseObject
    field :title, String, null: true
    field :content, String, null: true
    field :user, Types::UserType, null: true
    field :likes, [Types::LikeType], null: true
    field :replies, [Types::ReplyType], null: true
    field :id, Int, null: false
  end
end
