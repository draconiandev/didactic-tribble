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

ActiveRecord::Schema.define(version: 20161016064819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "overview"
    t.text     "itinerary"
    t.decimal  "price"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "difficulty"
    t.boolean  "handcrafted"
    t.string   "handcrafted_category"
    t.string   "cover"
    t.string   "string"
    t.text     "brief"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "slug"
    t.integer  "destination_id"
    t.datetime "published_at"
    t.boolean  "featured"
    t.integer  "vendor_id"
    t.integer  "categorization_id"
    t.boolean  "approved"
  end

  add_index "activities", ["categorization_id"], name: "index_activities_on_categorization_id", using: :btree
  add_index "activities", ["destination_id"], name: "index_activities_on_destination_id", using: :btree
  add_index "activities", ["slug"], name: "index_activities_on_slug", unique: true, using: :btree
  add_index "activities", ["title"], name: "index_activities_on_title", unique: true, using: :btree
  add_index "activities", ["vendor_id"], name: "index_activities_on_vendor_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cover"
    t.string   "slug"
  end

  add_index "articles", ["title"], name: "index_articles_on_title", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cover"
    t.text     "brief"
    t.string   "slug"
    t.string   "main_category"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "subscription_id"
    t.integer  "categorization_id"
  end

  add_index "categories", ["categorization_id"], name: "index_categories_on_categorization_id", using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  add_index "categories", ["subscription_id"], name: "index_categories_on_subscription_id", using: :btree

  create_table "categorizations", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizations", ["activity_id"], name: "index_categorizations_on_activity_id", using: :btree
  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cover"
    t.text     "brief"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "destinations", ["name"], name: "index_destinations_on_name", unique: true, using: :btree
  add_index "destinations", ["slug"], name: "index_destinations_on_slug", unique: true, using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "activity_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
  end

  add_index "enquiries", ["activity_id"], name: "index_enquiries_on_activity_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.integer  "activity_id"
    t.string   "image"
    t.string   "alt_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "height"
    t.string   "width"
    t.integer  "article_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name",                   default: "",     null: false
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "role",                   default: "user", null: false
    t.string   "slug"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["name"], name: "index_people_on_name", using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree
  add_index "people", ["slug"], name: "index_people_on_slug", unique: true, using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subscriptions", ["category_id"], name: "index_subscriptions_on_category_id", using: :btree
  add_index "subscriptions", ["vendor_id"], name: "index_subscriptions_on_vendor_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_person"
    t.text     "address"
    t.string   "city"
    t.string   "pincode"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "subscription_id"
    t.string   "slug"
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true, using: :btree
  add_index "vendors", ["name"], name: "index_vendors_on_name", using: :btree
  add_index "vendors", ["slug"], name: "index_vendors_on_slug", unique: true, using: :btree
  add_index "vendors", ["subscription_id"], name: "index_vendors_on_subscription_id", using: :btree

  add_foreign_key "activities", "categorizations"
  add_foreign_key "activities", "destinations"
  add_foreign_key "activities", "vendors"
  add_foreign_key "categories", "categorizations"
  add_foreign_key "categories", "subscriptions"
  add_foreign_key "categorizations", "activities", on_delete: :cascade
  add_foreign_key "categorizations", "categories"
  add_foreign_key "enquiries", "activities"
  add_foreign_key "subscriptions", "categories"
  add_foreign_key "subscriptions", "vendors"
  add_foreign_key "vendors", "subscriptions"
end
