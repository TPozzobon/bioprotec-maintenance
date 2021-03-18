class EquipmentsController < ApplicationController
  def index
    @equipments = Equipments.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
  
  def new
    @equipment = Equipment.new
  end
  
  def create
    Equipment.create(equipment_params)
    redirect_to equipments_path
  end
  
  def edit
    @equipment = Equipment.find(params[:id])
  end
  
  def update
    @equipment = Equipment.find(params[:id])
    @equipment.update(equipment_params)
    redirect_to equipments_path(equipment)
  end
  
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to equipments_path
  end
  
  private

  def restaurant_params
 	  params.require(:equipment).permit(:type, :identifiant, :serial_number, :location, :detail, :commissioning_date, :validity_qualification, :preventive_maintenance, :status)
  end

end
