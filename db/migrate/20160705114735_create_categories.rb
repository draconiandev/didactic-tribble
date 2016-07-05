class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.text :brief
      t.string :slug
      t.string :main_category

      t.timestamps null: false
    end
    add_index :categories, :name, unique: true
  end
end
