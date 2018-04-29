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

ActiveRecord::Schema.define(version: 20180429151508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rides", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.decimal "duration"
    t.decimal "distance"
    t.string "location"
    t.string "intensity"
    t.boolean "drop"
    t.integer "number_of_riders"
    t.integer "elevation_gain"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "rides_and_riders", id: false, force: :cascade do |t|
    t.bigint "ride_id"
    t.bigint "user_id"
    t.index ["ride_id", "user_id"], name: "index_rides_and_riders_on_ride_id_and_user_id", unique: true
    t.index ["ride_id"], name: "index_rides_and_riders_on_ride_id"
    t.index ["user_id"], name: "index_rides_and_riders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rides", "users"
end
