class ExternalInterlocutorsController < ApplicationController
  before_action :find_external, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:external].present?
      sql_external = "
      external_interlocutors.name ILIKE :external
      OR external_interlocutors.company ILIKE :external
      "
      @external_interlocutors = ExternalInterlocutor.where(sql_external, external: "%#{params[:external]}%")
    elsif params[:status].present?
      @external_interlocutors = ExternalInterlocutor.where(status: params[:status]).order('company asc')
    else
      @external_interlocutors = ExternalInterlocutor.all.order('company asc')
    end

    filtered_status
  end

  def show
  end

  def new
    @external_interlocutor = ExternalInterlocutor.new
  end

  def create
    @external_interlocutor = ExternalInterlocutor.new(external_interlocutor_params)
    if @external_interlocutor.save
      redirect_to external_interlocutors_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    @external_interlocutor.update(external_interlocutor_params)
    redirect_to external_interlocutors_path
  end

  def destroy
    @external_interlocutor.destroy
    redirect_to external_interlocutors_path
  end
  
  private

  def find_external
    @external_interlocutor = ExternalInterlocutor.find(params[:id])
  end
  
  def filtered_status
    unfiltered_status = @external_interlocutors.map { |external_interlocutor| external_interlocutor.status }
    @status = unfiltered_status.uniq
  end
  
  def external_interlocutor_params
    params.require(:external_interlocutor).permit(:name, :company, :phone_number, :mobile_number, :email, :status)
  end
end
