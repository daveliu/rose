class Order < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_server
  belongs_to :game_area
  belongs_to :time_type
  belongs_to :order_status
  belongs_to :pay_type
  has_and_belongs_to_many :pve_suits
  has_and_belongs_to_many :pvp_suits
  has_one :order_upgrade_level
  has_one :upgrade_level, :through => :order_upgrade_level
end
