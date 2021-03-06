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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141021185710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_tags", force: true do |t|
    t.integer  "event_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "details"
    t.string   "offender"
    t.string   "location"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "submitter"
    t.integer  "user_id"
    t.string   "event_photo_file_name"
    t.string   "event_photo_content_type"
    t.integer  "event_photo_file_size"
    t.datetime "event_photo_updated_at"
  end

  create_table "tags", force: true do |t|
    t.string "tag_name"
  end

  create_table "users", force: true do |t|
    t.string "username"
    t.string "level"
    t.string "password_digest"
  end

end
