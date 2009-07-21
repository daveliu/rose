class User::AccountsController < ApplicationController
  layout "home"

  def create
    User.create!(params[:user].update(:user_status_id => 1, :user_type_id => 1))
    render :text => "success"
  end
end
