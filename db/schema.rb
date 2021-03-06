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

ActiveRecord::Schema.define(version: 20140407153129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "owners", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true, using: :btree
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true, using: :btree

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["team_id"], name: "index_participants_on_team_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "core"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_id"
    t.text     "foreword",   default: "", null: false
    t.integer  "pain_count", default: 0,  null: false
    t.string   "state"
    t.string   "tags"
    t.string   "author"
  end

  create_table "quizzes", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "status",              default: "moderating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_question_id"
  end

  add_index "quizzes", ["owner_id"], name: "index_quizzes_on_owner_id", using: :btree

  create_table "sufferings", force: true do |t|
    t.integer  "participant_id"
    t.integer  "question_id"
    t.integer  "pain_count",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sufferings", ["participant_id", "question_id"], name: "index_sufferings_on_participant_id_and_question_id", unique: true, using: :btree
  add_index "sufferings", ["participant_id"], name: "index_sufferings_on_participant_id", using: :btree
  add_index "sufferings", ["question_id"], name: "index_sufferings_on_question_id", using: :btree

  create_table "team_answers", force: true do |t|
    t.integer  "team_id"
    t.integer  "question_id"
    t.string   "body"
    t.boolean  "is_right",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_answers", ["question_id"], name: "index_team_answers_on_question_id", using: :btree
  add_index "team_answers", ["team_id", "question_id"], name: "index_team_answers_on_team_id_and_question_id", unique: true, using: :btree
  add_index "team_answers", ["team_id"], name: "index_team_answers_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_id"
    t.integer  "victim_id"
    t.string   "state",      default: "alive"
    t.string   "logo"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", unique: true, using: :btree

end
