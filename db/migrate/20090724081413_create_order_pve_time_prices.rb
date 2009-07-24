class CreateOrderPveTimePrices < ActiveRecord::Migration
  def self.up
    create_table :order_pve_time_prices do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :order_pve_time_prices
  end
end
