class Users < ActiveRecord::Migration
  def self.up
    create_table :users do |table|
      table.column :username, :null => false, :limit => 30
      table.column :password, :null => false, :limit => 50
    end
  end

  def self.down
    drop_table :users
  end
end
