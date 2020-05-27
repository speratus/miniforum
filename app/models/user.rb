class User < ApplicationRecord
    has_secure_password
    has_many :topics
    has_many :comments, class_name: "Reply"
    has_many :likes

    validates :email, :name, :username, :password, presence: true
    validates :username, :email, uniqueness: true
    validates :username, format: {with: /\w/, message: "only alphanumeric characters allowed"}
    validates :email, format: {with: /[\w\.\+]+@\w+(?:\.\w+)+/, message: "must be a valid email address"}
end
