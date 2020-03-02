class StaticPagesController < ApplicationController
  def home
    if logged_in?
      #get all activity from current_user and from following
      @activities = Activity.where("user_id = ? OR user_id IN (?)", current_user.id, current_user.following.ids).order(created_at: :desc).paginate(page: params[:page], per_page: 6)
      render "users/dashboard"
    end
  end
end
