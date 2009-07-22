class Equipment < ActiveRecord::Base
  belongs_to :equipment_level
  belongs_to :suit, :polymorphic => true
  belongs_to :equipment_category
  belongs_to :instance
end
