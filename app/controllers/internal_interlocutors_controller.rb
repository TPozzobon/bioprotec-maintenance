class InternalInterlocutorsController < ApplicationController
  def index
    @internal_interlocutors = InternalInterlocutor.all
  end
  
  def show
    @internal_interlocutor = InternalInterlocutor.find(params[:id])
  end

  def new
    @internal_interlocutor = InternalInterlocutor.new
  end

  def create
    @internal_interlocutor = InternalInterlocutor.new(internal_interlocutor_params)
    if @internal_interlocutor.save
      redirect_to internal_interlocutor_path
    else
      render :new
    end
  end

  def edit
    @internal_interlocutor = InternalInterlocutor.find(params[:id])
  end
  
  def update
    @internal_interlocutor = InternalInterlocutor.find(params[:id])
    @internal_interlocutor.update(internal_interlocutor_params)
    redirect_to internal_interlocutor_path
  end
  
  def destroy
    @internal_interlocutor = InternalInterlocutor.find(params[:id])
    @internal_interlocutor.destroy
    redirect_to internal_interlocutor_path
  end
  
  private

  def internal_interlocutor_params
    params.require(:internal_interlocutor).permit(:visa, :phone_number)
  end
end