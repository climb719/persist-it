ActiveRecord::Schema.define(version: 2021_04_22_140201) do

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.integer "topic_id"
    t.date "date"
    t.text "content"
    t.integer "user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
