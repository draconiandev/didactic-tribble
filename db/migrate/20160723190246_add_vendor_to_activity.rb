class AddVendorToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :vendor, index: true, foreign_key: true
  end
end
