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

ActiveRecord::Schema.define(version: 20181220064205) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "chats", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "admin_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "chats_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "priority",   default: 1
  end

  add_index "chats_users", ["chat_id"], name: "index_chats_users_on_chat_id"
  add_index "chats_users", ["user_id"], name: "index_chats_users_on_user_id"

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "read_flags", force: :cascade do |t|
    t.boolean  "flag"
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "robots", force: :cascade do |t|
    t.integer  "robot_id"
    t.integer  "response_times"
    t.float    "total_time"
    t.integer  "solve_times"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "role",            default: 1
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "sex",             default: "secret"
    t.string   "phonenumber",     default: ""
    t.string   "status",          default: "user"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name"

end
