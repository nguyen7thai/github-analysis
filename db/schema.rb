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

ActiveRecord::Schema.define(version: 20150515003149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "github_id"
    t.string   "username"
    t.text     "body"
    t.datetime "posted_at"
    t.text     "raw_data"
    t.integer  "line"
    t.integer  "position"
    t.integer  "commit_id"
    t.integer  "repository_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_path"
    t.integer  "github_account_id"
  end

  add_index "comments", ["commit_id"], name: "index_comments_on_commit_id", using: :btree
  add_index "comments", ["github_account_id"], name: "index_comments_on_github_account_id", using: :btree
  add_index "comments", ["repository_id"], name: "index_comments_on_repository_id", using: :btree

  create_table "commits", force: :cascade do |t|
    t.string   "sha"
    t.string   "committer"
    t.datetime "committed_at"
    t.text     "raw_data"
    t.integer  "repository_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "commits", ["committer"], name: "index_commits_on_committer", using: :btree
  add_index "commits", ["repository_id"], name: "index_commits_on_repository_id", using: :btree
  add_index "commits", ["sha"], name: "index_commits_on_sha", using: :btree

  create_table "commits_github_accounts", force: :cascade do |t|
    t.integer  "commit_id"
    t.integer  "github_account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "commits_github_accounts", ["commit_id", "github_account_id"], name: "commits_github_accounts_index", using: :btree

  create_table "fetch_histories", force: :cascade do |t|
    t.string   "fetch_type"
    t.string   "status"
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "fetch_histories", ["fetch_type"], name: "index_fetch_histories_on_fetch_type", using: :btree

  create_table "github_accounts", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "github_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "github_accounts", ["email"], name: "index_github_accounts_on_email", using: :btree
  add_index "github_accounts", ["name"], name: "index_github_accounts_on_name", using: :btree
  add_index "github_accounts", ["username"], name: "index_github_accounts_on_username", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.string   "github_id"
    t.string   "name"
    t.text     "raw_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "authentication_token"
    t.integer  "repository_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "users", ["repository_id"], name: "index_users_on_repository_id", using: :btree
  add_index "users", ["username", "encrypted_password"], name: "index_users_on_username_and_encrypted_password", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "comments", "commits"
  add_foreign_key "comments", "github_accounts"
  add_foreign_key "comments", "repositories"
  add_foreign_key "commits_github_accounts", "commits"
  add_foreign_key "commits_github_accounts", "github_accounts"
end
