class SessionsController < ApplicationController

  def process_login_admin
    @user = User.find_by(username: params[:username])
    if @user == nil
      username_error
      redirect_to root_path
    elsif @user.password_digest != params[:password_digest]
      password_error
      redirect_to root_path
    else
      clear_session_error
      set_session
      redirect_to admin_dashboard_path(@user)
    end
  end

  # def process_login_admin
  #   @user = User.find_by(username: params[:username])
  #   if @user.valid_login?
  #     redirect_to admin_dashboard_path(@user)
  #   else
  #     redirect_to root_path
  # end

  def process_login
    @user = User.find_by(password_digest: params[:password_digest])
    if @user == nil
      invalid_key_error
      redirect_to root_path
    else
      clear_session_error
      if @user.password_hash == "456PR"
        set_session
        redirect_to parent_dashboard_path(@user)
      else
        set_session
        redirect_to student_dashboard_path(@user)
      end
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end


end
