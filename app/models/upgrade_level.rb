class UpgradeLevel < ActiveRecord::Base
  has_many :order_upgrade_levels
  has_many :upgrade_level_prices
end
