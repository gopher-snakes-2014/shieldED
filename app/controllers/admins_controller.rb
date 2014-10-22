class AdminsController < ApplicationController

  http_basic_authenticate_with :name => "Admin", :password => "1234"

  def admin_dashboard

    @events = Event.all
    @total = @events.length
    @latest = Event.last(5)

  end

  def search
    @latest = Event.last(5)
    @results = Event.search(params[:search])
    render :json => @results
  end

  def pie
    totals = Event.get_totals
    render :json => {:totals => totals}
  end

  def bubbles
    totals = Event.get_totals
    render :json => {:totals => totals}
  end

end
