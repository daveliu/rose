class Admin::PveSuitsController < ApplicationController
  include ImageSaver
  before_filter :authenticate_admin
  layout "admin"

  def index
    @pve_suits = PveSuit.find(:all)
  end

  def new
    @categories = PveCategory.find(:all)
  end
end
