class RenameTableExtinctAnimalsToAnimals < ActiveRecord::Migration
  def change
    rename_table :extinct_animals, :animals
  end
end
