# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_25_051735) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", id: :string, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "department_id"
    t.integer "credit"
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "school_id"
    t.index ["school_id"], name: "index_departments_on_school_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.boolean "is_part_time"
    t.integer "departments_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["departments_id"], name: "index_faculties_on_departments_id"
  end

  create_table "holds", force: :cascade do |t|
    t.string "hold_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "majors", force: :cascade do |t|
    t.integer "department_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_majors_on_department_id"
  end

  create_table "minors", force: :cascade do |t|
    t.integer "department_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_minors_on_department_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "dean"
    t.string "assistant_dean"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "faculty"
    t.string "timeslot"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "semester_id", null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["semester_id"], name: "index_sections_on_semester_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "year"
    t.string "season"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_has_hold", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "hold_id", null: false
    t.index ["hold_id"], name: "index_student_has_hold_on_hold_id"
    t.index ["student_id"], name: "index_student_has_hold_on_student_id"
  end

  create_table "student_has_major", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "major_id", null: false
    t.index ["student_id", "major_id"], name: "index_student_has_major_on_student_id_and_major_id", unique: true
  end

  create_table "student_has_minor", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "minor_id", null: false
    t.index ["minor_id"], name: "index_student_has_minor_on_minor_id"
    t.index ["student_id"], name: "index_student_has_minor_on_student_id", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.boolean "is_part_time"
    t.boolean "is_graduate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "admins", "users", column: "id"
  add_foreign_key "courses", "departments"
  add_foreign_key "departments", "schools"
  add_foreign_key "faculties", "departments", column: "departments_id"
  add_foreign_key "faculties", "users", column: "id"
  add_foreign_key "majors", "departments"
  add_foreign_key "minors", "departments"
  add_foreign_key "researchers", "users", column: "id"
  add_foreign_key "sections", "courses"
  add_foreign_key "sections", "semesters"
  add_foreign_key "students", "users", column: "id"
end
