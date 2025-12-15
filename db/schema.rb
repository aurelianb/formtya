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

ActiveRecord::Schema[8.1].define(version: 2025_12_15_001648) do
  create_table "answers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "form_item_id", null: false
    t.integer "submission_id", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["form_item_id"], name: "index_answers_on_form_item_id"
    t.index ["submission_id"], name: "index_answers_on_submission_id"
  end

  create_table "foorms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "uuid"
  end

  create_table "form_item_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "form_item_id", null: false
    t.string "label"
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["form_item_id"], name: "index_form_item_options_on_form_item_id"
  end

  create_table "form_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "foorm_id", null: false
    t.string "item_type"
    t.text "label"
    t.datetime "updated_at", null: false
    t.index ["foorm_id"], name: "index_form_items_on_foorm_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "foorm_id", null: false
    t.string "submitter"
    t.datetime "updated_at", null: false
    t.index ["foorm_id"], name: "index_submissions_on_foorm_id"
  end

  add_foreign_key "answers", "form_items"
  add_foreign_key "answers", "submissions"
  add_foreign_key "form_item_options", "form_items"
  add_foreign_key "form_items", "foorms"
  add_foreign_key "submissions", "foorms"
end
