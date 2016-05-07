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

ActiveRecord::Schema.define(version: 20160505193708) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "content_items", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "ad_type",     limit: 20
    t.string   "priority",    limit: 20
    t.integer  "coins",       limit: 4
    t.string   "content",     limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_active",                 default: true
    t.boolean  "is_deleted",                default: false
  end

  add_index "content_items", ["is_active"], name: "index_content_items_on_is_active", using: :btree
  add_index "content_items", ["is_deleted"], name: "index_content_items_on_is_deleted", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "paymentable_id",   limit: 4
    t.string   "paymentable_type", limit: 255
    t.integer  "user_id",          limit: 4
    t.integer  "quantity",         limit: 4,                  default: 0
    t.decimal  "price_per_unit",               precision: 10
    t.string   "method",           limit: 15
    t.decimal  "total_amount",                 precision: 10
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "payments", ["paymentable_type", "paymentable_id"], name: "index_payments_on_paymentable_type_and_paymentable_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "recorded_items", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "content_item_id", limit: 4
    t.datetime "last_viewed_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "recorded_items", ["content_item_id"], name: "index_recorded_items_on_content_item_id", using: :btree
  add_index "recorded_items", ["user_id"], name: "index_recorded_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "username",               limit: 100
    t.integer  "coins",                  limit: 4,     default: 0
    t.integer  "watched_ads",            limit: 4,     default: 0
    t.text     "address",                limit: 65535
    t.string   "phone",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visited_ads", force: :cascade do |t|
    t.string   "ad_priority", limit: 25
    t.integer  "count",       limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
