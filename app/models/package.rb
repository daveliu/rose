class Package < ActiveRecord::Base
  has_and_belongs_to_many :pve_suits
  has_and_belongs_to_many :pvp_suits
  has_one :upgrade_level, :through => :package_upgrade_levels
end
