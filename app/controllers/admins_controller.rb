class AdminsController < ApplicationController

  http_basic_authenticate_with :name => "Admin", :password => "1234"

  def admin_dashboard
    @events = Event.all
    @total = Event.count
    @latest = Event.last(5)
  end

  def search
    @latest = Event.last(5)
    @results = Event.search(params[:search])
    render :json => @results
  end

end
