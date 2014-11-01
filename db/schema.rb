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

ActiveRecord::Schema.define(version: 20141101141015) do

  create_table "items", force: true do |t|
    t.string   "title",                              null: false
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id",                                     null: false
    t.integer  "item_id",                                      null: false
    t.decimal  "price",                precision: 8, scale: 2, null: false
    t.integer  "quantity",   limit: 2,                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.decimal  "total",           precision: 8, scale: 2, default: 0.0,   null: false
    t.decimal  "shipping_price",  precision: 5, scale: 2, default: 0.0,   null: false
    t.string   "currency",                                default: "USD", null: false
    t.decimal  "currency_rate",   precision: 8, scale: 4, default: 1.0,   null: false
    t.string   "status"
    t.string   "token"
    t.string   "coingate_id"
    t.string   "coingate_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
