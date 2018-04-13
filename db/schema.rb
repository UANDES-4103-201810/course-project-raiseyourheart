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

ActiveRecord::Schema.define(version: 2018_04_13_134149) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.integer "promise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_goods_on_promise_id"
  end

  create_table "media", force: :cascade do |t|
    t.integer "project_id"
    t.string "type"
    t.string "path", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_media_on_project_id"
  end

  create_table "project_data", force: :cascade do |t|
    t.decimal "amount_raised", default: "0.0"
    t.boolean "visible", default: false
    t.decimal "goal", default: "0.0"
    t.string "category"
    t.date "deadline"
    t.date "estimated_delivery_time"
    t.text "description"
    t.integer "project_id"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_data_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "promises", force: :cascade do |t|
    t.text "description"
    t.decimal "amount"
    t.date "delivery_time"
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_promises_on_project_id"
    t.index ["user_id"], name: "index_promises_on_user_id"
  end

  create_table "user_buy_promises", force: :cascade do |t|
    t.integer "user_id"
    t.integer "promise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_user_buy_promises_on_promise_id"
    t.index ["user_id"], name: "index_user_buy_promises_on_user_id"
  end

  create_table "user_fund_projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_fund_projects_on_project_id"
    t.index ["user_id"], name: "index_user_fund_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "login"
    t.string "first"
    t.string "last"
    t.string "password"
    t.string "email"
    t.string "role"
    t.string "phone"
    t.text "description"
    t.string "avatar_file_name"
    t.date "birthdate"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_wishlists_on_project_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

end
