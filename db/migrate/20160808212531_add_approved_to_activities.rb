class AddApprovedToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :approved, :boolean
  end
end
