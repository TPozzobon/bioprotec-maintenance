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
  
end
