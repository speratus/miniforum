class User < ApplicationRecord
    has_many :topics
    has_many :comments, class_name: "Reply"
    has_many :likes
end
