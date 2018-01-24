
ActiveRecord::Schema.define(version: 20160119215120) do

  create_table "classroom_students", force: :cascade do |t|
    t.integer  "classroom_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "course_name"
    t.string   "semester"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "hometown"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
