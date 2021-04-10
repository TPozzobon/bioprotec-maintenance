class MaintenancesController < ApplicationController
  def index
    @maintenances = Maintenance.all
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end
  
  def new
    @external_interlocutors = ExternalInterlocutor.all
    @external_interlocutor = ExternalInterlocutor.where(external_interlocutor_id: params[:external_interlocutor_id])
    @internal_interlocutors = InternalInterlocutor.all
    @internal_interlocutor = InternalInterlocutor.where(internal_interlocutor_id: params[:internal_interlocutor_id])
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new
  end
  
  def create
    @external_interlocutor = ExternalInterlocutor.find(params[:external_interlocutor_id])
    @internal_interlocutor = InternalInterlocutor.find(params[:internal_interlocutor_id])
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.external_interlocutor = @external_interlocutor
    @maintenance.internal_interlocutor = @internal_interlocutor
    @maintenance.equipment = @equipment
    if @maintenance.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def edit
    @external_interlocutors = ExternalInterlocutor.all
    @external_interlocutor = ExternalInterlocutor.where(external_interlocutor_id: params[:external_interlocutor_id])
    @internal_interlocutors = InternalInterlocutor.all
    @internal_interlocutor = InternalInterlocutor.where(internal_interlocutor_id: params[:internal_interlocutor_id])
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
