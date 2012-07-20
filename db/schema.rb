# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120719234452) do

  create_table "emails", :force => true do |t|
    t.integer  "team_id"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "color"
    t.float    "x_map_point"
    t.float    "y_map_point"
    t.string   "city"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "twitter_tags"
    t.datetime "promo_start_date"
    t.datetime "promo_end_date"
    t.string   "abbreviation"
    t.boolean  "defunct"
    t.string   "alternate_names"
    t.string   "tagline"
  end

  create_table "user_uploaded_images", :force => true do |t|
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
    t.integer  "team_id"
    t.string   "team1"
    t.string   "team2"
  end

end
