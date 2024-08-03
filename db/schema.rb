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

ActiveRecord::Schema[7.0].define(version: 2024_07_29_233223) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.integer "condition_type", default: 0, null: false
    t.integer "value", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_conditions_on_user_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.float "rating"
    t.string "image"
    t.string "business_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_ratings_total"
    t.string "google_maps_place_id", null: false
  end

  create_table "favorite_destinations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_favorite_destinations_on_destination_id"
    t.index ["user_id", "destination_id"], name: "index_favorite_destinations_on_user_id_and_destination_id", unique: true
    t.index ["user_id"], name: "index_favorite_destinations_on_user_id"
  end

  create_table "future_visits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_future_visits_on_destination_id"
    t.index ["user_id", "destination_id"], name: "index_future_visits_on_user_id_and_destination_id", unique: true
    t.index ["user_id"], name: "index_future_visits_on_user_id"
  end

  create_table "safety_tips", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  create_table "visit_categories", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "conditions", "users"
  add_foreign_key "favorite_destinations", "destinations"
  add_foreign_key "favorite_destinations", "users"
  add_foreign_key "future_visits", "destinations"
  add_foreign_key "future_visits", "users"
end
