class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.text :brief
      t.string :slug

      t.timestamps null: false
    end
    add_index :destinations, :name, unique: true
  end
end
