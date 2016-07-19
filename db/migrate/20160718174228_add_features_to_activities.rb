class AddFeaturesToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :published_at, :datetime
    add_column :activities, :featured, :boolean
  end
end
