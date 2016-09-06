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

ActiveRecord::Schema.define(version: 20160901121558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "definition"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "term_id"
    t.integer  "user_id"
    t.boolean  "flagged"
    t.integer  "upvotes_count",   default: 0
    t.integer  "downvotes_count", default: 0
    t.integer  "score",           default: 0
  end

  add_index "answers", ["term_id"], name: "index_answers_on_term_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "downvotes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "answer_id"
  end

  add_index "downvotes", ["answer_id"], name: "index_downvotes_on_answer_id", using: :btree
  add_index "downvotes", ["user_id"], name: "index_downvotes_on_user_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "answer_id"
  end

  add_index "flags", ["answer_id"], name: "index_flags_on_answer_id", using: :btree
  add_index "flags", ["user_id"], name: "index_flags_on_user_id", using: :btree

  create_table "terms", force: :cascade do |t|
    t.string   "term_en"
    t.string   "context_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "field_id"
    t.integer  "user_id"
  end

  add_index "terms", ["field_id"], name: "index_terms_on_field_id", using: :btree
  add_index "terms", ["user_id"], name: "index_terms_on_user_id", using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "answer_id"
  end

  add_index "upvotes", ["answer_id"], name: "index_upvotes_on_answer_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "terms"
  add_foreign_key "answers", "users"
  add_foreign_key "downvotes", "answers"
  add_foreign_key "downvotes", "users"
  add_foreign_key "flags", "answers"
  add_foreign_key "flags", "users"
  add_foreign_key "terms", "fields"
  add_foreign_key "terms", "users"
  add_foreign_key "upvotes", "answers"
  add_foreign_key "upvotes", "users"
end
