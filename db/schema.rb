# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160423225146) do

  create_table "connection_retailers", force: :cascade do |t|
    t.integer  "retailer_id"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
  end

  create_table "connection_suppliers", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "carrier"
    t.string   "street_address"
    t.string   "apt_suite"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "supplier_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email"
  end

  create_table "fuel_formulas", force: :cascade do |t|
    t.string   "fuel"
    t.decimal  "margin"
    t.integer  "retailer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fuel_prices", force: :cascade do |t|
    t.integer  "supplier_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "expired",     default: false
  end

  create_table "fuel_products", force: :cascade do |t|
    t.string   "fuel"
    t.decimal  "price"
    t.integer  "fuel_price_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pricerockets", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "to"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
  end

  create_table "retail_prices", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "retailer_id"
  end

  create_table "retail_products", force: :cascade do |t|
    t.string   "fuel"
    t.decimal  "price"
    t.integer  "retail_price_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "brand"
    t.string   "business_name"
    t.string   "tax_id"
    t.string   "phone_number"
    t.string   "contact_person"
    t.string   "cell_number"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "station_reg_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "retailer_id"
  end

  create_table "tanks", force: :cascade do |t|
    t.string   "type_of_fuel"
    t.string   "size"
    t.string   "registration_id"
    t.integer  "station_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "tanks", ["station_id"], name: "index_tanks_on_station_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "street_address"
    t.string   "apt_suite"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "tax_id"
    t.string   "ssn"
    t.string   "account_number"
    t.string   "in_biz"
    t.integer  "role",             default: 0
    t.integer  "status",           default: 0
    t.boolean  "terms",            default: false
  end

  add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
