class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
  end

  def process_login
    @user = User.find_by(username: params[:username])
    if @user == nil
      username_error
      redirect_to root_path
    elsif @user.password_hash != params[:password_hash]
      password_error
      redirect_to root_path
    else
      clear_session_error
      if @user.username == "Admin"
        set_session
        redirect_to admin_dashboard_path(@user)
      elsif @user.username == "Parent"
        set_session
        p "********************************************************************"
        p @user
        redirect_to parent_dashboard_path(@user)
      elsif @user.username == "Student"
        set_session
        redirect_to student_dashboard_path(@user)
      end
    end
  end

  def admin_dashboard
  end

  def parent_dashboard
    # p @user
    # @user = User.find params[:id]
    @event = Event.new
    @events = Event.all
    # @events = Event.where(user_id: @user.id)
  end

  def student_dashboard
    @event = Event.new
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end

  def show
    @user = User.find params[:id]
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     set_session
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  private

  # def user_params
  #   params.require(:user).permit(:username, :password_hash, :level)
  # end

end
