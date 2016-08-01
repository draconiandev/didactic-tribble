class AddAttributesToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :name, :string
    add_column :enquiries, :email, :string
    add_column :enquiries, :phone, :string
    add_column :enquiries, :message, :text
  end
end
