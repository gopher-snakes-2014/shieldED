class SessionsController < ApplicationController

  def new
  end

  def create

    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password_digest])
      set_session
        if @user.username == "Admin"
            redirect_to admin_dashboard_path
        else
          redirect_to parent_dashboard_path
        end
    else
        login_error
        redirect_to root_path
    end
  end


  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end

end
