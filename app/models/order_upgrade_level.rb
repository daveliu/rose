class OrderUpgradeLevel < ActiveRecord::Base
  belongs_to :order
  belongs_to :upgrade_level
end
