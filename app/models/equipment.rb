class Equipment < ActiveRecord::Base
  CATEGORY_PVP = 2
  CATEGORY_PVE = 1

  TYPE_EQUIPMENT = 1
  TYPE_WEAPON = 2

  belongs_to :equipment_level
  belongs_to :suit, :polymorphic => true
  belongs_to :equipment_category
  belongs_to :instance
  belongs_to :upload_image
  has_and_belongs_to_many :game_roles

  def before_destroy
    EquipmentGameRole.delete_all({:equipment_id => self.id})
  end
end
