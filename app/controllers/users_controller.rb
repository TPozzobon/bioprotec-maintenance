class UsersController < ApplicationController
  def index
    @users = User.all.order('visa asc')

    filtered_users_status

    if params[:status].present?
      @users = User.where(status: params[:status]).order('visa asc')
    end
  end
  
  private

  def filtered_users_status
    unfiltered_status = @users.map { |user| user.status }
    @status = unfiltered_status.uniq
  end
end
