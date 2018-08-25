class User < ActiveRecord::Base
    has_many :animals
end