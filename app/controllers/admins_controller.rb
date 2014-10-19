class AdminsController < ApplicationController

  def admin_dashboard

      @events = Event.all
      @total = Event.count
      @latest = Event.last(5)

  end

  def search
    item_find = params[:search]
    p "*********"
    content_type :json
    # @latest = Event.last(5)
    @results = Event.search(item_find)
    p @results
    p "@@@@@@@@@@@@@@@@@@@@@@@@@@"
    @results.to_json
    # render :admin_dashboard
  end
end
