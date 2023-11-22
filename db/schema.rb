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

ActiveRecord::Schema[7.0].define(version: 2023_11_22_130808) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "air_pollution_datapoints", force: :cascade do |t|
    t.integer "air_quality_index", limit: 2, null: false
    t.float "co"
    t.float "no"
    t.float "no2"
    t.float "o3"
    t.float "so2"
    t.float "pm2_5"
    t.float "pm10"
    t.float "nh3"
    t.datetime "recorded_at", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_air_pollution_datapoints_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.geography "latlon", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_locations_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "air_pollution_datapoints", "locations"
  add_foreign_key "locations", "states"
end
