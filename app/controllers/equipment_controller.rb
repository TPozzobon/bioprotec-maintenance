class EquipmentController < ApplicationController
  def index
    @equipment = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
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

  private

  def equipment_params
    params.require(:equipment).permit(:name, :identifiant, :location, :detail, :commissioning_date, :validity_qualification, :status)
  end
end
