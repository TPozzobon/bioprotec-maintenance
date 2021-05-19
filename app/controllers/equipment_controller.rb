class EquipmentController < ApplicationController
  before_action :find_equipment, only: [ :show, :edit, :update, :destroy ]
  
  def index
    if params[:query].present?
      sql_query = "
      equipment.name ILIKE :query
      OR equipment.identifiant ILIKE :query
      "
      @equipment = Equipment.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:status].present?
      @equipment = Equipment.where(status: params[:status]).order('name asc')
    else
      @equipment = Equipment.all.order('name asc')
    end
    
    unfiltered_status = @equipment.map { |equipment| equipment.status }
    @status = unfiltered_status.uniq
  end
  
  def show
    unfiltered_status = @equipment.maintenances.map { |maintenance| maintenance.status }
    @status = unfiltered_status.uniq
    
    if params[:status].present?
      @sort_maintenances = @equipment.maintenances.where(status: params[:status]).order('start_time desc')
    else
      @sort_maintenances = @equipment.maintenances.order('start_time desc')
    end
  end
  
  def new
    @equipment = Equipment.new
  end
  
  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @equipment.update(equipment_params)
    redirect_to root_path
  end
  
  def destroy
    @equipment.destroy
    redirect_to root_path
  end
  
  private
  
  def find_equipment
    @equipment = Equipment.find(params[:id])
  end
  
  def equipment_params
    params.require(:equipment).permit(:name, :identifiant, :location, :detail, :commissioning_date, :validity_qualification, :status)
  end
end
