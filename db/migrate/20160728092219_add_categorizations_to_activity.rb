class AddCategorizationsToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :categorization, index: true, foreign_key: true
  end
end
