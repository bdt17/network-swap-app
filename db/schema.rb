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

ActiveRecord::Schema[8.1].define(version: 2026_02_19_023542) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "mac_address"
    t.string "name"
    t.bigint "site_id", null: false
    t.integer "status"
    t.integer "type"
    t.datetime "updated_at", null: false
    t.string "vendor"
    t.index ["site_id"], name: "index_devices_on_site_id"
  end

  create_table "drone_fleets", force: :cascade do |t|
    t.boolean "available"
    t.integer "battery_status"
    t.datetime "created_at", null: false
    t.string "firmware_version"
    t.string "location"
    t.string "serial_number"
    t.datetime "updated_at", null: false
  end

  create_table "inspection_logs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "drone_fleet_id", null: false
    t.text "findings"
    t.bigint "site_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["drone_fleet_id"], name: "index_inspection_logs_on_drone_fleet_id"
    t.index ["site_id"], name: "index_inspection_logs_on_site_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "drone_fleet_id", null: false
    t.text "issues"
    t.integer "severity"
    t.bigint "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_fleet_id"], name: "index_inspections_on_drone_fleet_id"
    t.index ["site_id"], name: "index_inspections_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "swap_tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "device_id", null: false
    t.datetime "scheduled_at"
    t.bigint "site_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_swap_tickets_on_device_id"
    t.index ["site_id"], name: "index_swap_tickets_on_site_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role", default: "tech"
    t.string "tech_id"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "devices", "sites"
  add_foreign_key "inspection_logs", "drone_fleets"
  add_foreign_key "inspection_logs", "sites"
  add_foreign_key "inspections", "drone_fleets"
  add_foreign_key "inspections", "sites"
  add_foreign_key "swap_tickets", "devices"
  add_foreign_key "swap_tickets", "sites"
end
