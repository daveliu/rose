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
      table.column :user_type_id, :integer
      table.column :user_status_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :admins, :force => true do |table|
      table.column :username, :string, :null => false, :limit => 30
      table.column :password, :string, :null => false, :limit => 50
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :orders, :force =>true do |table|
      table.column :order_code, :string, :null => false, :limit => 20
      table.column :game_id, :integer, :null => false
      table.column :game_area_id, :integer, :null => false
      table.column :order_suit_id, :integer
      table.column :order_level_id, :integer
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :order_suits, :force => true do |table|
    end

    create_table :order_statuses, :force => true do |table|
      table.column :value, :string, :null => false
    end

    create_table :site_news, :force => true do |table|
      table.column :title, :string, :limit => 100
      table.column :content, :string, :limit => 3000
      table.column :image_path, :string, :limit => 100
      table.column :created_at, :datetime
      table.column :updated_at, :datetime
    end

    create_table :user_types, :force => true do |table|
      table.column :value, :string, :limit => 30
    end
    
    create_table :user_status, :force => true do |table|
      table.column :value, :string, :limit => 30
    end

    directory = File.dirname(__FILE__) + "/origin_data/"
    Fixtures.create_fixtures(directory, "users", ".*")
  end
  def self.down
    drop_table :users
    drop_table :orders
    drop_table :order_states
    drop_table :site_news
    drop_table :user_types
    drop_table :user_statuses
    drop_table :admins
    drop_table :order_suits
  end
end
