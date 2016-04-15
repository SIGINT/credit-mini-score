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

ActiveRecord::Schema.define(version: 20160415101735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_owners", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "percentage_ownership"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "email"
    t.date     "birthdate"
    t.string   "social_security_number"
    t.string   "drivers_license_number"
    t.integer  "estimated_liquid_assets"
    t.integer  "estimated_outstanding_debt"
    t.string   "gender"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "legal_name"
    t.string   "employer_identification_number"
    t.string   "organization_type"
    t.string   "address"
    t.string   "city"
    t.string   "county"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.date     "founded_date"
    t.integer  "estimated_annual_revenue"
    t.string   "business_url"
    t.integer  "num_employees"
    t.datetime "updated_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "loan_applications", force: :cascade do |t|
    t.string   "business_id"
    t.date     "application_date"
    t.integer  "requested_principle"
    t.integer  "requested_term_months"
    t.decimal  "loan_mini_score"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "social_media_presences", force: :cascade do |t|
    t.string   "business_id"
    t.string   "business_owner_id"
    t.string   "social_media_site"
    t.string   "site_url"
    t.string   "uid"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "o_auth_token"
    t.boolean  "is_o_auth_token_active"
    t.datetime "o_auth_token_expiration"
    t.string   "provider"
  end

end
