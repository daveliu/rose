class Dealer < ActiveRecord::Base
  has_many :site_messages, :as => :owner
  belongs_to :account_status
end
