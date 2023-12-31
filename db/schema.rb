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

ActiveRecord::Schema[7.0].define(version: 2023_08_31_110605) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "employ_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
    t.string "updated_by"
  end

  create_table "company_experiences", force: :cascade do |t|
    t.integer "curriculum_vitae_id", null: false
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "role"
    t.index ["curriculum_vitae_id"], name: "index_company_experiences_on_curriculum_vitae_id"
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "objective"
    t.string "profile_desc"
    t.integer "experience"
    t.string "template_name"
    t.integer "candidate_id"
    t.string "created_by"
    t.string "updated_by"
    t.index ["candidate_id"], name: "index_curriculum_vitaes_on_candidate_id"
  end

  create_table "cv_downloaded_data", force: :cascade do |t|
    t.integer "cv_id", null: false
    t.boolean "pdf_downloaded"
    t.boolean "doc_downloaded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_cv_downloaded_data_on_cv_id"
  end

  create_table "cv_projects", force: :cascade do |t|
    t.integer "curriculum_vitae_id", null: false
    t.integer "original_project_id"
    t.string "title"
    t.text "desc"
    t.date "start_date"
    t.date "end_date"
    t.integer "team_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "responsibility"
    t.index ["curriculum_vitae_id"], name: "index_cv_projects_on_curriculum_vitae_id"
    t.index ["original_project_id"], name: "index_cv_projects_on_original_project_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
    t.string "updated_by"
  end

  create_table "linkable_core_teches", force: :cascade do |t|
    t.integer "tech_stack_id"
    t.string "connectable_type"
    t.integer "connectable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connectable_type", "connectable_id"], name: "index_linkable_core_teches_on_connectable"
    t.index ["tech_stack_id"], name: "index_linkable_core_teches_on_tech_stack_id"
  end

  create_table "linkable_domains", force: :cascade do |t|
    t.integer "domain_id", null: false
    t.string "connectable_type", null: false
    t.integer "connectable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connectable_type", "connectable_id"], name: "index_linkable_domains_on_connectable"
    t.index ["domain_id"], name: "index_linkable_domains_on_domain_id"
  end

  create_table "linkable_supportive_teches", force: :cascade do |t|
    t.integer "tech_stack_id"
    t.string "connectable_type"
    t.integer "connectable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connectable_type", "connectable_id"], name: "index_linkable_supportive_teches_on_connectable"
    t.index ["tech_stack_id"], name: "index_linkable_supportive_teches_on_tech_stack_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "email"
    t.string "contact"
    t.string "gender"
    t.string "address"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_profiles_on_candidate_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "team_size"
    t.string "created_by"
    t.string "updated_by"
  end

  create_table "tech_stacks", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tech_type"
    t.string "created_by"
    t.string "updated_by"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "company_experiences", "curriculum_vitaes"
  add_foreign_key "curriculum_vitaes", "candidates"
  add_foreign_key "cv_downloaded_data", "curriculum_vitaes", column: "cv_id"
  add_foreign_key "cv_projects", "curriculum_vitaes"
  add_foreign_key "cv_projects", "projects", column: "original_project_id"
  add_foreign_key "linkable_core_teches", "tech_stacks"
  add_foreign_key "linkable_domains", "domains"
  add_foreign_key "linkable_supportive_teches", "tech_stacks"
  add_foreign_key "profiles", "candidates"
end
