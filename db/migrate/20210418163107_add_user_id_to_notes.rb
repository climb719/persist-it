class AddUserIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :user_id, :integer
    #whatever belongs to the other objects gets the foreign id key
  end
end
