class Topic < ApplicationRecord
  belongs_to :user
  has_many :replies, as: :post
  has_many :likes, as: :post

  validates :title, :content, :user, presence: true
end
