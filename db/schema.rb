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

ActiveRecord::Schema.define(version: 20150227184051) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "genre_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "views_count", default: 0
  end

  add_index "articles", ["created_at", "views_count", "genre_id"], name: "index_articles_on_created_at_and_views_count_and_genre_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.integer  "amount",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reviews", force: true do |t|
    t.text     "content"
    t.string   "user"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["article_id", "created_at"], name: "index_reviews_on_article_id_and_created_at"
  add_index "reviews", ["article_id"], name: "index_reviews_on_article_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
