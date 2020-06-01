class User < ApplicationRecord
    has_secure_password
    has_many :topics
    has_many :comments, class_name: "Reply"
    has_many :likes

    validates :email, :name, :username, :password, presence: true
    validates :username, :email, uniqueness: true
    validate :alphanumeric_only
    validate :valid_email

    def alphanumeric_only
        if !(/\W/ =~ self.username).nil?
            self.errors[:username] << "Username must be alphanumeric"
        end
    end

    def valid_email
        if /[\w\.\+]+@\w+(?:\.\w+)+/.match(self.email).to_s != self.email
            self.errors[:email] << "Must be a valid email address."
        end
    end
end
