class UpdateForiegnKey < ActiveRecord::Migration
  def change
    remove_foreign_key :categorizations, :activities

    add_foreign_key :categorizations, :activities, on_delete: :cascade
  end
end
