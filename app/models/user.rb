class User < ActiveRecord::Base
    has_many :animals

    has_secure_password # adds authenticate method to User class
end