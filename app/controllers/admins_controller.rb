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
    p "******* in the route"
    totals_quarter = Event.get_month_totals('ducimus')
      #, 'aliquem', 'suscipit', 'molestiae', 'repellat', 'voluptatem', 'occaecati', 'blanditiis', 'impedit'])
    render :json => {:totals_quarter => totals_quarter}
  end

end
