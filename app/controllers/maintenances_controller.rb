class MaintenancesController < ApplicationController
  def index  
    if params[:maintenance].present?
      sql_maintenance = "
      equipment.name ILIKE :maintenance
      OR equipment.identifiant ILIKE :maintenance
      "
      @maintenances = Maintenance.joins(:equipment).where(sql_maintenance, maintenance: "%#{params[:maintenance]}%")
    elsif params[:status].present?
      @maintenances = Maintenance.where(status: params[:status]).order('start_date asc')
    else
      @maintenances = Maintenance.all.order('start_date asc')
    end

    unfiltered_status = @maintenances.map { |maintenance| maintenance.status }
    @status = unfiltered_status.uniq
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end
  
  def new
    @external_interlocutors = ExternalInterlocutor.all.order('company asc')
    @filtered_externals = @external_interlocutors.map { |e| ["#{e.company} - #{e.name}", e.id] }
    @users = User.all
    @filtered_users = @users.map { |u| [u.visa, u.id] }
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
    @external_interlocutors = ExternalInterlocutor.all.order('company asc')
    @filtered_externals = @external_interlocutors.map { |e| ["#{e.company} - #{e.name}", e.id] }
    @users = User.all
    @filtered_users = @users.map { |u| [u.visa, u.id] }
    @maintenance = Maintenance.find(params[:id])
  end
  
  def update
    @external_interlocutor = ExternalInterlocutor.find(params[:external_interlocutor_id])
    @maintenance = Maintenance.find(params[:id])
    @maintenance.external_interlocutor = @external_interlocutor
    @user = User.find(params[:user_id])
    @maintenance.user = @user
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
    params.require(:maintenance).permit(:title, :start_date, :end_date, :description, :status, :external_interlocutor_id, :user_id)
  end
end
