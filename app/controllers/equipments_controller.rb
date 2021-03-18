class EquipmentsController < ApplicationController
  def index
    @equipments = Equipments.all
  end

end
