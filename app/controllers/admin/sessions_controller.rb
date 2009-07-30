class Admin::SessionsController < ApplicationController
  layout "admin"

  def create
    admin = Admin.authenticate(params[:admin][:username], params[:admin][:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to session[:admin_url] || "/admin/home"
    else
      flash[:notice] = "登录失败，用户名或密码错误"
      redirect_to new_admin_session_path
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to new_admin_session_path
  end
end
