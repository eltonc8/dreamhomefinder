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

ActiveRecord::Schema.define(version: 20151106203609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "features", force: :cascade do |t|
    t.decimal  "lat",        precision: 18, scale: 15, null: false
    t.decimal  "lng",        precision: 18, scale: 15, null: false
    t.integer  "price",                                null: false
    t.integer  "bedrooms",                             null: false
    t.integer  "bathrooms",                            null: false
    t.integer  "sq_ft",                                null: false
    t.string   "status",                               null: false
    t.string   "street",                               null: false
    t.string   "identity",                             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "features", ["bathrooms"], name: "index_features_on_bathrooms", using: :btree
  add_index "features", ["bedrooms"], name: "index_features_on_bedrooms", using: :btree
  add_index "features", ["lat"], name: "index_features_on_lat", using: :btree
  add_index "features", ["lng"], name: "index_features_on_lng", using: :btree
  add_index "features", ["price"], name: "index_features_on_price", using: :btree
  add_index "features", ["sq_ft"], name: "index_features_on_sq_ft", using: :btree

end
