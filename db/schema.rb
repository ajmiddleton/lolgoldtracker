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

ActiveRecord::Schema.define(version: 20140916204738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_timelines", force: true do |t|
    t.float    "first_creeps_per_min_deltas"
    t.float    "second_creeps_per_min_deltas"
    t.float    "third_creeps_per_min_deltas"
    t.float    "end_creeps_per_min_deltas"
    t.float    "first_cs_diff_per_min_deltas"
    t.float    "second_cs_diff_per_min_deltas"
    t.float    "third_cs_diff_per_min_deltas"
    t.float    "end_cs_diff_per_min_deltas"
    t.float    "first_gold_per_min_deltas"
    t.float    "second_gold_per_min_deltas"
    t.float    "third_gold_per_min_deltas"
    t.float    "end_gold_per_min_deltas"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "match_id"
  end

  create_table "matches", force: true do |t|
    t.integer  "gold_earned"
    t.integer  "gold_spent"
    t.datetime "match_creation"
    t.integer  "match_id"
    t.boolean  "winner"
    t.integer  "match_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "summoner_id"
  end

  create_table "summoners", force: true do |t|
    t.string   "name"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
