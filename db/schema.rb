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

ActiveRecord::Schema.define(version: 20170122125348) do

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.integer  "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.integer  "playtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musics", force: :cascade do |t|
    t.string   "name"
    t.string   "player"
    t.integer  "playtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recfs", force: :cascade do |t|
    t.integer  "order",        default: 1,     null: false
    t.integer  "content_type", default: 1,     null: false
    t.boolean  "fixed_flag",   default: false
    t.integer  "fixed_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "recs", force: :cascade do |t|
    t.integer  "order"
    t.string   "content_type"
    t.integer  "content_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "recxes", force: :cascade do |t|
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
