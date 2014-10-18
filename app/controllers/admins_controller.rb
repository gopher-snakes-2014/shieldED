class AdminsController < ApplicationController

  def admin_dashboard

      @events = Event.all
      @total = Event.count
      @latest = Event.last(5)
  end

  def search
    @results = Event.search(params[:search])
    p @results
    p "*$*$*$*$*$*$*$*$*"
  end
end
