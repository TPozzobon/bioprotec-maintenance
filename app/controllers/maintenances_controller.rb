class MaintenancesController < ApplicationController
  before_action :find_maintenance, only: [ :show, :edit, :update, :destroy ]
  before_action :find_equipment, only: [ :new, :create ]

  def index  
    @maintenances = Maintenance.all.order('start_time desc')

    filtered_maintenances_status

    if params[:maintenance].present?
      sql_maintenance = "
      equipment.name ILIKE :maintenance
      OR equipment.identifiant ILIKE :maintenance
      "
      @maintenances = Maintenance.joins(:equipment).where(sql_maintenance, maintenance: "%#{params[:maintenance]}%")
    elsif params[:status].present?
      @maintenances = Maintenance.where(status: params[:status]).order('start_time desc')
    end
  end

  def show
  end
  
  def new
    filtered_externals
    filtered_users
    @maintenance = Maintenance.new
  end
  
  def create
    @maintenance = Maintenance.new(maintenance_params)
    @maintenance.equipment = @equipment
    if @maintenance.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  def edit
    filtered_externals
    @external_interlocutor = @maintenance.external_interlocutor.id

    filtered_users
    @user = @maintenance.user.id
  end
  
  def update
    @maintenance.update(maintenance_params)
    redirect_to maintenances_path
  end
  
  def destroy
    @maintenance.destroy
    redirect_to maintenances_path
  end

  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @maintenances = Maintenance.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  private

  def find_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  def find_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end
  
  def filtered_maintenances_status
    unfiltered_status = @maintenances.map { |maintenance| maintenance.status }
    @status = unfiltered_status.uniq
  end
 
  def filtered_externals
    @external_interlocutors = ExternalInterlocutor.all.order('company asc')
    @filtered_externals = @external_interlocutors.where(status: "Actif").map { |e| [e.company.present? ? "#{e.company} - #{e.name}" : "#{e.name}", e.id] }
  end

  def filtered_users
    @users = User.all.order('visa asc')
    @filtered_users = @users.where(status: "Actif").map { |u| [u.visa, u.id] }
  end
 
  def maintenance_params
    params.require(:maintenance).permit(:name, :start_time, :end_time, :description, :status, :external_interlocutor_id, :user_id)
  end
end
