class ExternalInterlocutorsController < ApplicationController
  def index
    @external_interlocutors = ExternalInterlocutor.all
  end
end
