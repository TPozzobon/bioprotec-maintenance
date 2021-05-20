class UsersController < ApplicationController
  def index
    if params[:status].present?
      @users = User.where(status: params[:status]).order('visa asc')
    else
      @users = User.all.order('visa asc')
    end

    filtered_users_status
  end
  
  private

  def filtered_users_status
    unfiltered_status = @users.map { |user| user.status }
    @status = unfiltered_status.uniq
  end
end
