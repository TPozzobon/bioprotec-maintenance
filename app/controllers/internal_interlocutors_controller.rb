class InternalInterlocutorsController < ApplicationController
  def index
    @internal_interlocutors = InternalInterlocutor.all
  end
  
  def show
    @interlal_interlocutor = InternalInterlocutor.find(params[:id])
  end

  def new
    @interlal_interlocutor = InternalInterlocutor.new
  end

  def create
    @interlal_interlocutor = InternalInterlocutor.new(internal_interlocutor_params)
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
    @interlal_interlocutor.update(internal_interlocutor_params)
    redirect_to internal_interlocutor_path
  end
  
  def destroy
    @interlal_interlocutor = InternalInterlocutor.find(params[:id])
    @interlal_interlocutor.destroy
    redirect_to internal_interlocutor_path
  end
  
  private

  def internal_interlocutor_params
    params.require(:internal_interlocutor).permit(:visa, :phone_number)
  end
end