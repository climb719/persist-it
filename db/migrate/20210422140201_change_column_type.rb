class ChangeColumnType < ActiveRecord::Migration[5.2]
    def change
      change_column :notes, :topic_id, :integer
    end
end
