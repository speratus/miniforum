class Topic < ApplicationRecord
  belongs_to :user
  has_many :replies, as: :post
  has_many :likes, as: :post

  validates :title, :content, :user, presence: true

  def graphql_type
    Types::TopicType
  end
end
