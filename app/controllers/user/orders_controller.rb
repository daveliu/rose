class User::OrdersController < ApplicationController
  layout "home"
  
  def customize_level
    if params[:clear] == "pve"
      session[:order][:pve] = nil if session[:order]
    end
    @upgrade_levels = UpgradeLevel.find(:all)
    if session[:order] && session[:order][:level]
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
    @min_pve_price = SystemConfig.find_by_name("pve_min_price").value
    if session[:order] && session[:order][:pve]
      if session[:order][:pve][:suits]
        @pve_suits = PveSuit.find(session[:order][:pve][:suits], :include => [:pve_category])
      end
      if session[:order][:pve][:equipment]
        @pve_equipment = Equipment.find(session[:order][:pve][:equipment])
      end
      if session[:order][:pve][:weapon]
        @pve_weapons = Equipment.find(session[:order][:pve][:weapons])
      end
      @total_pve_price = (@pve_suits || []).map(&:price).sum + (@pve_equipment || []).map(&:price).sum + (@pve_weapons || []).map(&:price).sum
      @pve_time_prices = PveTimePrice.find_by_price(@total_pve_price) if @total_pve_price > @min_pve_price.to_f
    end
  end

  def customize_pvp
    if params[:pve]
      session[:order][:pve].update(params[:pve])
    end
    @pvp_categories = PvpCategory.find(:all)
    @instances = Instance.find(:all)
    @min_pvp_price = SystemConfig.find_by_name("pvp_min_price").value
    if session[:order] && session[:order][:pvp]
      if session[:order][:pvp][:suits]
        @pvp_suits = PvpSuit.find(session[:order][:pvp][:suits], :include => [:pvp_category])
      end
      if session[:order][:pvp][:weapon]
        @pvp_weapons = Equipment.find(session[:order][:pvp][:weapons])
      end
      @total_pvp_price = (@pvp_suits || []).map(&:price).sum + (@pvp_weapons || []).map(&:price).sum
      @pvp_time_prices = PvpTimePrice.find_by_price(@total_pvp_price) if @total_pvp_price > @min_pvp_price.to_f
    end
  end

  def personal_infomation
    if params[:pvp]
      session[:order][:pvp].update(params[:pvp])
    end
    @prices = []
    if session[:order][:level]
      @upgrade_level = UpgradeLevel.find(session[:order][:level][:upgrade_level_id])
      @upgrade_level_price = UpgradeLevelPrice.find(session[:order][:level][:upgrade_level_price_id])
      @prices << @upgrade_level.price * @upgrade_level_price.factor
    end
    if session[:order][:pve]
      @pve_suits = PveSuit.find(session[:order][:pve][:suits]) unless session[:order][:pve][:suits].blank?
      @pve_equipment = Equipment.find(session[:order][:pve][:equipment]) unless session[:order][:pve][:equipment].blank?
      @pve_weapons = Equipment.find(session[:order][:pve][:weapons]) unless session[:order][:pve][:weapons].blank?
      @pve_time_price = PveTimePrice.find(session[:order][:pve]["pve_time_price_id"])
      @prices << ((@pve_suits || []).map(&:price).sum + (@pve_equipment || []).map(&:price).sum + (@pve_weapons || []).map(&:price).sum) * @pve_time_price.factor
    end
    if session[:order][:pvp]
      @pvp_suits = PvpSuit.find(session[:order][:pvp][:suits]) unless session[:order][:pvp][:suits].blank?
      @pvp_weapons = Equipment.find(session[:order][:pvp][:weapons]) unless session[:order][:pvp][:weapons].blank?
      @pvp_time_price = PvpTimePrice.find(session[:order][:pvp]["pvp_time_price_id"])
      @prices << ((@pvp_suits || []).map(&:price).sum + (@pvp_weapons || []).map(&:price).sum) * @pvp_time_price.factor
    end
    @pay_types = PayType.find(:all)
    @games = Game.find(:all)
    @time_types = TimeType.find(:all)
  end

  def create
    raise
  end
end
