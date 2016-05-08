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

ActiveRecord::Schema.define(version: 20160504145504) do

  create_table "items", force: :cascade do |t|
    t.integer  "project_id",       limit: 4
    t.string   "item_title",       limit: 255
    t.decimal  "budget",                         precision: 10
    t.decimal  "amount_spent",                   precision: 10
    t.decimal  "balance_left",                   precision: 10
    t.decimal  "percentage_spent",               precision: 10
    t.text     "comments",         limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "items", ["project_id"], name: "index_items_on_project_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "project_id", limit: 4
    t.integer  "staff_id",   limit: 4
  end

  create_table "kpa_clusters", force: :cascade do |t|
    t.string   "kpa_title",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_title",            limit: 255
    t.string   "project_acronym",          limit: 255
    t.string   "project_director",         limit: 255
    t.string   "funding_agency",           limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "total_budget",                         precision: 10
    t.decimal  "total_amount_spent",                   precision: 10
    t.string   "account_number",           limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "kpa_cluster_id",           limit: 4
    t.string   "summary_filename",         limit: 255
    t.string   "brief_filename",           limit: 255
    t.string   "project_summary_filename", limit: 255
    t.string   "project_brief_filename",   limit: 255
  end

  add_index "projects", ["kpa_cluster_id"], name: "index_projects_on_kpa_cluster_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.float    "expenditure", limit: 24
    t.text     "comments",    limit: 65535
    t.integer  "item_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "records", ["item_id"], name: "index_records_on_item_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name",               limit: 255
    t.string   "last_name",                limit: 255
    t.date     "contract_expiration_date"
    t.string   "email",                    limit: 255, default: "",    null: false
    t.string   "encrypted_password",       limit: 255, default: "",    null: false
    t.string   "reset_password_token",     limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",       limit: 255
    t.string   "last_sign_in_ip",          limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.boolean  "admin",                                default: false
  end

  add_index "staffs", ["email"], name: "index_staffs_on_email", unique: true, using: :btree
  add_index "staffs", ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "project_id",        limit: 4
    t.string   "task_title",        limit: 255
    t.text     "description",       limit: 65535
    t.date     "due_date"
    t.date     "date_accomplished"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  create_table "updates", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.boolean  "read"
    t.datetime "expiry"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "project_id", limit: 4
  end

  add_index "updates", ["project_id"], name: "index_updates_on_project_id", using: :btree

  add_foreign_key "projects", "kpa_clusters"
  add_foreign_key "records", "items"
end
