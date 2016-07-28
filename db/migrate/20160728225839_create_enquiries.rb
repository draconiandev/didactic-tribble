class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|

      t.timestamps null: false
    end
  end
end
