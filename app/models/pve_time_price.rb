class PveTimePrice < ActiveRecord::Base
  include TimePrice

  def self.find_by_price(price)
    pve_time_prices = self.find(:all, :conditions => ["pve_price < ?", price])
    max_price = pve_time_prices.map(&:pve_price).max
    pve_time_prices.select {|p| p.pve_price == max_price }
  end
end
