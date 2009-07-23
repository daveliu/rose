class PvpSuit < ActiveRecord::Base
  has_many :equipment, :as => :suit
  belongs_to :pvp_category
end
