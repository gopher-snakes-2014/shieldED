class AdminsController < ApplicationController

  def admin_dashboard

      @events = Event.all
      @total = Event.count
      @latest = Event.last(5)

  end

  def search
    p params[:search]
    p "*********"
    @latest = Event.last(5)
    # content_type :json
    @results = Event.search(params[:search])
    p @results
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@"
    render :json => @results
  end
end
