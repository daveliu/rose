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
    if session[:pve]
      if session[:pve][:suits]
        @pve_suits = PveSuit.find(session[:pve][:suits], :include => [:pve_category])
        @total_pve_price = @pve_suits.map(&:price).sum
        @pve_time_prices = PveTimePrice.find_by_price(@total_pve_price)
      end
    end
  end

  def customize_pvp
    raise
  end
end
