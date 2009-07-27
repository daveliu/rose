class User::SessionsController < ApplicationController
  layout "home"
  
  def new    
  end

  def create
    user = User.authenticate(params[:user][:username], params[:user][:password])
    if user
      after_logon(user)
      redirect_to :controller => "/user/orders", :action => "customize_level"
    else
      flash[:notice] = "用户名或密码错误"
      redirect_to :action => "new"
    end
  end
end
