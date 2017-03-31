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

ActiveRecord::Schema.define(version: 20170331184927) do

  create_table "courses", force: :cascade do |t|
    t.string   "crn"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["crn"], name: "index_courses_on_crn", unique: true

  create_table "section_students", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "section_students", ["section_id"], name: "index_section_students_on_section_id"
  add_index "section_students", ["student_id"], name: "index_section_students_on_student_id"

  create_table "sections", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "sections", ["student_id"], name: "index_sections_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
  end

  add_index "students", ["section_id"], name: "index_students_on_section_id"

end
