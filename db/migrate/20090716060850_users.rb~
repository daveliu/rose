class Users < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |table|
      table.column :username, :string, :null => false, :limit => 30
      table.column :password, :string, :null => false, :limit => 50
    end
  end

  def self.down
    drop_table :users
  end
end
