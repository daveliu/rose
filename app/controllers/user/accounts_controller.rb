class User::AccountsController < ApplicationController
  layout "home"

  def create
    user = User.create!(params[:user].update(:user_status_id => 1, :user_type_id => 1))
    after_logon(user)
    redirect_to :controller => "/user/orders", :action => "customize_level"
  end
end
