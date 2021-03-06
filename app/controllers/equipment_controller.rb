class EquipmentController < ApplicationController
  before_action :find_equipment, only: [ :show, :edit, :update, :destroy ]

  def index
    @equipment = Equipment.all.order('validity_qualification asc')

    filtered_equipment_status

    if params[:query].present?
      sql_query = "
      equipment.name ILIKE :query
      OR equipment.identifiant ILIKE :query
      "
      @equipment = Equipment.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:status].present?
      @equipment = Equipment.where(status: params[:status]).order('validity_qualification asc')
    elsif params[:criticity].present?
      @equipment = Equipment.where(criticity: params[:criticity]).order('validity_qualification asc')
    end
  end
  
  def show
    filtered_maintenances_status
    
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
      redirect_to equipment_index_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @equipment.update(equipment_params)
    redirect_to equipment_index_path
  end
  
  def destroy
    @equipment.destroy
    redirect_to equipment_index_path
  end
  
  private
  
  def find_equipment
    @equipment = Equipment.find(params[:id])
  end

  def filtered_equipment_status
    unfiltered_status = @equipment.map { |equipment| equipment.status }
    @status = unfiltered_status.uniq
  end

  def filtered_maintenances_status
    unfiltered_status = @equipment.maintenances.map { |maintenance| maintenance.status }
    @status = unfiltered_status.uniq
  end
  
  def equipment_params
    params.require(:equipment).permit(:name, :identifiant, :serial_number, :location, :detail, :commissioning_date, :validity_qualification, :status, :signature_date, :end_contract, :recurrence, :criticity)
  end
end
