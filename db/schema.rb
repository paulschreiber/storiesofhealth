# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091022183724) do

  create_table "stories", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.integer  "congressional_district"
    t.string   "youtube_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.string   "sex"
    t.string   "description"
    t.string   "language",               :default => "en"
  end

  add_index "stories", ["age"], :name => "index_stories_on_age"
  add_index "stories", ["city"], :name => "index_stories_on_city"
  add_index "stories", ["congressional_district"], :name => "index_stories_on_congressional_district"
  add_index "stories", ["first_name"], :name => "index_stories_on_first_name"
  add_index "stories", ["language"], :name => "index_stories_on_language"
  add_index "stories", ["last_name"], :name => "index_stories_on_last_name"
  add_index "stories", ["sex"], :name => "index_stories_on_sex"
  add_index "stories", ["state"], :name => "index_stories_on_state"
  add_index "stories", ["youtube_id"], :name => "youtube_id"

  create_table "stories_tags", :id => false, :force => true do |t|
    t.integer "story_id", :null => false
    t.integer "tag_id",   :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["category"], :name => "index_tags_on_category"
  add_index "tags", ["name"], :name => "index_tags_on_name"

end
