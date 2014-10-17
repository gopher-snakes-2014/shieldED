class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
  end

  def process_login
    @user = User.find_by(username: params[:username])
    if @user == nil
      session[:error] = "Invalid Username"
      redirect_to root_path
    elsif @user.password_hash != params[:password_hash]
      session[:error] = "Invalid Password"
      redirect_to root_path
    else
      session[:error] = nil
      if @user.username == "Admin"
        session[:current_user_id] = @user.id
        redirect_to admin_dashboard_path(@user)
      elsif @user.username == "Parent"
        session[:current_user_id] = @user.id
        redirect_to parent_dashboard_path(@user)
      elsif @user.username == "Student"
        session[:current_user_id] = @user.id
        redirect_to student_dashboard_path(@user)
      end
    end
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

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password_hash, :level)
  end

end
