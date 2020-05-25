class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, polymorphic: true

  validates :user, :post, presence: true
end
