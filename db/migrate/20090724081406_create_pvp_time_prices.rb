class CreatePvpTimePrices < ActiveRecord::Migration
  def self.up
    create_table :pvp_time_prices do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pvp_time_prices
  end
end
