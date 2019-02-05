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

ActiveRecord::Schema.define(version: 2019_01_26_151436) do

  create_table "brands", force: :cascade do |t|
    t.string "brand_cd"
    t.string "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.string "item_cd"
    t.string "item_name"
    t.string "image"
    t.integer "price"
    t.string "item_describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand_cd"
    t.integer "number"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_cd"
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_cd"
    t.string "item_name"
    t.string "image"
    t.integer "price"
    t.string "item_describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand_cd"
    t.string "category_cd"
  end

# Could not dump table "order_details" because of following StandardError
#   Unknown type '' for column 'item_name'

  create_table "titles", force: :cascade do |t|
    t.string "name"
    t.date "sale_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_kana_name"
    t.string "tel"
    t.string "zip"
    t.string "pref"
    t.string "addr01"
    t.string "addr02"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
