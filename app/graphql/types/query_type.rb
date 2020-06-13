module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false, description: 'Returns all the users'

    def users
      User.all
    end

    field :topics, [Types::TopicType], null: false, description: 'Returns all the topics'

    def topics
      Topic.all
    end

    field :user, Types::UserType, null: true do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end
  end
end
