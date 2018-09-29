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

ActiveRecord::Schema.define(version: 20180929134025) do

  create_table "chat_messages", force: :cascade do |t|
    t.string   "message",      limit: 255
    t.integer  "chat_room_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "chat_messages", ["chat_room_id"], name: "fk_rails_3070841b05", using: :btree
  add_index "chat_messages", ["user_id"], name: "fk_rails_918ef7acc4", using: :btree

  create_table "chat_participants", force: :cascade do |t|
    t.integer  "chat_room_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "chat_participants", ["chat_room_id", "user_id"], name: "index_chat_participants_on_chat_room_id_and_user_id", unique: true, using: :btree
  add_index "chat_participants", ["user_id"], name: "fk_rails_dddf7ef4b2", using: :btree

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "chat_rooms", ["name"], name: "index_chat_rooms_on_name", unique: true, using: :btree

  create_table "login_sessions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "auth_token", limit: 255
    t.datetime "expires_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "login_sessions", ["user_id"], name: "fk_rails_8c949dd2cd", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "first_name",      limit: 255
    t.string "last_name",       limit: 255
    t.string "username",        limit: 255
    t.string "password",        limit: 255
    t.string "selected_avatar", limit: 255
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "chat_messages", "chat_rooms"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "chat_participants", "chat_rooms"
  add_foreign_key "chat_participants", "users"
  add_foreign_key "login_sessions", "users"
end
