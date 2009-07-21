class User::SessionsController < ApplicationController
  layout "home"
  
  def new    
  end

  def create
    user = User.authenticate(params[:user][:username], params[:user][:password])
    if user
      after_logon(user)
      render :text => "success"
    else
      render :text => "fail"
    end
  end
end
