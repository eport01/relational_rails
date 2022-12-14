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

ActiveRecord::Schema.define(version: 2022_10_13_175204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string "apt_name"
    t.boolean "has_wd"
    t.integer "unit_count"
    t.string "city"
    t.string "state"
    t.boolean "pet_friendly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "tenant_name"
    t.integer "income"
    t.boolean "pets"
    t.string "occupation"
    t.integer "rent_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "apartment_id"
    t.index ["apartment_id"], name: "index_tenants_on_apartment_id"
  end

  add_foreign_key "tenants", "apartments"
end
