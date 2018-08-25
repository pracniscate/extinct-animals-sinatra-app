class CreateExtinctAnimals < ActiveRecord::Migration
  def change
    create_table :extinct_animals do |t|
      t.string :name
      t.string :type
      t.integer :last_sighting
      t.text :description
      t.integer :user_id #belongs to a user
    end
  end
end
