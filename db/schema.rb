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

ActiveRecord::Schema[8.1].define(version: 2026_02_10_194104) do
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

  add_foreign_key "audit_logs", "swap_tickets"
  add_foreign_key "devices", "sites"
  add_foreign_key "drones", "drone_fleets"
  add_foreign_key "drones", "sites"
  add_foreign_key "swap_tickets", "sites"
end
