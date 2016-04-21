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

ActiveRecord::Schema.define(version: 20160421102933) do

  create_table "items", force: :cascade do |t|
    t.string   "item_title",       limit: 255
    t.decimal  "budget",                         precision: 10
    t.decimal  "amount_spent",                   precision: 10
    t.decimal  "balance_left",                   precision: 10
    t.decimal  "percentage_spent",               precision: 10
    t.text     "comments",         limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_title",      limit: 255
    t.string   "project_acronym",    limit: 255
    t.string   "project_director",   limit: 255
    t.string   "funding_agency",     limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "total_budget",                   precision: 10
    t.decimal  "total_amount_spent",             precision: 10
    t.string   "account_number",     limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "task_title",        limit: 255
    t.text     "description",       limit: 65535
    t.date     "due_date"
    t.date     "date_accomplished"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
