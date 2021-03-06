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

ActiveRecord::Schema.define(version: 20161208075319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name", using: :btree
  end

  create_table "conditions", force: :cascade do |t|
    t.date     "measurement_date"
    t.float    "max_temperature_f"
    t.float    "mean_temperature_f"
    t.float    "min_temperature_f"
    t.float    "humidity_percent"
    t.float    "visibility_miles"
    t.float    "mean_wind_speed_mph"
    t.float    "precipitation_inches"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "dock_count"
    t.date     "installation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "city_id"
    t.index ["city_id"], name: "index_stations_on_city_id", using: :btree
    t.index ["name"], name: "index_stations_on_name", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "duration_in_seconds"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.integer  "bike_id"
    t.integer  "zipcode_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "subscription_id"
    t.index ["bike_id"], name: "index_trips_on_bike_id", using: :btree
    t.index ["end_station_id"], name: "index_trips_on_end_station_id", using: :btree
    t.index ["start_station_id"], name: "index_trips_on_start_station_id", using: :btree
    t.index ["subscription_id"], name: "index_trips_on_subscription_id", using: :btree
    t.index ["zipcode_id"], name: "index_trips_on_zipcode_id", using: :btree
  end

  create_table "zipcodes", force: :cascade do |t|
    t.integer  "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zipcode"], name: "index_zipcodes_on_zipcode", using: :btree
  end

end
