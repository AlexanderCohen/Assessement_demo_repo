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

ActiveRecord::Schema.define(version: 20180222100605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer "proficiency_level_id"
    t.string "name"
    t.string "achievement"
    t.boolean "achieved", default: false, null: false
    t.boolean "acheived", default: false, null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.integer "teacher_id"
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proficiency_levels", force: :cascade do |t|
    t.float "level"
    t.string "statement", null: false
    t.bigint "skill_id"
    t.string "prefix"
    t.index ["skill_id"], name: "index_proficiency_levels_on_skill_id"
  end

  create_table "skill_level_achievements", force: :cascade do |t|
    t.string "achievement"
    t.integer "skill_level"
  end

  create_table "skill_levels", force: :cascade do |t|
    t.string "statement"
    t.bigint "student_id"
    t.bigint "proficiency_level_id"
    t.index ["proficiency_level_id"], name: "index_skill_levels_on_proficiency_level_id"
    t.index ["student_id"], name: "index_skill_levels_on_student_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "subject_id"
    t.string "color"
  end

  create_table "student_achievements", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "achievement_id"
    t.index ["achievement_id"], name: "index_student_achievements_on_achievement_id"
    t.index ["student_id"], name: "index_student_achievements_on_student_id"
  end

  create_table "student_notes", force: :cascade do |t|
    t.bigint "student_id"
    t.text "note"
    t.datetime "created_at"
    t.string "created_by"
    t.index ["student_id"], name: "index_student_notes_on_student_id"
  end

  create_table "student_records", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "proficiency_level_id"
    t.datetime "created_at"
    t.index ["proficiency_level_id"], name: "index_student_records_on_proficiency_level_id"
    t.index ["student_id"], name: "index_student_records_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "special_education_need"
    t.integer "classroom_id"
    t.integer "year"
    t.boolean "pupil_premium"
    t.boolean "free_school_meals"
    t.boolean "english_as_language"
    t.boolean "gender"
    t.string "avatar"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "student_achievements", "achievements"
  add_foreign_key "student_achievements", "students"
  add_foreign_key "student_notes", "students"
  add_foreign_key "student_records", "proficiency_levels"
  add_foreign_key "student_records", "students"
end
