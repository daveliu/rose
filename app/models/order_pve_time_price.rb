class OrderPveTimePrice < ActiveRecord::Base
  belongs_to :order
  belongs_to :pve_time_price
end
