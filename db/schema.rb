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

ActiveRecord::Schema.define(version: 2018_07_04_082555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dwellings", force: :cascade do |t|
    t.string "abs_ssc"
    t.integer "num_houses"
    t.integer "num_townhouses"
    t.integer "num_flats"
    t.integer "num_others"
    t.integer "tot_dwellings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string "abs_ssc"
    t.integer "tot_families"
    t.integer "no_kids"
    t.integer "kids_u15"
    t.integer "kids_over15"
    t.integer "tot_single_parent_families"
    t.integer "single_parent_kids_u15"
    t.integer "single_parent_kids_over15"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeownerships", force: :cascade do |t|
    t.string "abs_ssc"
    t.integer "total_dwellings"
    t.integer "outright_total"
    t.integer "outright_houses"
    t.integer "outright_townhouses"
    t.integer "outright_flats"
    t.integer "mortgage_total"
    t.integer "mortgage_houses"
    t.integer "mortgage_townhouses"
    t.integer "mortgage_flats"
    t.integer "rented_total"
    t.integer "rented_houses"
    t.integer "rented_townhouses"
    t.integer "rented_flats"
    t.integer "others_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_locations", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "suburb"
    t.string "state"
    t.integer "postcode"
    t.string "sector"
    t.string "school_type"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_profiles", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "suburb"
    t.string "state"
    t.integer "postcode"
    t.string "sector"
    t.string "school_type"
    t.string "website"
    t.string "year_range"
    t.integer "teaching_staff"
    t.integer "non_teaching_staff"
    t.integer "total_enrolments"
    t.integer "girls_enrolments"
    t.integer "boys_enrolments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snapshots", force: :cascade do |t|
    t.string "abs_ssc"
    t.integer "median_age"
    t.integer "median_monthly_mortgage_payments"
    t.integer "median_weekly_rental_payments"
    t.integer "median_individual_income"
    t.integer "median_household_income"
    t.float "avg_household_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suburbs", force: :cascade do |t|
    t.string "abs_ssc"
    t.string "name"
    t.string "state"
    t.float "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
