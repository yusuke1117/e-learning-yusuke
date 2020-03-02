class Admin::UsersController < ApplicationController
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 7)
  end
end
