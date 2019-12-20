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

ActiveRecord::Schema.define(version: 2019_12_20_204217) do

  create_table "movies", force: :cascade do |t|
    t.string "name", null: false
    t.string "genre", null: false
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_movies_on_name"
  end

  create_table "screenings", force: :cascade do |t|
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.json "seat_map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
    t.integer "screen_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
    t.index ["screen_id"], name: "index_screenings_on_screen_id"
  end

  create_table "screens", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "rows", null: false
    t.integer "columns", null: false
    t.index ["number"], name: "index_screens_on_number", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthday"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

end
