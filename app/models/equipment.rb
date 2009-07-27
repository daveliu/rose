class Equipment < ActiveRecord::Base
  CATEGORY_PVP = 2
  CATEGORY_PVE = 1

  TYPE_EQUIPMENT = 1
  TYPE_WEAPON = 2

  belongs_to :equipment_level
  belongs_to :suit, :polymorphic => true
  belongs_to :equipment_category
  belongs_to :instance
end
