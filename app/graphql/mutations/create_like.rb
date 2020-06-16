module Mutations
  class CreateLike < BaseMutation
    field :like, Types::LikeType, null: true
    field :errors, [String], null: false

    argument :user_id, ID, null: false
    argument :post_id, ID, null: false
    argument :post_type, String, null: false

    def resolve(user_id:, post_id:, post_type:)
      type = Object.const_get(post_type)
      post = type.find_by(id: post_id)
      like = Like.new(user_id: user_id, post: post)

      if like.save
        {
          like: like,
          errors: []
        }
      else
        {
          like: nil,
          errors: like.errors.full_messages
        }
      end
    end
  end
end
