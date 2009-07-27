class User::OrderDataController < ApplicationController
  def upgrade_level_times
    @upgrade_level = UpgradeLevel.find(params[:upgrade_level_id])
  end

  def pve_suits
    pve_category = PveCategory.find(params[:pve_category_id].to_i)
    render :update do |page|
      page.replace_html("pve_suits_div", :partial => "pve_suits", :locals => {:pve_suits => pve_category.pve_suits, :checked => false})
    end
  end

  def pve_time_price
    update_pve_session
    @pve_suits = PveSuit.find(session[:order][:pve][:suits], :include => [:pve_category])
    @pve_equipment = Equipment.find(session[:order][:pve][:equipment])
    @pve_weapons = Equipment.find(session[:order][:pve][:weapons])
    @total_pve_price = @pve_suits.map(&:price).sum + @pve_equipment.map(&:price).sum + @pve_weapons.map(&:price).sum
    @pve_time_prices = PveTimePrice.find_by_price(@total_pve_price) if @total_pve_price > SystemConfig.find_by_name("pve_min_price").value.to_f
  end

  def pve_equipment
    if params[:instance_id] && params[:type]
      equipment = Equipment.find_all_by_equipment_category_id_and_equipment_type_id_and_instance_id(Equipment::CATEGORY_PVE, params[:type].to_i, params[:instance_id].to_i)
    elsif params[:eq_name] && params[:type]
      equipment = Equipment.find_all_by_equipment_category_and_id_equipment_type_id(Equipment::CATEGORY_PVE, params[:type].to_i, :conditions => ["name like ?", "%#{params[:eq_name]}%"])
    end
    render :update do |page|
      if params[:type].to_i == 1
        page.replace_html("pve_equipment_div", :partial => "pve_equipment", :locals => {:pve_equipment => equipment, :checked => false})
      elsif params[:type].to_i == 2
        page.replace_html("pve_weapon_div", :partial => "pve_equipment", :locals => {:pve_equipment => equipment, :checked => false})
      end
    end
  end

  def pvp_suits
    pvp_category = PvpCategory.find(params[:pvp_category_id].to_i)
    render :update do |page|
      page.replace_html("pvp_suits_div", :partial => "pvp_suits", :locals => {:pvp_suits => pvp_category.pvp_suits, :checked => false})
    end
  end

  def pvp_time_price
    update_pvp_session
    @pvp_suits = PvpSuit.find(session[:order][:pvp][:suits], :include => [:pvp_category])
    @pvp_weapons = Equipment.find(session[:order][:pvp][:weapons])
    @total_pvp_price = @pvp_suits.map(&:price).sum + @pvp_weapons.map(&:price).sum
    @pvp_time_prices = PvpTimePrice.find_by_price(@total_pvp_price) if @total_pvp_price > SystemConfig.find_by_name("pvp_min_price").value.to_f
  end

  def pvp_equipment
    if params[:instance_id]
      equipment = Equipment.find_all_by_equipment_category_id_and_equipment_type_id_and_instance_id(Equipment::CATEGORY_PVE, Equipment::TYPE_WEAPON, params[:instance_id].to_i)
    elsif params[:eq_name]
      equipment = Equipment.find_all_by_equipment_category_id_and_equipment_type_id(Equipment::CATEGORY_PVE, Equipment::TYPE_WEAPON,
        :conditions => ["name like ?", "%#{params[:eq_name]}%"])
    end
    render :update do |page|
        page.replace_html("pvp_weapon_div", :partial => "pvp_equipment", :locals => {:pvp_equipment => equipment, :checked => false})
    end
  end

  def game_areas
    @game_areas = GameArea.find_all_by_game_id(params[:game_id])
  end

  def game_servers
    @game_servers = GameServer.find_all_by_game_area_id(params[:area_id])
  end

  private
  def update_pve_session
    session[:order] ||= {}
    session[:order][:pve] ||= {}
    session[:order][:pve][:suits] ||= []
    session[:order][:pve][:equipment] ||= []
    session[:order][:pve][:weapons] ||= []
    if params[:type] == "add"
      session[:order][:pve][:suits] << params[:pve_suit_id].to_i if params[:pve_suit_id]
      session[:order][:pve][:equipment] << params[:pve_equipment_id].to_i if params[:pve_equipment_id]
      session[:order][:pve][:weapons] << params[:pve_weapon_id].to_i if params[:pve_weapon_id]
    elsif params[:type] == "remove"
      session[:order][:pve][:suits].delete(params[:pve_suit_id].to_i) if params[:pve_suit_id]
      session[:order][:pve][:equipment].delete(params[:pve_equipment_id].to_i) if params[:pve_equipment_id]
      session[:order][:pve][:weapons].delete(params[:pve_weapon_id].to_i) if params[:pve_weapon_id]
    end
  end

  def update_pvp_session
    session[:order] ||= {}
    session[:order][:pvp] ||= {}
    session[:order][:pvp][:suits] ||= []
    session[:order][:pvp][:weapons] ||= []
    if params[:type] == "add"
      session[:order][:pvp][:suits] << params[:pvp_suit_id].to_i if params[:pvp_suit_id]
      session[:order][:pvp][:weapons] << params[:pvp_weapon_id].to_i if params[:pvp_weapon_id]
    elsif params[:type] == "remove"
      session[:order][:pvp][:suits].delete(params[:pvp_suit_id].to_i) if params[:pvp_suit_id]
      session[:order][:pvp][:weapons].delete(params[:pvp_weapon_id].to_i) if params[:pvp_weapon_id]
    end
  end
end
