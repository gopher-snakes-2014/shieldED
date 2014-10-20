class AdminsController < ApplicationController

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
