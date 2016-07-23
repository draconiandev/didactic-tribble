class AddSubscriptionsToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :subscription, index: true, foreign_key: true
  end
end
