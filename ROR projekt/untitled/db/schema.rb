# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_28_192834) do
  create_table "advertises", force: :cascade do |t|
    t.integer "user_id", precision: 38
    t.integer "advert_id", precision: 38
    t.date "mikor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adverts", force: :cascade do |t|
    t.string "termek_nev"
    t.float "mennyiseg"
    t.float "ar_kg"
    t.integer "min_vasarlas", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carries", force: :cascade do |t|
    t.integer "supplier_id", precision: 38
    t.string "mit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivers", force: :cascade do |t|
    t.integer "order_id", precision: 38
    t.integer "supplier_id", precision: 38
    t.float "mennyiseg"
    t.string "hova"
    t.float "koltseg"
    t.date "varhato_szallitas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", precision: 38
    t.integer "advert_id", precision: 38
    t.integer "supplier_id", precision: 38
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer "user_id", precision: 38
    t.integer "advert_id", precision: 38
    t.integer "csillag", precision: 38
    t.text "leiras"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.float "km_ar"
    t.float "ar_kg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nev"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "advertises", "adverts"
  add_foreign_key "advertises", "users"
  add_foreign_key "carries", "suppliers"
  add_foreign_key "delivers", "orders"
  add_foreign_key "delivers", "suppliers"
  add_foreign_key "orders", "adverts"
  add_foreign_key "orders", "suppliers"
  add_foreign_key "orders", "users"
  add_foreign_key "rates", "adverts"
  add_foreign_key "rates", "users"
end
