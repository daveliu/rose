class PvpSeason < ActiveRecord::Base
  has_many :pvp_suits
  has_many :pvp_weapons, :class_name => "Equipment",
    :conditions => ["equipment.equipment_category_id = ? and equipment.equipment_type_id = ?", Equipment::CATEGORY_PVP, Equipment::TYPE_WEAPON]
end
