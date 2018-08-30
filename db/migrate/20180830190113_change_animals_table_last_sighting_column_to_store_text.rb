class ChangeAnimalsTableLastSightingColumnToStoreText < ActiveRecord::Migration
  def change
    change_column :animals, :last_sighting, :string
  end
end
