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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "assortments", :force => true do |t|
    t.integer  "product_id"
    t.integer  "organization_id"
    t.integer  "stock"
    t.decimal  "price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "employments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "role"
    t.boolean  "is_head_contact"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "opening_hours", :force => true do |t|
    t.string  "type"
    t.time    "from"
    t.time    "to"
    t.string  "day"
    t.date    "date"
    t.integer "organization_id"
  end

  create_table "order_lines", :force => true do |t|
    t.integer "quantity"
    t.decimal "price"
    t.integer "product_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "telephone"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "container"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "telephone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
