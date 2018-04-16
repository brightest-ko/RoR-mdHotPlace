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

ActiveRecord::Schema.define(version: 20180326031841) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user2_id"
    t.integer "hplace_id"
    t.string "place_name"
    t.string "category"
    t.string "place_delete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "hplace_id"
    t.string "place_name"
    t.string "category"
    t.string "place_delete"
    t.integer "user2_id"
    t.string "user_id"
    t.text "content"
    t.string "evalu"
    t.string "comment_photo1"
    t.string "comment_photo2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hplaces", force: :cascade do |t|
    t.string "place_name"
    t.string "place_address"
    t.string "place_call"
    t.string "site"
    t.string "optime"
    t.string "park"
    t.string "ad"
    t.string "category"
    t.text "remarks"
    t.text "intro"
    t.integer "views", default: 0, null: false
    t.float "avg_evalu", default: 0.0, null: false
    t.integer "reviewcount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place_photo1"
    t.string "place_photo2"
    t.string "place_photo3"
    t.string "place_photo4"
    t.string "place_photo5"
  end

  create_table "user2s", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_id", default: "", null: false
    t.string "user_name", default: "", null: false
    t.string "level", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "user_delete", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user2s_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user2s_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "email"
    t.string "phone"
    t.string "level"
    t.string "password_digest"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
