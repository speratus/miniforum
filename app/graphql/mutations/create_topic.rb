module Mutations
  class CreateTopic < BaseMutation
    field :errors, [String], null: false
    field :topic, Types::TopicType, null: true

    argument :user_id, ID, required: true
    argument :title, String, required: true
    argument :content, String, required: true


    def resolve(title:, content:, user_id:)
      topic = Topic.new(title: title, content: content, user_id: user_id)
      if topic.save
        {
          topic: topic,
          errors: []
        }
      else
        {
          topic: nil,
          errors: topic.errors.full_messages
        }
      end
    end
  end
end
