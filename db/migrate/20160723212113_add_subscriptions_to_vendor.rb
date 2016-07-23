class AddSubscriptionsToVendor < ActiveRecord::Migration
  def change
    add_reference :vendors, :subscription, index: true, foreign_key: true
  end
end
