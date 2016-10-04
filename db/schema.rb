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

ActiveRecord::Schema.define(version: 20161004115300) do

  create_table "turns", force: true do |t|
    t.integer  "tmp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "phone"
    t.string   "carname"
    t.string   "image"
    t.string   "rail"
    t.string   "record",     default: ""
    t.integer  "group"
    t.string   "content",    default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
