class User::OrderDataController < ApplicationController
  def upgrade_level_times
    @upgrade_level = UpgradeLevel.find(params[:upgrade_level_id])
  end

  def pve_suits
    pve_category = PveCategory.find(params[:pve_category_id].to_i)
    render :update do |page|
      page.replace_html("pve_suits_div", :partial => "pve_suits", :locals => {:pve_suits => pve_category.pve_suits})
      page.assign("pve_suits", pve_category.pve_suits.map {|suit| suit.attributes.except("created_at", "updated_at") })
      page.assign("selected_pve_category", pve_category.value)
    end
  end

  def pve_time_price
    pve_time_prices = PveTimePrice.find(:all, :conditions => ["pve_price < ?", params[:total_price].to_f])
    max_price = pve_time_prices.map(&:pve_price).max
    @pve_time_prices = pve_time_prices.select {|p| p.pve_price == max_price }
    get_pve_data
  end

  private
  def get_pve_data
    if params[:pve_suit_id] && params[:pve_category_id]
      @pve_suit = PveSuit.find(params[:pve_suit_id])
      @pve_category = PveCategory.find(params[:pve_category_id])
    end
  end
end
