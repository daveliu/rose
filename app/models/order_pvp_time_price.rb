class OrderPvpTimePrice < ActiveRecord::Base
  belongs_to :order
  belongs_to :pvp_time_price
end
