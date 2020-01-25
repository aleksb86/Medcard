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

ActiveRecord::Schema.define(version: 2020_01_23_151226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.date "birth_date"
    t.string "chronic_diseases"
    t.string "vital_medicines"
    t.string "disability_group_details"
    t.string "allergy_to_drugs"
    t.integer "disability_group"
    t.integer "blood_type"
    t.uuid "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["uid"], name: "index_cards_on_uid", unique: true
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "consultations", force: :cascade do |t|
    t.string "doctor_full_name"
    t.string "doctor_speciality"
    t.string "ds"
    t.string "description"
    t.bigint "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["note_id"], name: "index_consultations_on_note_id"
  end

  create_table "examination_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_examination_types_on_name", unique: true
  end

  create_table "examinations", force: :cascade do |t|
    t.string "description"
    t.bigint "examination_type_id"
    t.bigint "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["examination_type_id"], name: "index_examinations_on_examination_type_id"
    t.index ["note_id"], name: "index_examinations_on_note_id"
  end

  create_table "image_documents", force: :cascade do |t|
    t.string "name", null: false
    t.string "md5", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "note_id"
    t.index ["md5"], name: "index_image_documents_on_md5", unique: true
    t.index ["note_id"], name: "index_image_documents_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "kind", default: 0, null: false
    t.bigint "card_id"
    t.bigint "category_id"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["card_id"], name: "index_notes_on_card_id"
    t.index ["category_id"], name: "index_notes_on_category_id"
    t.index ["parent_id"], name: "index_notes_on_parent_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "pdf_documents", force: :cascade do |t|
    t.string "name", null: false
    t.string "md5", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "note_id"
    t.index ["md5"], name: "index_pdf_documents_on_md5", unique: true
    t.index ["note_id"], name: "index_pdf_documents_on_note_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "phone", null: false
    t.string "password_digest"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "cards", "users"
  add_foreign_key "consultations", "notes"
  add_foreign_key "examinations", "examination_types"
  add_foreign_key "examinations", "notes"
  add_foreign_key "image_documents", "notes"
  add_foreign_key "notes", "cards"
  add_foreign_key "notes", "categories"
  add_foreign_key "notes", "users"
  add_foreign_key "pdf_documents", "notes"
end
