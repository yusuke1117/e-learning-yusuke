class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)

    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to root_url #Goes to show page
    else
      render 'new'
    end
  end

#This is Sign out button
  def destroy
    log_out
    redirect_to root_url
  end
end
