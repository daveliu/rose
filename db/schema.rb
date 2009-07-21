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

  create_table "admins", :force => true do |t|
    t.string   "username",   :limit => 30, :null => false
    t.string   "password",   :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses", :force => true do |t|
    t.string "value", :null => false
  end

  create_table "order_suits", :force => true do |t|
  end

  create_table "orders", :force => true do |t|
    t.string   "order_code",     :limit => 20, :null => false
    t.integer  "game_id",                      :null => false
    t.integer  "game_area_id",                 :null => false
    t.integer  "order_suit_id"
    t.integer  "order_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_news", :force => true do |t|
    t.string   "title",      :limit => 100
    t.string   "content",    :limit => 3000
    t.string   "image_path", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_status", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "user_types", :force => true do |t|
    t.string "value", :limit => 30
  end

  create_table "users", :force => true do |t|
    t.string   "username",       :limit => 30, :null => false
    t.string   "password",       :limit => 50, :null => false
    t.string   "address"
    t.string   "email",          :limit => 30
    t.string   "qq",             :limit => 15
    t.string   "cell_phone",     :limit => 15
    t.string   "phone",          :limit => 15
    t.string   "id_card",        :limit => 30
    t.integer  "user_type_id"
    t.integer  "user_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
