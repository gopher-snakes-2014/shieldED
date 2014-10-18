class EventsController < ApplicationController
  include ApplicationHelper

	def new
		@event = Event.new
		render partial: 'new', locals: { event: @event }
	end

	def create
		Event.create( event_params )
	end

  def event_params
    params.require(:event).permit(:details, :date, :location, :offender, :event_photo, :submitter).merge(user_id: current_user.id)
  end

  def show
    @event = Event.find params[:id]
  end

end
