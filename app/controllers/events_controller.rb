class EventsController < ApplicationController
  include ApplicationHelper

	def new
		@event = Event.new
		render partial: 'new', locals: { event: @event }
	end

	def create
	 @event = Event.create( event_params )
   UserMailer.event_notification(@event).deliver
   render "acknowledgement"
	end

  def show
    # CR use includes to avoid n+1 effect when showing @event.tags
    @event = Event.find params[:id]
    @tags = Tag.all
  end

  private

  def event_params
    params.require(:event).permit(:details, :date, :location, :offender, :event_photo, :submitter).merge(user_id: current_user.id)
  end

end
