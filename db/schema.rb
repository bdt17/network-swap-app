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

ActiveRecord::Schema[8.1].define(version: 2026_02_28_210440) do
  create_table "audit_events", force: :cascade do |t|
    t.integer "actor_id"
    t.string "actor_type"
    t.json "changes_json"
    t.datetime "created_at", null: false
    t.string "event_type"
    t.string "ip"
    t.integer "subject_id"
    t.string "subject_type"
    t.datetime "updated_at", null: false
    t.text "user_agent"
  end

  create_table "audit_records", force: :cascade do |t|
    t.integer "actor_id"
    t.string "actor_type"
    t.json "changes_json"
    t.datetime "created_at", null: false
    t.string "event_type"
    t.string "ip"
    t.integer "subject_id"
    t.string "subject_type"
    t.datetime "updated_at", null: false
    t.text "user_agent"
  end

  create_table "drone_fleets", force: :cascade do |t|
    t.string "api_key"
    t.integer "battery_level"
    t.datetime "created_at", null: false
    t.string "current_assignment"
    t.datetime "last_seen"
    t.string "make"
    t.string "manufacturer"
    t.string "model"
    t.integer "site_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.string "video_stream_url"
    t.index ["site_id"], name: "index_drone_fleets_on_site_id"
  end

  create_table "drone_inspections", force: :cascade do |t|
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.json "inspection_report"
    t.integer "site_id", null: false
    t.datetime "started_at"
    t.string "status"
    t.integer "swap_ticket_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_drone_inspections_on_site_id"
    t.index ["swap_ticket_id"], name: "index_drone_inspections_on_swap_ticket_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "swap_tickets", force: :cascade do |t|
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "requested_at"
    t.integer "site_id", null: false
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_swap_tickets_on_site_id"
  end

  add_foreign_key "drone_fleets", "sites"
  add_foreign_key "drone_inspections", "sites"
  add_foreign_key "drone_inspections", "swap_tickets"
  add_foreign_key "swap_tickets", "sites"
end
