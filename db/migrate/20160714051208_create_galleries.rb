class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :activity_id
      t.string :image
      t.string :alt_text

      t.timestamps null: false
    end
  end
end
