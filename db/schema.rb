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

ActiveRecord::Schema[7.0].define(version: 2022_06_12_001132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_number"
    t.integer "DNI"
    t.integer "expenses", default: 0
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_clients_on_room_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "price", default: 0.0
    t.integer "amount", default: 0
    t.text "description"
    t.boolean "primer", default: false
    t.string "type"
    t.boolean "state", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "client_id", null: false
    t.integer "place", default: 0
    t.integer "state", default: 0
    t.boolean "paid", default: false
    t.integer "amount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["food_id"], name: "index_orders_on_food_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "beds_number"
    t.float "price", default: 0.0
    t.boolean "state", default: true
    t.string "type"
    t.integer "num_room"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "rooms"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "foods"
end
