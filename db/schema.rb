# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_10_171431) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "quote_topics", force: :cascade do |t|
    t.integer "quote_id"
    t.integer "topic_id"
    t.index ["quote_id"], name: "index_quote_topics_on_quote_id"
    t.index ["topic_id"], name: "index_quote_topics_on_topic_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "message"
    t.integer "year"
    t.string "url"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source"
    t.index ["author_id"], name: "index_quotes_on_author_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
  end

end
