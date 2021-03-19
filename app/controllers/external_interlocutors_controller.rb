class ExternalInterlocutorsController < ApplicationController
  def index
    @external_interlocutors = ExternalInterlocutor.all
  end

  def show
    @external_interlocutor = ExternalInterlocutor.find(params[:id])
  end
  
end
