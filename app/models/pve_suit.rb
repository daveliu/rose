class PveSuit < ActiveRecord::Base
  has_many :equipment, :as => :suit
  belongs_to :pve_category
end
