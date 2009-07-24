class CreatePveTimePrices < ActiveRecord::Migration
  def self.up
    create_table :pve_time_prices do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pve_time_prices
  end
end
