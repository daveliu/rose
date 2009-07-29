# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def current_admin
    @current_admin ||= session[:admin_id] ? Admin.find(session[:admin_id]) : nil
  end

  def authenticate_user
    unless current_user
      session[:url] = request.uri
      redirect_to new_user_session_path
    end
  end

  def authenticate_admin
    unless current_admin
      session[:admin_url] = request.uri
      redirect_to new_admin_session_path
    end
  end

  def after_logon(user)
    session[:user_id] = user.id
  end
end
