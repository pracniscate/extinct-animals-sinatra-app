class Animal < ActiveRecord::Base
    belongs_to :user

    validates :name, :animal_type, :description, presence: true
    validates :name, uniqueness: true
end