class Admin::DealersController < ApplicationController
  before_filter :authenticate_admin
  layout "admin"

  def index
    @dealers = Dealer.find(:all)
  end
end
