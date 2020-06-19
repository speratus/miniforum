module Types
  class PostType < Types::BaseUnion
    possible_types Types::ReplyType, Types::TopicType

    def self.resolve_type(object, context)
      object.graphql_type
    end
  end
end
