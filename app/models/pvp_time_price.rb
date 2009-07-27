class PvpTimePrice < ActiveRecord::Base
  include TimePrice

  def self.find_by_price(price)
    pvp_time_prices = self.find(:all, :conditions => ["pvp_price < ?", price])
    max_price = pvp_time_prices.map(&:pvp_price).max
    pvp_time_prices.select {|p| p.pvp_price == max_price }
  end
end
