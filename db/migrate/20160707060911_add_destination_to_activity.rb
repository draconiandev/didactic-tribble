class AddDestinationToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :destination, index: true, foreign_key: true
  end
end
