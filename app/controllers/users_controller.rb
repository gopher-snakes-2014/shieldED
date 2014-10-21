class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
  end



  def admin_dashboard
  end

  def parent_dashboard
    @event = Event.new
  end

  def student_dashboard
    @event = Event.new
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end

end
