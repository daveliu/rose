# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090716060850) do

  create_table "account_statuses", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "admins", :force => true do |t|
    t.string   "username",          :limit => 30, :null => false
    t.string   "password",          :limit => 50, :null => false
    t.integer  "account_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealers", :force => true do |t|
    t.string   "username",          :limit => 30,  :null => false
    t.string   "password",          :limit => 50,  :null => false
    t.string   "address",           :limit => 200
    t.string   "email",             :limit => 30
    t.string   "qq",                :limit => 15
    t.string   "cell_phone",        :limit => 15
    t.string   "phone",             :limit => 15
    t.string   "id_card",           :limit => 30
    t.string   "name",              :limit => 20
    t.string   "id_card_image",     :limit => 20
    t.string   "bank_account",      :limit => 50
    t.string   "bank_name",         :limit => 50
    t.string   "bank_location",     :limit => 100
    t.integer  "account_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", :force => true do |t|
    t.string   "name",                  :limit => 50,  :null => false
    t.string   "image_path",            :limit => 200
    t.integer  "equipment_type_id"
    t.integer  "equipment_level_id"
    t.integer  "equipment_category_id"
    t.integer  "equipment_serie_id"
    t.integer  "instance_id"
    t.integer  "suit_id"
    t.boolean  "singlesellable"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment_categories", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "equipment_game_roles", :id => false, :force => true do |t|
    t.integer "equipment_id", :null => false
    t.integer "game_role_id", :null => false
  end

  create_table "equipment_levels", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "equipment_series", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "equipment_types", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "game_areas", :force => true do |t|
    t.integer "game_id"
    t.string  "value",   :limit => 20
  end

  create_table "game_roles", :force => true do |t|
    t.string "value", :limit => 50
  end

  create_table "game_servers", :force => true do |t|
    t.integer "game_area_id"
    t.string  "value",        :limit => 20
  end

  create_table "games", :force => true do |t|
    t.string "value", :limit => 20
  end

  create_table "instances", :force => true do |t|
    t.string "value", :limit => 50
  end

  create_table "order_pve_time_prices", :force => true do |t|
    t.integer "order_id",          :null => false
    t.integer "pve_time_price_id", :null => false
    t.integer "pve_status_id",     :null => false
  end

  create_table "order_pvp_time_prices", :force => true do |t|
    t.integer "order_id",          :null => false
    t.integer "pvp_time_price_id", :null => false
    t.integer "pvp_status_id",     :null => false
  end

  create_table "order_statuses", :force => true do |t|
    t.string "value", :null => false
  end

  create_table "order_upgrade_levels", :id => false, :force => true do |t|
    t.integer "order_id",               :null => false
    t.integer "upgrade_level_id",       :null => false
    t.integer "upgrade_level_price_id", :null => false
    t.integer "level_status_id",        :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "order_code",      :limit => 20, :null => false
    t.integer  "order_status_id",               :null => false
    t.integer  "pay_type_id",                   :null => false
    t.integer  "game_id",                       :null => false
    t.integer  "game_area_id",                  :null => false
    t.integer  "game_server_id",                :null => false
    t.string   "game_account",    :limit => 50, :null => false
    t.string   "game_password",   :limit => 50, :null => false
    t.integer  "delay_days"
    t.integer  "time_type_id"
    t.datetime "agreement_date"
    t.string   "email",           :limit => 30
    t.string   "qq",              :limit => 15
    t.string   "cell_phone",      :limit => 15
    t.string   "phone",           :limit => 15
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders_pve_equipment", :id => false, :force => true do |t|
    t.integer "order_id",     :null => false
    t.integer "equipment_id", :null => false
  end

  create_table "orders_pve_suits", :id => false, :force => true do |t|
    t.integer "order_id",    :null => false
    t.integer "pve_suit_id", :null => false
  end

  create_table "orders_pvp_equipment", :id => false, :force => true do |t|
    t.integer "order_id",     :null => false
    t.integer "equipment_id", :null => false
  end

  create_table "orders_pvp_suits", :id => false, :force => true do |t|
    t.integer "order_id",    :null => false
    t.integer "pvp_suit_id", :null => false
  end

  create_table "package_upgrade_levels", :force => true do |t|
    t.integer "order_id"
    t.integer "level_id"
  end

  create_table "packages", :force => true do |t|
    t.string   "name",       :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages_pve_suits", :id => false, :force => true do |t|
    t.integer "order_id", :null => false
    t.integer "suit_id",  :null => false
  end

  create_table "packages_pvp_suits", :id => false, :force => true do |t|
    t.integer "order_id", :null => false
    t.integer "suit_id",  :null => false
  end

  create_table "pay_types", :force => true do |t|
    t.string "value",       :limit => 30
    t.string "description", :limit => 200
  end

  create_table "pve_categories", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "pve_suits", :force => true do |t|
    t.string   "name",            :limit => 50,  :null => false
    t.string   "image_path",      :limit => 200
    t.float    "price"
    t.integer  "pve_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pve_time_prices", :force => true do |t|
    t.float   "pve_price"
    t.float   "factor"
    t.integer "min_day"
    t.integer "max_day"
  end

  create_table "pvp_categories", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "pvp_suits", :force => true do |t|
    t.string   "name",            :limit => 50,  :null => false
    t.string   "image",           :limit => 200
    t.integer  "pvp_category_id"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pvp_time_prices", :force => true do |t|
    t.float   "pvp_price"
    t.float   "factor"
    t.integer "min_day"
    t.integer "max_day"
  end

  create_table "site_messages", :force => true do |t|
    t.string   "title",         :limit => 100
    t.string   "content",       :limit => 1000
    t.boolean  "read"
    t.string   "receiver_type", :limit => 30
    t.integer  "receiver_id"
    t.string   "sender_type",   :limit => 30
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_news", :force => true do |t|
    t.string   "title",      :limit => 100
    t.string   "content",    :limit => 3000
    t.string   "image_path", :limit => 100
    t.string   "owner_type", :limit => 20
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_order_statuses", :force => true do |t|
    t.string "value", :null => false
  end

  create_table "system_configs", :force => true do |t|
    t.string "name",  :limit => 30
    t.string "value", :limit => 30
  end

  create_table "time_types", :force => true do |t|
    t.string "value", :limit => 20
  end

  create_table "upgrade_level_prices", :force => true do |t|
    t.integer "upgrade_level_id", :null => false
    t.integer "min_day",          :null => false
    t.integer "max_day",          :null => false
    t.float   "factor",           :null => false
  end

  create_table "upgrade_levels", :force => true do |t|
    t.string "value", :limit => 30
    t.float  "price",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",          :limit => 30, :null => false
    t.string   "password",          :limit => 50, :null => false
    t.string   "address"
    t.string   "email",             :limit => 30
    t.string   "qq",                :limit => 15
    t.string   "cell_phone",        :limit => 15
    t.string   "phone",             :limit => 15
    t.string   "id_card",           :limit => 30
    t.integer  "account_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
