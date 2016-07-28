class AddCategorizationsToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :categorization, index: true, foreign_key: true
  end
end
