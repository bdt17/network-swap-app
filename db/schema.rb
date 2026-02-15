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

ActiveRecord::Schema[8.1].define(version: 2026_02_15_200121) do
  create_table "audit_logs", force: :cascade do |t|
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.json "metadata", default: {}, null: false
    t.integer "swap_ticket_id", null: false
    t.datetime "timestamp", null: false
    t.datetime "updated_at", null: false
    t.index ["swap_ticket_id"], name: "index_audit_logs_on_swap_ticket_id"
  end

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "device_id"
    t.string "hostname"
    t.string "inventory_tag"
    t.string "name"
    t.string "rack_name"
    t.integer "rack_unit"
    t.integer "site_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.string "vendor"
    t.index ["device_id"], name: "index_devices_on_device_id", unique: true
    t.index ["site_id"], name: "index_devices_on_site_id"
  end

  create_table "drone_fleets", force: :cascade do |t|
    t.boolean "available"
    t.integer "battery_status"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "firmware_version"
    t.string "location"
    t.string "name"
    t.string "serial_number"
    t.datetime "updated_at", null: false
    t.integer "vendor"
  end

  create_table "drones", force: :cascade do |t|
    t.integer "battery_level"
    t.datetime "created_at", null: false
    t.integer "drone_fleet_id", null: false
    t.string "name"
    t.boolean "online"
    t.integer "site_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.string "vendor_identifier"
    t.index ["drone_fleet_id"], name: "index_drones_on_drone_fleet_id"
    t.index ["site_id"], name: "index_drones_on_site_id"
  end

  create_table "field_tech_locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "field_tech_id", null: false
    t.float "lat"
    t.float "lng"
    t.datetime "timestamp"
    t.datetime "updated_at", null: false
    t.index ["field_tech_id"], name: "index_field_tech_locations_on_field_tech_id"
  end

  create_table "field_teches", force: :cascade do |t|
    t.string "ar_glasses_token"
    t.datetime "created_at", null: false
    t.float "gps_lat"
    t.float "gps_lng"
    t.datetime "updated_at", null: false
  end

  create_table "field_techs", force: :cascade do |t|
    t.string "ar_glasses_token"
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.float "gps_lat"
    t.float "gps_lng"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["ar_glasses_token"], name: "index_field_techs_on_ar_glasses_token", unique: true
    t.index ["email"], name: "index_field_techs_on_email", unique: true
  end

  create_table "inspections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "drone_fleet_id", null: false
    t.text "issues"
    t.integer "severity"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_fleet_id"], name: "index_inspections_on_drone_fleet_id"
    t.index ["site_id"], name: "index_inspections_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.text "address"
    t.string "code"
    t.datetime "created_at", null: false
    t.decimal "distance_km_from_hub"
    t.string "name"
    t.string "region"
    t.datetime "updated_at", null: false
  end

  create_table "swap_tickets", force: :cascade do |t|
    t.integer "assigned_tech_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.integer "device_id", null: false
    t.text "notes"
    t.datetime "scheduled_at", null: false
    t.integer "site_id", null: false
    t.string "status", default: "scheduled", null: false
    t.integer "tech_id"
    t.string "tech_status"
    t.datetime "updated_at", null: false
    t.string "vendor", null: false
    t.index ["device_id"], name: "index_swap_tickets_on_device_id", unique: true
    t.index ["site_id"], name: "index_swap_tickets_on_site_id"
  end

  create_table "teches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.integer "role"
    t.integer "site_id"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role"
    t.string "tech_id"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audit_logs", "swap_tickets"
  add_foreign_key "devices", "sites"
  add_foreign_key "drones", "drone_fleets"
  add_foreign_key "drones", "sites"
  add_foreign_key "field_tech_locations", "field_teches"
  add_foreign_key "inspections", "drone_fleets"
  add_foreign_key "inspections", "sites"
  add_foreign_key "swap_tickets", "sites"
end
