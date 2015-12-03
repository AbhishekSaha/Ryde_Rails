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

ActiveRecord::Schema.define(version: 20151203014911) do

  create_table "INVENTORY", primary_key: "VIN", force: :cascade do |t|
    t.string "MAKE", limit: 30, null: false
    t.string "MODEL", limit: 30, null: false
    t.string "TYPE", limit: 50, null: false
    t.integer "YEAR", limit: 4, null: false
    t.string "COLOR", limit: 30, null: false
    t.string "USED", limit: 10, null: false
    t.integer "MILES", limit: 4, null: false
    t.integer "KBBVALUE", limit: 4, null: false
    t.integer "RENTALPRICE", limit: 4, null: false
    t.integer "MPG", limit: 4, null: false
    t.string "SELLERID", limit: 60, null: false
  end

  create_table "caroptions", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "text", limit: 65535
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "csvTest", id: false, force: :cascade do |t|
    t.string "VIN", limit: 17
    t.string "Make", limit: 30
    t.string "Model", limit: 30
    t.string "Type", limit: 30
    t.integer "Year", limit: 4
    t.string "Color", limit: 20
    t.integer "Miles", limit: 4
    t.string "UsedNew", limit: 10
    t.integer "KBB", limit: 4
    t.integer "RentalPrice", limit: 4
    t.integer "MPG", limit: 4
    t.string "SellerID", limit: 20
  end

  create_table "options", primary_key: "VIN", force: :cascade do |t|
    t.string "LEATHER", limit: 45
    t.string "4WD", limit: 45
    t.string "FOGLIGHTS", limit: 45
    t.string "DVD", limit: 45
    t.string "SURROUND", limit: 45
  end

end
