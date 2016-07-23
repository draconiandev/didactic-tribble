class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :contact_person
      t.text :address
      t.string :city
      t.string :pincode
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
    add_index :vendors, :name
    add_index :vendors, :email, unique: true
  end
end
