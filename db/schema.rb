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

ActiveRecord::Schema.define(version: 20170608094528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_consultations", force: :cascade do |t|
    t.integer  "inscription_id"
    t.integer  "moodle_scorm"
    t.string   "state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["inscription_id"], name: "index_course_consultations_on_inscription_id", using: :btree
  end

  create_table "daily_times", force: :cascade do |t|
    t.integer  "inscription_id"
    t.integer  "duration"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["inscription_id"], name: "index_daily_times_on_inscription_id", using: :btree
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer  "moodle_id"
    t.integer  "ours_id"
    t.string   "grouping_validation"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "quiz_attempt_results", force: :cascade do |t|
    t.integer  "quiz_attempt_moodle_id"
    t.integer  "inscription_id"
    t.string   "quiz_type"
    t.datetime "quiz_date"
    t.boolean  "quiz_result"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["inscription_id"], name: "index_quiz_attempt_results_on_inscription_id", using: :btree
  end

  create_table "quiz_attempt_slices", force: :cascade do |t|
    t.integer  "questions_count"
    t.integer  "correct_answers_count"
    t.string   "question_subcategory"
    t.integer  "quiz_attempt_result_id"
    t.string   "level"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["quiz_attempt_result_id"], name: "index_quiz_attempt_slices_on_quiz_attempt_result_id", using: :btree
  end

  add_foreign_key "course_consultations", "inscriptions"
  add_foreign_key "daily_times", "inscriptions"
  add_foreign_key "quiz_attempt_results", "inscriptions"
  add_foreign_key "quiz_attempt_slices", "quiz_attempt_results"
end
