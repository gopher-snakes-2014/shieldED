class AdminsController < ApplicationController

  http_basic_authenticate_with :name => "Admin", :password => "1234"

  def admin_dashboard
    @events = Event.all
    @total = @events.length
    @latest = Event.last(10)
    render partial:'admin_dashboard'
  end

  def search
    @latest = Event.last(10)
    @results = Event.search(params[:search])
    render :json => @results
  end

  def pie
    totals = Event.get_totals
    render :json => {:totals => totals}
  end

  def bubbles

    totals_quarter = Event.get_month_totals
    totals_quarter
    offender_stats = Event.offender_stats
    render :json => {:totals_quarter => totals_quarter, :offender_stats => offender_stats}
  end

  def lines
    totals = Event.get_quarter
    render :json => {:totals => totals}
  end

end
