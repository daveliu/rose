class PvpSuit < ActiveRecord::Base
  has_many :equipments, :as => :suit
  belongs_to :pvp_category
end
