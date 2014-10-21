class AdminsController < ApplicationController

  def admin_dashboard

    @events = Event.all
    @total = @events.length
    @latest = Event.last(5)
    @physical_total = Event.find_physical
    @verbal_total = Event.find_verbal
    p @verbal_total
    @rumor_total = Event.find_rumor
    @cyber_total = Event.find_cyber
    @ex_total = Event.find_exclusion
    render json: {:physical => @physical_total}
  end

  def search
    @latest = Event.last(5)
    @results = Event.search(params[:search])
    render :json => @results
  end

end
