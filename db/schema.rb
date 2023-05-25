# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_25_100756) do
  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "employ_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_supportive_teches", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "tech_stack_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_supportive_teches_on_profile_id"
    t.index ["tech_stack_id"], name: "index_profile_supportive_teches_on_tech_stack_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "email"
    t.string "contact"
    t.string "gender"
    t.string "skill"
    t.string "address"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_profiles_on_candidate_id"
  end

  create_table "project_core_teches", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "tech_stack_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_core_teches_on_project_id"
    t.index ["tech_stack_id"], name: "index_project_core_teches_on_tech_stack_id"
  end

  create_table "project_supportive_techs", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "tech_stack_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_supportive_techs_on_project_id"
    t.index ["tech_stack_id"], name: "index_project_supportive_techs_on_tech_stack_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tech_stacks", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "profile_supportive_teches", "profiles"
  add_foreign_key "profile_supportive_teches", "tech_stacks"
  add_foreign_key "profiles", "candidates"
  add_foreign_key "project_core_teches", "projects"
  add_foreign_key "project_core_teches", "tech_stacks"
  add_foreign_key "project_supportive_techs", "projects"
  add_foreign_key "project_supportive_techs", "tech_stacks"
end
