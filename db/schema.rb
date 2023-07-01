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

ActiveRecord::Schema[7.0].define(version: 2023_07_01_235458) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "number", null: false
    t.string "neighborhood", null: false
    t.string "zipcode", null: false
    t.string "complement"
    t.string "state", null: false
    t.string "city", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_addresses_on_event_id"
  end

  create_table "event_guests", force: :cascade do |t|
    t.string "email"
    t.bigint "user_id"
    t.string "confirmation_token"
    t.bigint "event_id", null: false
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_guests_on_event_id"
    t.index ["user_id"], name: "index_event_guests_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.time "time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_format", null: false
    t.string "event_link"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "auth_token_confirmed_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_confirmed_at"
    t.integer "role", default: 1
  end

  add_foreign_key "addresses", "events"
  add_foreign_key "event_guests", "events"
  add_foreign_key "event_guests", "users"
  add_foreign_key "events", "users"
end
