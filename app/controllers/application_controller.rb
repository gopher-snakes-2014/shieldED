class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def signed_in?
    session[:current_user_id]
  end

  def current_user
    @user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def clear_session_error
    session[:error] = nil
  end

  def set_session
    session[:current_user_id] = @user.id
  end

  def username_error
    session[:error] = "Invalid Username"
  end

  def password_error
    session[:error] = "Invalid Password"
  end

  def invalid_key_error
    session[:error] = "Invalid Key"
  end

end
