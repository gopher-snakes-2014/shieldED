class AdminsController < ApplicationController
# CR use REST - this is index
# CR add a before filter for admin role status
 before do
  if !(signed_in && admin)
  redirect root
 end

  def admin_dashboard
    @events = Event.all
    @total = Event.count
    @latest = Event.last(5)  #CR don't hit the database again for this get from @events
  end

  def search
    @latest = Event.last(5)  #CR not sure if you need this
    @results = Event.search(params[:search])  #CR no @ if you aren't using the  var on your view.
    render :json => @results
  end

end
