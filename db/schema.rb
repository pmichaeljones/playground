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

ActiveRecord::Schema.define(version: 20211217223951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "slug",            limit: 255
    t.string   "metadescription", limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_entries", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incoming_sms", force: :cascade do |t|
    t.string   "body",        limit: 255
    t.string   "from_city",   limit: 255
    t.string   "message_sid", limit: 255
    t.string   "from_number", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",        limit: 255
    t.string   "message",     limit: 255
  end

  create_table "messages", force: :cascade do |t|
    t.text     "contents"
    t.string   "sender",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twilio_reminders", force: :cascade do |t|
    t.string   "client",       limit: 255
    t.string   "event",        limit: 255
    t.string   "phone_number", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "message_sent",             default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.jsonb    "settings",               default: {}, null: false
  end

  create_table "words", force: :cascade do |t|
    t.string   "word",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
