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

ActiveRecord::Schema.define(version: 2021_06_18_104519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "participant_a_id"
    t.bigint "participant_b_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_a_id"], name: "index_conversations_on_participant_a_id"
    t.index ["participant_b_id"], name: "index_conversations_on_participant_b_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "requestor_id"
    t.bigint "receiver_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_matches_on_receiver_id"
    t.index ["requestor_id"], name: "index_matches_on_requestor_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id"
    t.text "content"
    t.boolean "is_read", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "user_game_stats", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "level"
    t.string "summoner_id"
    t.string "primary_role"
    t.string "secondary_role"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_game_stats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "summoner_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
