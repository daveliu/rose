class Admin::EquipmentController < ApplicationController
  include ImageSaver
  before_filter :authenticate_admin
  layout "admin"

  def index
    @equipment = Equipment.paginate(:all, :page => params[:page] || 1, :per_page => params[:per_page] || 10)
  end

  def new
    find_related_data
  end

  def edit
    find_related_data
    @equipment = Equipment.find(params[:id])
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

  def update
    image = params[:eq].delete(:image)
    eq = Equipment.find(params[:id])
    eq.update_attributes!(params[:eq])
    if image
      filepath = save_image(image)
      eq.update_attributes!(:image_path => filepath)
    end
    game_roles = GameRole.find(params[:roles].values.map {|i| i.to_i })
    eq.game_roles = game_roles
    eq.save!
    flash[:notice] = "修改成功"
    redirect_to edit_admin_equipment_path(eq)
  end

  def destroy
    Equipment.destroy(params[:id])
    flash[:notice] = "删除成功"
    redirect_to :action => "index"
  end

  private
  def find_related_data
    @categories = EquipmentCategory.find(:all)
    @types = EquipmentType.find(:all)
    @levels = EquipmentLevel.find(:all)
    @series = EquipmentSerie.find(:all)
    @roles = GameRole.find(:all)
    @instances = Instance.find(:all)
  end
end
