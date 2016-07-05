class AddRoleToPeople < ActiveRecord::Migration
  def change
    add_column :people, :role, :string, null: false, default: "user"
  end
end
