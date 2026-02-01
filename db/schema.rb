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

ActiveRecord::Schema[8.1].define(version: 2026_02_01_184942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "audit_logs", force: :cascade do |t|
    t.bigint "auditable_id"
    t.string "auditable_type"
    t.datetime "created_at", null: false
    t.string "event", null: false
    t.jsonb "payload", default: {}
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["auditable_type", "auditable_id"], name: "index_audit_logs_on_auditable"
    t.index ["auditable_type", "auditable_id"], name: "index_audit_logs_on_auditable_type_and_auditable_id"
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "mac_address"
    t.string "model"
    t.bigint "site_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.date "warranty_expires"
    t.index ["mac_address"], name: "index_devices_on_mac_address", unique: true
    t.index ["site_id"], name: "index_devices_on_site_id"
  end

  create_table "devices_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "mac_address"
    t.string "model"
    t.integer "site_id"
    t.string "status"
    t.datetime "updated_at", null: false
    t.date "warranty_expires"
    t.index ["mac_address"], name: "index_devices_tables_on_mac_address", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "timezone"
    t.datetime "updated_at", null: false
  end

  create_table "sites_tables", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "timezone"
    t.datetime "updated_at", null: false
  end

  create_table "swap_tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "device_id", null: false
    t.text "notes"
    t.date "scheduled_for"
    t.bigint "site_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_swap_tickets_on_device_id"
    t.index ["site_id"], name: "index_swap_tickets_on_site_id"
  end

  create_table "swap_tickets_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "device_id"
    t.text "notes"
    t.date "scheduled_for"
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
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audit_logs", "users"
  add_foreign_key "devices", "sites"
  add_foreign_key "swap_tickets", "devices"
  add_foreign_key "swap_tickets", "sites"
end
