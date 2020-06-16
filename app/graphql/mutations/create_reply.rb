module Mutations
  class CreateReply < BaseMutation
    field :errors, [String], null: false
    field :reply, Types::ReplyType, null: false

    argument :post_id, ID, null: false
    argument :user_id, ID, null: false
    argument :content, String, null: false
    argument :post_type, String, null: false

    def resolve(post_id:, user_id:, content:, post_type:)
      type = Object.const_get(post_type)
      post = type.find_by(id: post_id)
      reply = Reply.new(content: content, user_id: user_id, post: post)
      if reply.save
        {
          reply: reply,
          errors: []
        }
      else
        {
          reply: nil,
          errors: reply.errors.full_messages
        }
      end
    end
  end
end
