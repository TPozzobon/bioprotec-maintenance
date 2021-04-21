class ExternalInterlocutorsController < ApplicationController
  def index
    if params[:external].present?
      sql_external = "
      external_interlocutors.name ILIKE :external
      OR external_interlocutors.company ILIKE :external
      "
      @external_interlocutors = ExternalInterlocutor.where(sql_external, external: "%#{params[:external]}%")
    else
      @external_interlocutors = ExternalInterlocutor.all.order('company asc')
    end
  end

  def show
    @external_interlocutor = ExternalInterlocutor.find(params[:id])
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
    @external_interlocutor = ExternalInterlocutor.find(params[:id])
  end
  
  def update
    @external_interlocutor = ExternalInterlocutor.find(params[:id])
    @external_interlocutor.update(external_interlocutor_params)
    redirect_to external_interlocutors_path
  end

  def destroy
    @external_interlocutor = ExternalInterlocutor.find(params[:id])
    @external_interlocutor.destroy
    redirect_to external_interlocutors_path
  end
  
  private

  def external_interlocutor_params
    params.require(:external_interlocutor).permit(:name, :company, :phone_number, :mobile_number, :email)
  end
end
