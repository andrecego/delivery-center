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

ActiveRecord::Schema.define(version: 2021_03_18_125357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.citext "external_code", null: false
    t.string "name"
    t.citext "email", null: false
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["external_code"], name: "index_customers_on_external_code", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.citext "external_code", null: false
    t.string "name"
    t.integer "quantity"
    t.decimal "price", precision: 8, scale: 2
    t.decimal "total", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["external_code"], name: "index_items_on_external_code", unique: true
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "postal_code"
    t.string "number"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_shipping_addresses_on_customer_id"
  end

  add_foreign_key "shipping_addresses", "customers"
end
