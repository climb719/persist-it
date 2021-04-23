class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :topic, :topic_id
  end
end
