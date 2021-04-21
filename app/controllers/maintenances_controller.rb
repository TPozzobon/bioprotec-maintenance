class MaintenancesController < ApplicationController
  def index  
    if params[:maintenance].present?
      sql_maintenance = "
      equipment.name ILIKE :maintenance
      OR equipment.identifiant ILIKE :maintenance
      "
      @maintenances = Maintenance.joins(:equipment).where(sql_maintenance, maintenance: "%#{params[:maintenance]}%")
    else
      @maintenances = Maintenance.all.order('start_date asc')
    end
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end
  
  def new
    @external_interlocutors = ExternalInterlocutor.all
    @external_interlocutor = ExternalInterlocutor.where(external_interlocutor_id: params[:external_interlocutor_id])
    @users = User.all
    @user = User.where(user_id: params[:user_id])
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new
  end
  
  def create
    @external_interlocutor = ExternalInterlocutor.find(params[:external_interlocutor_id])
    @user = User.find(params[:user_id])
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.external_interlocutor = @external_interlocutor
    @maintenance.user = @user
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
    @users = User.all
    @user = User.where(user_id: params[:user_id])
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
    params.require(:maintenance).permit(:title, :start_date, :end_date, :description, :status)
  end
end
