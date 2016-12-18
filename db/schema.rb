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

ActiveRecord::Schema.define(version: 20150922024717) do

  create_table "awarenesses", force: :cascade do |t|
    t.string   "source",      limit: 255
    t.string   "url",         limit: 1024
    t.string   "meaning",     limit: 8192
    t.datetime "insert_time"
    t.datetime "update_time"
    t.integer  "users_id",    limit: 4
    t.string   "title",       limit: 255
  end

  add_index "awarenesses", ["users_id"], name: "fk_awarenesses_users1_idx", using: :btree

  create_table "awarenesses_has_information", id: false, force: :cascade do |t|
    t.integer "awarenesses_id", limit: 4, null: false
    t.integer "information_id", limit: 4, null: false
  end

  add_index "awarenesses_has_information", ["awarenesses_id"], name: "fk_awarenesses_has_information_awarenesses1_idx", using: :btree
  add_index "awarenesses_has_information", ["information_id"], name: "fk_awarenesses_has_information_information1_idx", using: :btree

  create_table "awarenesses_has_informations", id: false, force: :cascade do |t|
    t.integer "awarenesses_id", limit: 4, null: false
    t.integer "information_id", limit: 4, null: false
  end

  add_index "awarenesses_has_informations", ["awarenesses_id"], name: "fk_awarenesses_has_informations_awarenesses1_idx", using: :btree
  add_index "awarenesses_has_informations", ["information_id"], name: "fk_awarenesses_has_informations_information1_idx", using: :btree

  create_table "awarenesses_has_tags", id: false, force: :cascade do |t|
    t.integer "awarenesses_id", limit: 4, null: false
    t.integer "tags_id",        limit: 4, null: false
  end

  add_index "awarenesses_has_tags", ["awarenesses_id"], name: "fk_awarenesses_has_tags_awarenesses1_idx", using: :btree
  add_index "awarenesses_has_tags", ["tags_id"], name: "fk_awarenesses_has_tags_tags1_idx", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "content",      limit: 8192
    t.boolean  "good"
    t.boolean  "bad"
    t.datetime "insert_time"
    t.datetime "update_time"
    t.integer  "awareness_id", limit: 4,    null: false
  end

  add_index "comments", ["awareness_id"], name: "fk_comment_awareness_idx", using: :btree

  create_table "information", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "url",         limit: 1024
    t.string   "comment",     limit: 1024
    t.datetime "insert_time"
    t.datetime "update_time"
    t.integer  "users_id",    limit: 4
  end

  add_index "information", ["users_id"], name: "fk_information_users1_idx", using: :btree

  create_table "information_has_tags", id: false, force: :cascade do |t|
    t.integer "information_id", limit: 4, null: false
    t.integer "tags_id",        limit: 4, null: false
  end

  add_index "information_has_tags", ["information_id"], name: "fk_information_has_tags_information1_idx", using: :btree
  add_index "information_has_tags", ["tags_id"], name: "fk_information_has_tags_tags1_idx", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "insert_time"
    t.datetime "update_time"
    t.integer  "users_id",    limit: 4,   null: false
  end

  add_index "tags", ["users_id"], name: "fk_tags_users1_idx", using: :btree

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "awarenesses", "users", column: "users_id", name: "fk_awarenesses_users1"
  add_foreign_key "awarenesses_has_information", "awarenesses", column: "awarenesses_id", name: "fk_awarenesses_has_information_awarenesses1"
  add_foreign_key "awarenesses_has_information", "information", name: "fk_awarenesses_has_information_information1"
  add_foreign_key "awarenesses_has_informations", "awarenesses", column: "awarenesses_id", name: "fk_awarenesses_has_informations_awarenesses1"
  add_foreign_key "awarenesses_has_informations", "information", name: "fk_awarenesses_has_informations_information1"
  add_foreign_key "awarenesses_has_tags", "awarenesses", column: "awarenesses_id", name: "fk_awarenesses_has_tags_awarenesses1"
  add_foreign_key "awarenesses_has_tags", "tags", column: "tags_id", name: "fk_awarenesses_has_tags_tags1"
  add_foreign_key "comments", "awarenesses", name: "fk_comment_awareness"
  add_foreign_key "information", "users", column: "users_id", name: "fk_information_users1"
  add_foreign_key "information_has_tags", "information", name: "fk_information_has_tags_information1"
  add_foreign_key "information_has_tags", "tags", column: "tags_id", name: "fk_information_has_tags_tags1"
  add_foreign_key "tags", "users", column: "users_id", name: "fk_tags_users1"
end
