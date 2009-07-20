# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  def current_user
    @current_user ||= session[:user_id] ? User.find(session:user_id): nil
  end

  def after_logon(user)
    session[:user_id] = user.id
  end
end
