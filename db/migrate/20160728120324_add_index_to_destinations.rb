class AddIndexToDestinations < ActiveRecord::Migration
  def change
    add_index :destinations, :slug, unique: true
  end
end
