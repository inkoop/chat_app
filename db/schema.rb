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

ActiveRecord::Schema.define(version: 20151229062515) do

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_public"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "token",      limit: 255
  end

  add_index "chat_rooms", ["token"], name: "index_chat_rooms_on_token", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.integer  "chat_room_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "invites", ["chat_room_id"], name: "index_invites_on_chat_room_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.datetime "time"
    t.integer  "user_id",      limit: 4
    t.integer  "chat_room_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "messages", ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "uploadfiles", force: :cascade do |t|
    t.text     "filepath",     limit: 65535
    t.datetime "time"
    t.integer  "user_id",      limit: 4
    t.integer  "chat_room_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "uploadfiles", ["chat_room_id"], name: "index_uploadfiles_on_chat_room_id", using: :btree
  add_index "uploadfiles", ["user_id"], name: "index_uploadfiles_on_user_id", using: :btree

  create_table "user_chat_rooms", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "chat_room_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_chat_rooms", ["chat_room_id"], name: "index_user_chat_rooms_on_chat_room_id", using: :btree
  add_index "user_chat_rooms", ["user_id"], name: "index_user_chat_rooms_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  add_foreign_key "invites", "chat_rooms"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "uploadfiles", "chat_rooms"
  add_foreign_key "uploadfiles", "users"
  add_foreign_key "user_chat_rooms", "chat_rooms"
  add_foreign_key "user_chat_rooms", "users"
end
