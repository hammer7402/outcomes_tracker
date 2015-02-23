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

ActiveRecord::Schema.define(version: 20150220165507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "user_name",       null: false
    t.string "password_digest", null: false
  end

  create_table "cohorts", force: :cascade do |t|
    t.string  "cohort",    null: false
    t.date    "ends_on",   null: false
    t.integer "course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course", null: false
  end

  create_table "courses_locations", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "location_id"
  end

  add_index "courses_locations", ["course_id"], name: "index_courses_locations_on_course_id", using: :btree
  add_index "courses_locations", ["location_id"], name: "index_courses_locations_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string "city", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string  "first",                                         null: false
    t.string  "last",                                          null: false
    t.string  "email",                                         null: false
    t.string  "phone",                                         null: false
    t.string  "password_digest",                               null: false
    t.boolean "is_employed",           default: false
    t.text    "skills",                default: "none listed"
    t.string  "employment_type",       default: "unemployed"
    t.date    "employment_start_date"
    t.integer "cohort_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
