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

ActiveRecord::Schema.define(version: 2022_07_04_152438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "address_type"
    t.string "first_name"
    t.string "last_name"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.string "address1"
    t.string "city"
    t.integer "country_id"
    t.integer "state_id"
    t.string "zip_code"
    t.boolean "is_default", default: false
    t.boolean "is_billing_default", default: false
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["addressable_id"], name: "index_addresses_on_addressable_id"
    t.index ["addressable_type"], name: "index_addresses_on_addressable_type"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cart_id"
    t.integer "quantity", default: 1
    t.boolean "active", default: true
    t.integer "item_type_id", null: false
    t.integer "product_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation", limit: 5
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.bigint "shipping_zone_id"
    t.index ["name"], name: "index_countries_on_name"
  end

  create_table "images", force: :cascade do |t|
    t.integer "imageable_id"
    t.string "imageable_type"
    t.integer "position"
    t.string "caption"
    t.string "photo_link"
    t.index ["imageable_id"], name: "index_images_on_imageable_id"
    t.index ["imageable_type"], name: "index_images_on_imageable_type"
    t.index ["position"], name: "index_images_on_position"
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id"
    t.decimal "quantity"
    t.string "unit"
    t.text "description"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal "price", precision: 8, scale: 2
    t.decimal "total", precision: 8, scale: 2
    t.integer "order_id"
    t.integer "product_id"
    t.string "state"
    t.integer "shipping_rate_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["shipping_rate_id"], name: "index_order_items_on_shipping_rate_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.string "ip_address"
    t.string "email"
    t.string "state"
    t.integer "user_id"
    t.integer "bill_address_id"
    t.integer "ship_address_id"
    t.boolean "shipped", default: false
    t.datetime "calculated_at"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["bill_address_id"], name: "index_orders_on_bill_address_id"
    t.index ["email"], name: "index_orders_on_email"
    t.index ["number"], name: "index_orders_on_number"
    t.index ["ship_address_id"], name: "index_orders_on_ship_address_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.boolean "active", default: true
    t.integer "rgt"
    t.integer "lft"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["lft"], name: "index_product_types_on_lft"
    t.index ["rgt"], name: "index_product_types_on_rgt"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.decimal "old_price"
    t.boolean "on_sale"
    t.boolean "sold_out"
    t.boolean "featured"
    t.integer "quantity"
    t.integer "product_type_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "recipe_bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["recipe_id"], name: "index_recipe_bookmarks_on_recipe_id"
    t.index ["user_id"], name: "index_recipe_bookmarks_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "publisher"
    t.string "source_url"
    t.string "image_url"
    t.integer "servings"
    t.string "cooking_time"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.bigint "user_id"
  end

  create_table "shipping_rates", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.bigint "shipping_zone_id"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "shipping_zones", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", limit: 5, null: false
    t.string "described_as"
    t.integer "country_id", null: false
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.bigint "shipping_zone_id"
    t.index ["abbreviation"], name: "index_states_on_abbreviation"
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["name"], name: "index_states_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "auth0_id"
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.datetime "created_at", precision: 6, default: -> { "now()" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "now()" }, null: false
    t.index ["auth0_id"], name: "uniq_auth0_user", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
