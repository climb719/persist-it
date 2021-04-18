class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :topic
      t.date :date
      t.text :content 
    end
  end
end
