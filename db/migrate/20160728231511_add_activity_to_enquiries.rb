class AddActivityToEnquiries < ActiveRecord::Migration
  def change
    add_reference :enquiries, :activity, index: true, foreign_key: true
  end
end
