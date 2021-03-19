class InternalInterlocutorsController < ApplicationController
  def index
    @internal_interlocutors = InternalInterlocutor.all
  end
end
