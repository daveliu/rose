class Admin::EquipmentController < ApplicationController
  include ImageSaver
  before_filter :authenticate_admin
  layout "admin"

  def index
    @equipment = Equipment.paginate(:all, :page => params[:page] || 1, :per_page => params[:per_page] || 10)
  end

  def new
    @categories = EquipmentCategory.find(:all)
    @types = EquipmentType.find(:all)
    @levels = EquipmentLevel.find(:all)
    @series = EquipmentSerie.find(:all)
    @roles = GameRole.find(:all)
    @instances = Instance.find(:all)
  end

  def create
    filepath = save_image(params[:eq].delete(:image))
    game_roles = GameRole.find(params[:roles].values.map {|i| i.to_i })
    eq = Equipment.new(params[:eq].update(:image_path => filepath))
    eq.game_roles = game_roles
    eq.save!
    flash[:notice] = "添加武器成功"
    redirect_to :action => "index"
  end

  def destroy
    Equipment.delete(params[:id])
    flash[:notice] = "删除成功"
    redirect_to :action => "index"
  end
end
