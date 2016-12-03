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

ActiveRecord::Schema.define(version: 20161203205845) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "camping_reviews", force: :cascade do |t|
    t.string   "review_content"
    t.integer  "user_id"
    t.integer  "star_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "camping_sites", force: :cascade do |t|
    t.string   "capacity"
    t.integer  "review_id"
    t.integer  "park_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hiking_reviews", force: :cascade do |t|
    t.string   "review_content"
    t.integer  "user_id"
    t.integer  "star_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hiking_trails", force: :cascade do |t|
    t.string   "address"
    t.string   "distance"
    t.integer  "difficulty"
    t.integer  "park_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "address_latitude"
    t.float    "address_longitude"
    t.string   "address_formatted_address"
  end

  create_table "parks", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "address"
    t.datetime "dates_of_operation"
    t.string   "image"
    t.string   "activities"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hiking_trails_count"
    t.integer  "camping_sites_count"
    t.float    "address_latitude"
    t.float    "address_longitude"
    t.string   "address_formatted_address"
  end

  create_table "states", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parks_count"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "username"
    t.string   "photo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "camping_reviews_count"
    t.integer  "hiking_reviews_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end