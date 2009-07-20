class User < ActiveRecord::Base
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email

  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if (user && user.password == Digest::MD5.hexdigest(password))
      user
    else
      nil
    end
  end

  def before_create
    self.password = Digest::MD5.hexdigest(self.password.to_s)
  end
end
