require "active_record/fixtures"
class Users < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |table|
      table.column :username, :string, :null => false, :limit => 30
      table.column :password, :string, :null => false, :limit => 50
      table.column :address, :string, :liimit => 200
      table.column :email, :string, :limit => 30
      table.column :qq, :string, :limit => 15
      table.column :cell_phone, :string, :limit => 15
      table.column :phone, :string, :limit => 15
      table.column :id_card, :string, :limit => 30
      table.column :account_status_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :admins, :force => true do |table|
      table.column :username, :string, :null => false, :limit => 30
      table.column :password, :string, :null => false, :limit => 50
      table.column :account_status_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :dealers, :force => true do |table|
      table.column :username, :string, :null => false, :limit => 30
      table.column :password, :string, :null => false, :limit => 50
      table.column :address, :string, :liimit => 200
      table.column :email, :string, :limit => 30
      table.column :qq, :string, :limit => 15
      table.column :cell_phone, :string, :limit => 15
      table.column :phone, :string, :limit => 15
      table.column :id_card, :string, :limit => 30
      table.column :name, :string, :limit => 20
      table.column :id_card_image, :integer
      table.column :bank_account, :string, :limit => 50
      table.column :bank_name, :string, :limit => 50
      table.column :bank_location, :string, :limit => 100
      table.column :account_status_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    #代练等级
    create_table :upgrade_levels, :force => true do |table|
      table.column :value, :string, :limit => 30
      table.column :price, :float, :null => false
    end

    #代练等级日期
    create_table :upgrade_level_prices, :force => true do |table|
      table.column :upgrade_level_id, :integer, :null => false
      table.column :min_day, :integer, :null => false
      table.column :max_day, :integer, :null => false
      table.column :factor, :float, :null => false
    end

    #装备等级
    create_table :equipment_levels, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    #武器or装备
    create_table :equipment_types, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    #pvp or pve
    create_table :equipment_categories, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    #魔法 or 物理
    create_table :equipment_series, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    #副本
    create_table :instances, :force => true do |table|
      table.column :value, :string, :limit => 50
    end

    create_table :game_roles, :force => true do |table|
      table.column :value, :string, :limit => 50
    end

    create_table :equipment, :force => true do |table|
      table.column :name, :string, :null => false, :limit => 50
      table.column :upload_image_id, :integer
      table.column :equipment_type_id, :integer
      table.column :equipment_level_id, :integer
      table.column :equipment_category_id, :integer
      table.column :equipment_serie_id, :integer
      table.column :instance_id, :integer #PVE用
      table.column :pvp_season_id, :integer #PVP用
      table.column :suit_id, :integer
      table.column :singlesellable, :boolean
      table.column :price, :float
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :equipment_game_roles, :force => true, :id => false do |table|
      table.column :equipment_id, :integer, :null => false
      table.column :game_role_id, :integer, :null => false
    end

    #pve分类，T7,T8。。。
    create_table :pve_categories, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    #pve套装
    create_table :pve_suits, :force => true do |table|
      table.column :name, :string, :null => false, :limit => 50
      table.column :upload_image_id, :integer
      table.column :price, :float
      table.column :pve_category_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :pve_time_prices, :force => true do |table|
      table.column :pve_price, :float
      table.column :factor, :float
      table.column :min_day, :integer
      table.column :max_day, :integer
    end

    #pvp分类
    create_table :pvp_seasons, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    create_table :pvp_suits, :force => true do |table|
      table.column :name, :string, :null => false, :limit => 50
      table.column :upload_image_id, :integer
      table.column :pvp_season_id, :integer
      table.column :price, :float
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :pvp_time_prices, :force => true do |table|
      table.column :pvp_price, :float
      table.column :factor, :float
      table.column :min_day, :integer
      table.column :max_day, :integer
    end

    create_table :orders, :force => true do |table|
      table.column :user_id, :integer, :null => false
      table.column :order_code, :string, :null => false, :limit => 20
      table.column :order_status_id, :integer, :null => false
      table.column :pay_type_id, :integer, :null => false
      table.column :game_id, :integer, :null => false
      table.column :game_area_id, :integer, :null => false
      table.column :game_server_id, :integer, :null => false
      table.column :game_account, :string, :limit => 50, :null => false
      table.column :game_password, :string, :limit => 50, :null => false
      table.column :delay_days, :integer
      table.column :time_type_id, :integer #计时方式
      table.column :agreement_date, :datetime #约定时间(如果计时方式不是按约定时间计时的话该字段无效)
      table.column :email, :string, :limit => 30
      table.column :qq, :string, :limit => 15
      table.column :cell_phone, :string, :limit => 15
      table.column :phone, :string, :limit => 15
      table.column :total_price, :float
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :order_pve_time_prices, :force => true do |table|
      table.column :order_id, :integer, :null => false
      table.column :pve_time_price_id, :integer, :null => false
      table.column :pve_status_id, :integer, :null => false
    end


    create_table :order_pvp_time_prices, :force => true do |table|
      table.column :order_id, :integer, :null => false
      table.column :pvp_time_price_id, :integer, :null => false
      table.column :pvp_status_id, :integer, :null => false
    end

    create_table :orders_pvp_suits, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :pvp_suit_id, :integer, :null => false
    end

    create_table :orders_pve_suits, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :pve_suit_id, :integer, :null => false
    end

    create_table :orders_pve_equipment, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :equipment_id, :integer, :null => false
    end

    create_table :orders_pvp_equipment, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :equipment_id, :integer, :null => false
    end

    create_table :order_upgrade_levels, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :upgrade_level_id, :integer, :null => false
      table.column :upgrade_level_price_id, :integer, :null => false
      table.column :level_status_id, :integer, :null => false
    end

    #套餐
    create_table :packages, :force => true do |table|
      table.column :name, :string, :limit => 30
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :packages_pve_suits, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :suit_id, :integer, :null => false
    end

    create_table :packages_pvp_suits, :force => true, :id => false do |table|
      table.column :order_id, :integer, :null => false
      table.column :suit_id, :integer, :null => false
    end

    create_table :package_upgrade_levels, :force => true do |table|
      table.column :order_id, :integer
      table.column :level_id, :integer
    end

    create_table :games, :force => true do |table|
      table.column :value, :string, :limit => 20
    end

    create_table :game_areas, :force => true do |table|
      table.column :game_id, :integer
      table.column :value, :string, :limit => 20
    end

    create_table :time_types, :force => true do |table|
      table.column :value, :string, :limit => 20
    end

    create_table :game_servers, :force => true do |table|
      table.column :game_area_id, :integer
      table.column :value, :string, :limit => 20
    end

    create_table :order_statuses, :force => true do |table|
      table.column :value, :string, :null => false
    end

    create_table :sub_order_statuses, :force => true do |table|
      table.column :value, :string, :null => false
    end

    create_table :site_news, :force => true do |table|
      table.column :title, :string, :limit => 100
      table.column :content, :string, :limit => 3000
      table.column :upload_image_id, :integer
      table.column :owner_type, :string, :limit => 20
      table.column :owner_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :site_messages, :force => true do |table|
      table.column :title, :string, :limit => 100
      table.column :content, :string, :limit => 1000
      table.column :read, :boolean
      table.column :receiver_type, :string, :limit => 30
      table.column :receiver_id, :integer
      table.column :sender_type, :string, :limit => 30
      table.column :sender_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end
    
    create_table :account_statuses, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    create_table :pay_types, :force => true do |table|
      table.column :value, :string, :limit => 30
      table.column :description, :string, :limit => 200
    end

    create_table :system_configs, :force => true do |table|
      table.column :name, :string, :limit => 30
      table.column :value, :string, :limit => 30
    end

    create_table :upload_images, :force => true do |table|
      table.column :parent_id,  :integer
      table.column :content_type, :string
      table.column :filename, :string
      table.column :thumbnail, :string
      table.column :size, :integer
      table.column :width, :integer
      table.column :height, :integer
      table.column :created_at, :datetime
    end

    directory = File.dirname(__FILE__) + "/origin_data/"
    data = Dir.entries(directory).map {|file| file.end_with?(".yml") ? file[0...-4] : nil }.compact
    Fixtures.create_fixtures(directory, data)
  end
  
  def self.down
    tables = User.find_by_sql("select TABLE_NAME from information_schema.TABLES where TABLE_SCHEMA = 'rose_development' and TABLE_NAME != 'schema_migrations'").map(&:TABLE_NAME)
    tables.each {|t| drop_table t }
  end
end
