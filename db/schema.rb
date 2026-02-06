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

ActiveRecord::Schema[8.1].define(version: 2026_02_06_072618) do
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

  add_foreign_key "devices", "sites"
  add_foreign_key "swap_tickets", "devices"
  add_foreign_key "swap_tickets", "sites"
end
