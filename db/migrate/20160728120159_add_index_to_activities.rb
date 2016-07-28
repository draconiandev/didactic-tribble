class AddIndexToActivities < ActiveRecord::Migration
  def change
    add_index :activities, :slug, unique: true
  end
end
