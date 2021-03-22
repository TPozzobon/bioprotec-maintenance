class MaintenancesController < ApplicationController
  def index
    @maintenances = Equipment.all
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end
  
  def new
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new
  end
  
  def create
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new(maintenance_params)
    if @maintenance.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @maintenance = Maintenance.find(params[:id])
  end
  
  def update
    @maintenance = Maintenance.find(params[:id])
    @maintenance.update(maintenance_params)
    redirect_to root_path
  end
  
  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy
    redirect_to root_path
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(:title, :date, :description, :status)
  end
end
