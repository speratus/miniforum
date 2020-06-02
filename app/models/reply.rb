class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post, polymorphic: true
  has_many :replies, as: :post
  has_many :likes, as: :post

  validates :content, :user, :post, presence: true
end
