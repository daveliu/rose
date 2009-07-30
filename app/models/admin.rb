class Admin < ActiveRecord::Base
  has_many :site_messages, :as => :receiver
  belongs_to :account_status

  def self.authenticate(username, password)
    admin = self.find_by_username(username)
    if admin && admin.password == Digest::MD5.hexdigest(password)
      admin
    else
      nil
    end
  end
end
