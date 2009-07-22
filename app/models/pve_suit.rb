class PveSuit < ActiveRecord::Base
  has_many :equipments, :as => :suit
  belongs_to :pve_category
end
