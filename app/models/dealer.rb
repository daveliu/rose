class Dealer < ActiveRecord::Base
  has_many :site_messages, :as => :receiver
  belongs_to :account_status
end
