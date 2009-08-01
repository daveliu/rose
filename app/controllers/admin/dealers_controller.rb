class Admin::DealersController < ApplicationController
  include ImageSaver
  before_filter :authenticate_admin
  layout "admin"

  def index
    @dealers = Dealer.find(:all)
  end

  def create
    image_id = save_image(params[:image])
    Dealer.create!(params[:dealer].update(:id_card_image => image_id))
    flash[:notice] = "添加代练组成功"
    redirect_to :action => "index"
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def update
    dealer = Dealer.find(params[:id])
    password = params[:dealer].delete(:password)
    params[:dealer].update(:password => Digest::MD5.hexdigest(password)) if password
    image_id = save_image(params[:image])
    params[:dealer].update(:id_card_image => image_id) if image_id
    dealer.update_attributes!(params[:dealer])
    flash[:notice] = "修改成功"
    redirect_to edit_admin_dealer_path(dealer)
  end

  def destroy
    Dealer.destroy(params[:id])
    flash[:notice] = "删除成功"
    redirect_to :action => "index"
  end
end
