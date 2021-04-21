class UsersController < ApplicationController
  def index
    @users = User.all.order('visa asc')
  end
end
