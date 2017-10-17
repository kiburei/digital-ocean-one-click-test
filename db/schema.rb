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

ActiveRecord::Schema.define(version: 20171017120806) do

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.string   "facility_layouts"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "hotel_id"
    t.string   "description"
    t.string   "capacity"
    t.decimal  "price",            precision: 11, scale: 2
    t.string   "internet"
    t.boolean  "parking"
    t.boolean  "accomodation"
    t.boolean  "swimming_pool"
    t.boolean  "pa_system"
    t.boolean  "bar"
    t.index ["hotel_id"], name: "index_facilities_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "county"
    t.integer  "star"
    t.string   "type"
    t.string   "phone"
    t.string   "postal_code"
    t.string   "company_postal_code"
    t.string   "hotel_manager_first_name"
    t.string   "hotel_manager_last_name"
    t.string   "hotel_manager_phone"
    t.         "description"
    t.index ["email"], name: "index_hotels_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hotels_on_reset_password_token", unique: true
  end

  create_table "installs", force: :cascade do |t|
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
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "hotel_id"
    t.integer  "facility_id"
    t.index ["facility_id"], name: "index_photos_on_facility_id"
    t.index ["hotel_id"], name: "index_photos_on_hotel_id"
  end

end
