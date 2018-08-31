class User < ActiveRecord::Base
    has_many :animals

    has_secure_password # adds authenticate method to User class

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
end