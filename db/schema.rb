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

ActiveRecord::Schema.define(version: 20151025000253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string   "plate"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "available"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "drivers", ["available"], name: "index_drivers_on_available", using: :btree
  add_index "drivers", ["latitude", "longitude"], name: "index_drivers_on_latitude_and_longitude", using: :btree

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "driver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["driver_id"], name: "index_locations_on_driver_id", using: :btree
  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", using: :btree

  add_foreign_key "locations", "drivers"
end
