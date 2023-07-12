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

ActiveRecord::Schema[7.0].define(version: 2023_07_12_193809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balances", force: :cascade do |t|
    t.decimal "available"
    t.decimal "current"
    t.decimal "limit"
    t.bigint "fintoc_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fintoc_account_id"], name: "index_balances_on_fintoc_account_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "general_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "favorite_recipient_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipient_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_account_id"], name: "index_favorite_recipient_accounts_on_recipient_account_id"
    t.index ["user_id"], name: "index_favorite_recipient_accounts_on_user_id"
  end

  create_table "fintoc_accounts", force: :cascade do |t|
    t.bigint "bank_account_id", null: false
    t.string "name"
    t.decimal "amount"
    t.string "currency"
    t.string "number"
    t.string "account_type"
    t.text "widget_token"
    t.string "official_name"
    t.string "holder_id"
    t.string "holder_name"
    t.datetime "refreshed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_account_id"], name: "index_fintoc_accounts_on_bank_account_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movements", force: :cascade do |t|
    t.bigint "fintoc_account_id", null: false
    t.string "currency"
    t.decimal "amount"
    t.string "description"
    t.date "transaction_date"
    t.string "reference_id"
    t.string "movement_type"
    t.boolean "pending"
    t.bigint "recipient_account_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bank_account_id"
    t.index ["bank_account_id"], name: "index_movements_on_bank_account_id"
    t.index ["fintoc_account_id"], name: "index_movements_on_fintoc_account_id"
    t.index ["recipient_account_id"], name: "index_movements_on_recipient_account_id"
  end

  create_table "paypopups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipient_accounts", force: :cascade do |t|
    t.string "holder_id"
    t.string "holder_name"
    t.string "number"
    t.string "institution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "preferred_currency"
    t.string "name"
    t.string "buda_api_key"
    t.string "buda_secret_key"
    t.string "encrypted_buda_api_key"
    t.string "encrypted_buda_api_key_iv"
    t.string "encrypted_buda_secret_key"
    t.string "encrypted_buda_secret_key_iv"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "webook_events", force: :cascade do |t|
    t.string "fintoc_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "balances", "fintoc_accounts"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "favorite_recipient_accounts", "recipient_accounts"
  add_foreign_key "favorite_recipient_accounts", "users"
  add_foreign_key "fintoc_accounts", "bank_accounts"
  add_foreign_key "movements", "bank_accounts"
  add_foreign_key "movements", "fintoc_accounts"
  add_foreign_key "movements", "recipient_accounts"
end
