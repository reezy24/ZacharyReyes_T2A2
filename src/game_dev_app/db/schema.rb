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

ActiveRecord::Schema.define(version: 2019_11_06_031809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertises", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_expertises", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "expertise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expertise_id"], name: "index_member_expertises_on_expertise_id"
    t.index ["member_id"], name: "index_member_expertises_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "about_me", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.boolean "response"
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_offers_on_project_id"
    t.index ["receiver_id"], name: "index_offers_on_receiver_id"
    t.index ["sender_id"], name: "index_offers_on_sender_id"
  end

  create_table "project_roles", force: :cascade do |t|
    t.bigint "expertise_id", null: false
    t.bigint "project_id", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expertise_id"], name: "index_project_roles_on_expertise_id"
    t.index ["project_id"], name: "index_project_roles_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "duration", null: false
    t.integer "budget", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id", null: false
    t.index ["owner_id"], name: "index_projects_on_owner_id"
  end

  add_foreign_key "member_expertises", "expertises"
  add_foreign_key "member_expertises", "members"
  add_foreign_key "offers", "projects"
  add_foreign_key "project_roles", "expertises"
  add_foreign_key "project_roles", "projects"
end
