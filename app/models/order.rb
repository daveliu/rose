class Order < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_server
  belongs_to :game_area
  belongs_to :time_type
  belongs_to :order_status
  belongs_to :pay_type
  has_and_belongs_to_many :pve_suits
  has_and_belongs_to_many :pvp_suits
  has_and_belongs_to_many :pve_equipment, :join_table => "orders_pve_equipment", :class_name => "Equipment"
  has_and_belongs_to_many :pvp_equipment, :join_table => "orders_pve_equipment", :class_name => "Equipment"
  has_one :order_pve_time_price
  has_one :pve_time_price, :through => :order_pve_time_price
  has_one :order_pvp_time_price
  has_one :pvp_time_price, :through => :order_pvp_time_price
  has_one :order_upgrade_level
  has_one :upgrade_level, :through => :order_upgrade_level
  has_one :upgrade_level_price, :through => :order_upgrade_level

  def before_create
    self.order_code = generate_code
  end

  def online_pay?
    [1,2].include?(self.pay_type_id)
  end

  private
  def generate_code
    Time.now.strftime("%Y%m%d%H%M") + ("%04d" % rand(10000))
  end
end
