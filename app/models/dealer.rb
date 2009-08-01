class Dealer < ActiveRecord::Base
  has_many :site_messages, :as => :receiver
  belongs_to :account_status

  def before_create
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
