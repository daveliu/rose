class User::OrderDataController < ApplicationController
  def upgrade_level_times
    @upgrade_level = UpgradeLevel.find(params[:upgrade_level_id])
  end

  def pve_suits
    @pve_suits = PveSuit.find_by_pve_category_id(params[:pve_category_id].to_i)
    render :update do |page|
      page.replace_html("pve_suits_div", :partial => "pve_suits")
    end
  end
end
