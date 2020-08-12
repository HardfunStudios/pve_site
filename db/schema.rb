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

ActiveRecord::Schema.define(version: 2020_08_12_173313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string "post_author"
    t.datetime "post_date_gmt"
    t.text "post_content"
    t.string "post_title"
    t.string "post_status"
    t.text "post_excerpt"
    t.string "comment_status"
    t.string "ping_status"
    t.string "post_nama"
    t.datetime "post_modified"
    t.datetime "post_modified_gmt"
    t.string "post_content_filtered"
    t.integer "post_parent"
    t.integer "post_wp_id"
    t.integer "menu_order"
    t.string "guid"
    t.string "post_type"
    t.string "post_mime_type"
    t.integer "comment_count"
    t.string "filter"
    t.json "post_meta"
    t.string "post_thumbnail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
