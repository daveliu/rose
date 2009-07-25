class User::OrdersController < ApplicationController
  layout "home"
  
  def customize_level
    @upgrade_levels = UpgradeLevel.find(:all)
    if session[:order]
      @upgrade_level = UpgradeLevel.find(session[:order][:level][:upgrade_level_id]) if session[:order][:level][:upgrade_level_id]
      @upgrade_level_price = UpgradeLevelPrice.find(session[:order][:level][:upgrade_level_price_id]) if session[:order][:level][:upgrade_level_price_id]
      @total_price = @upgrade_level.price * @upgrade_level_price.factor if @upgrade_level && @upgrade_level_price
    end
  end

  def customize_pve
    if params[:level]
      session[:order] = (session[:order] || {}).update(:level => params[:level])
    end
    @pve_categories = PveCategory.find(:all)
    @instances = Instance.find(:all)
  end

  def customize_pvp
    raise
  end
end
