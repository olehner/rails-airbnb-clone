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

ActiveRecord::Schema.define(version: 20170328153244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "street_name"
    t.string   "street_number"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "parking_spot_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["parking_spot_id"], name: "index_bookings_on_parking_spot_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_comments_on_booking_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "parking_spots", force: :cascade do |t|
    t.string   "size"
    t.float    "price_per_day"
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "photo"
    t.index ["address_id"], name: "index_parking_spots_on_address_id", using: :btree
    t.index ["user_id"], name: "index_parking_spots_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.integer  "booking_id"
    t.string   "reviewable_type"
    t.integer  "reviewable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id", using: :btree
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.text     "bio"
    t.string   "phone_number"
    t.boolean  "is_parklord"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "account_id"
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "bookings", "parking_spots"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "bookings"
  add_foreign_key "comments", "users"
  add_foreign_key "parking_spots", "addresses"
  add_foreign_key "parking_spots", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "users", "accounts"
end
