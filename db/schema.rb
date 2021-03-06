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

ActiveRecord::Schema.define(version: 20150705051441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disembarked_passengers", force: :cascade do |t|
    t.integer  "stop_id"
    t.integer  "passenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "disembarked_passengers", ["passenger_id"], name: "index_disembarked_passengers_on_passenger_id", using: :btree
  add_index "disembarked_passengers", ["stop_id"], name: "index_disembarked_passengers_on_stop_id", using: :btree

  create_table "embarked_passengers", force: :cascade do |t|
    t.integer  "stop_id"
    t.integer  "passenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "embarked_passengers", ["passenger_id"], name: "index_embarked_passengers_on_passenger_id", using: :btree
  add_index "embarked_passengers", ["stop_id"], name: "index_embarked_passengers_on_stop_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "birthplace"
    t.string   "deathplace"
    t.datetime "birthdate"
    t.datetime "deathdate"
    t.string   "notability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.date     "launched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "stops", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "port_id"
    t.datetime "arrival"
    t.datetime "departure"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "passenger_id"
  end

  add_index "stops", ["passenger_id"], name: "index_stops_on_passenger_id", using: :btree
  add_index "stops", ["port_id"], name: "index_stops_on_port_id", using: :btree
  add_index "stops", ["voyage_id"], name: "index_stops_on_voyage_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voyages", force: :cascade do |t|
    t.integer  "ship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "voyages", ["ship_id"], name: "index_voyages_on_ship_id", using: :btree

  add_foreign_key "disembarked_passengers", "passengers"
  add_foreign_key "disembarked_passengers", "stops"
  add_foreign_key "embarked_passengers", "passengers"
  add_foreign_key "embarked_passengers", "stops"
  add_foreign_key "stops", "passengers"
  add_foreign_key "stops", "ports"
  add_foreign_key "stops", "voyages"
  add_foreign_key "voyages", "ships"
end
