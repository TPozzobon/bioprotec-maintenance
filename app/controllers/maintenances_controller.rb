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
    # @external_interlocutor = ExternalInterlocutor.ids.each do |id|
    #   ExternalInterlocutor.find(id)
    # end

    @external_interlocutor = ExternalInterlocutor.find(params[:external_interlocutor_id])
    @internal_interlocutor = InternalInterlocutor.find(params[:internal_interlocutor_id])
    @maintenance.equipment = @equipment
    @maintenance.external_interlocutor = @external_interlocutor
    @maintenance.internal_interlocutor = @internal_interlocutor
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
