class EquipmentController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "
      equipment.name ILIKE :query
      OR equipment.identifiant ILIKE :query
      "
      @equipment = Equipment.where(sql_query, query: "%#{params[:query]}%")
    else
      @equipment = Equipment.all.order('name asc')
    end

    unfiltered_status = @equipment.map { |equipment| equipment.status }
    @status = unfiltered_status.uniq

    if params[:status].present?
      @equipment = Equipment.where(status: params[:status]).order('name asc')
    else
      @equipment = Equipment.all.order('name asc')
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @sort_maintenances = @equipment.maintenances.order('start_date asc')
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
    @equipment = Equipment.find(params[:id])
  end
  
  def update
    @equipment = Equipment.find(params[:id])
    @equipment.update(equipment_params)
    redirect_to root_path
  end
  
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to root_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :identifiant, :location, :detail, :commissioning_date, :validity_qualification, :status)
  end
end
