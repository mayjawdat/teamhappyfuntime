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

ActiveRecord::Schema.define(version: 20170420182456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time",          null: false
    t.datetime "end_time",            null: false
    t.integer  "student_id"
    t.integer  "mentor_id"
    t.text     "feedback_on_mentor"
    t.text     "feedback_on_student"
    t.integer  "rating_on_mentor"
    t.integer  "rating_on_student"
    t.boolean  "cancelled"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["mentor_id"], name: "index_appointments_on_mentor_id", using: :btree
    t.index ["student_id"], name: "index_appointments_on_student_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "full_name",                       null: false
    t.string   "password_digest",                 null: false
    t.string   "phone"
    t.string   "email"
    t.boolean  "is_mentor",       default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
