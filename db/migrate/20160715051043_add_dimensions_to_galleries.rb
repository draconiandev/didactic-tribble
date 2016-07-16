class AddDimensionsToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :height, :string
    add_column :galleries, :width, :string
  end
end
