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

ActiveRecord::Schema.define(version: 2018_11_22_033438) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "cart_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musics", force: :cascade do |t|
    t.string "music_name", null: false
    t.integer "music_disk_number", null: false
    t.integer "product_id", null: false
    t.integer "music_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pro_genres", force: :cascade do |t|
    t.string "pro_genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pro_labels", force: :cascade do |t|
    t.string "pro_label_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "pro_image_id"
    t.integer "pro_price", null: false
    t.integer "pro_genre_id", null: false
    t.datetime "pro_date", null: false
    t.integer "pro_amount", null: false
    t.string "pro_title", null: false
    t.integer "pro_label_id", null: false
    t.string "pro_artist", null: false
    t.boolean "pro_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer "purchase_id", null: false
    t.integer "cart_item_id", null: false
    t.integer "sub_total", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "artist"
    t.string "image_id"
    t.integer "product_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "get_points"
    t.integer "pay_points"
    t.datetime "date", null: false
    t.integer "status", default: 0, null: false
    t.integer "cart_id", null: false
    t.integer "pur_total", null: false
    t.string "pay", null: false
    t.string "pur_name", null: false
    t.string "pur_name_kana", null: false
    t.string "pur_email", null: false
    t.string "pur_address", null: false
    t.string "pur_post_code", null: false
    t.string "pur_tell", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review_body"
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "review_star"
    t.boolean "review_status", null: false
    t.integer "review_points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.string "name_kana", null: false
    t.integer "point", default: 0
    t.string "address", null: false
    t.string "post_code", null: false
    t.string "tell", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "memo"
    t.boolean "user_status", default: true, null: false
    t.boolean "manager", default: false, null: false
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
