class EventsController < ApplicationController
  include ApplicationHelper

  def new
    if signed_in?
      @event = Event.new
      render partial: 'new', locals: { event: @event }
    else
      redirect_to root_path
    end
  end

	def create
	 @event = Event.create( event_params )
   UserMailer.event_notification(@event).deliver
   render partial: "acknowledgement"
	end

  def show
    @event = Event.find params[:id]
    @tags = Tag.all
  end

  def show_partial
    @event = Event.find params[:id]
    @tags = Tag.all
    render partial: 'show'
  end

  private

  def event_params
    params.require(:event).permit(:details, :date, :location, :offender, :event_photo, :submitter).merge(user_id: current_user.id)
  end

end

