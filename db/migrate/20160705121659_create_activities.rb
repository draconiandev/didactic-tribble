class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :overview
      t.text :itinerary
      t.decimal :price
      t.date :start_date
      t.date :end_date
      t.string :difficulty
      t.boolean :handcrafted
      t.string :handcrafted_category
      t.string :cover
      t.string :string
      t.text :brief

      t.timestamps null: false
    end
    
    add_index :activities, :title,          unique: true
  end
end
