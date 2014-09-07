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

ActiveRecord::Schema.define(version: 20140907145524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ballots", force: true do |t|
    t.date     "election_date"
    t.string   "state"
    t.string   "county"
    t.string   "city"
    t.integer  "ward"
    t.integer  "precinct"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "official_ballot"
    t.integer  "ballot_columns"
    t.integer  "voter_id"
  end

  create_table "ballots_offices", force: true do |t|
    t.integer "ballot_id"
    t.integer "office_id"
  end

  create_table "notes", force: true do |t|
    t.integer  "politician_id"
    t.string   "note"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offices", force: true do |t|
    t.string   "tier"
    t.string   "office"
    t.string   "district"
    t.string   "territory"
    t.string   "term_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "terms"
    t.integer  "ballot_column"
    t.integer  "simultaneous_seatholders"
  end

  create_table "offices_politicians", force: true do |t|
    t.integer "office_id"
    t.integer "politician_id"
  end

  create_table "politicians", force: true do |t|
    t.string   "name"
    t.string   "party"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voters", ["email"], name: "index_voters_on_email", unique: true, using: :btree
  add_index "voters", ["reset_password_token"], name: "index_voters_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "voter_id"
    t.integer  "ballot_id"
    t.integer  "office_id"
    t.integer  "politician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
