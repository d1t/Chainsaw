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

ActiveRecord::Schema.define(version: 20160105100121) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "quantity",     default: 1
    t.integer  "line_item_id"
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["line_item_id"], name: "index_line_items_on_line_item_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "partners", ["email"], name: "index_partners_on_email", unique: true
  add_index "partners", ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "quantity"
    t.string   "category"
    t.string   "subcategory"
    t.string   "image"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "store_id"
  end

  add_index "products", ["store_id"], name: "index_products_on_store_id"

  create_table "stores", force: :cascade do |t|
    t.integer  "product_quantity"
    t.integer  "price"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "partner_id"
    t.string   "brand_bio"
    t.string   "brand_name"
  end

  add_index "stores", ["partner_id"], name: "index_stores_on_partner_id"

end
