class MaintenancesController < ApplicationController
  def index  
    if params[:maintenance].present?
      sql_maintenance = "
      equipment.name ILIKE :maintenance
      OR equipment.identifiant ILIKE :maintenance
      "
      @maintenances = Maintenance.joins(:equipment).where(sql_maintenance, maintenance: "%#{params[:maintenance]}%")
    elsif params[:status].present?
      @maintenances = Maintenance.where(status: params[:status]).order('start_time desc')
    else
      @maintenances = Maintenance.all.order('start_time desc')
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
    @users = User.all.order('visa asc')
    @filtered_users = @users.map { |u| [u.visa, u.id] }
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new
  end
  
  def create
    @equipment = Equipment.find(params[:equipment_id])
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.equipment = @equipment
    if @maintenance.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def edit
    @maintenance = Maintenance.find(params[:id])
    @external_interlocutor = @maintenance.external_interlocutor.id
    @user = @maintenance.user.id
    @external_interlocutors = ExternalInterlocutor.all.order('company asc')
    @filtered_externals = @external_interlocutors.map { |e| ["#{e.company} - #{e.name}", e.id] }
    @users = User.all.order('visa asc')
    @filtered_users = @users.map { |u| [u.visa, u.id] }
  end
  
  def update
    @maintenance = Maintenance.find(params[:id])
    @maintenance.update(maintenance_params)
    redirect_to maintenances_path
  end
  
  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy
    redirect_to maintenances_path
  end

  def calendar
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date
  
    # For a monthly view:
    @maintenances = Maintenance.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(:name, :start_time, :end_time, :description, :status, :external_interlocutor_id, :user_id)
  end
end
