module Types
  class PostType < Types::BaseUnion
    possible_types Types::ReplyType, Types::TopicType
  end
end
