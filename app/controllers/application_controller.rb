class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def signed_in?
    session[:current_user_id]
  end

  def current_user
    @user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def set_session
    session[:current_user_id] = @user.id
  end

  def admin_login_error
    flash[:error] = "Invalid Username or Password"
  end

  def login_error
    flash[:error] = "Invalid Key"
  end

  helper_method :current_user, :signed_in

end
