class User::OrderDataController < ApplicationController
  def upgrade_level_times
    @upgrade_level = UpgradeLevel.find(params[:upgrade_level_id])
  end

  def pve_suits
    pve_category = PveCategory.find(params[:pve_category_id].to_i)
    render :update do |page|
      page.replace_html("pve_suits_div", :partial => "pve_suits", :locals => {:pve_suits => pve_category.pve_suits, :checked => false})
      page.assign("pve_suits", pve_category.pve_suits.map {|suit| suit.attributes.except("created_at", "updated_at") })
    end
  end

  def pve_time_price
    update_pve_session
    @pve_suits = PveSuit.find(session[:pve][:suits], :include => [:pve_category])
    @total_pve_price = @pve_suits.map(&:price).sum
    @pve_time_prices = PveTimePrice.find_by_price(@total_pve_price)
  end

  private
  def update_pve_session
    session[:pve] ||= {}
    session[:pve][:suits] ||= []
    if params[:type] == "add"
      session[:pve][:suits] << params[:pve_suit_id].to_i
    elsif params[:type] == "remove"
      session[:pve][:suits].delete(params[:pve_suit_id].to_i)
    end
  end
end
