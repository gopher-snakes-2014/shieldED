class EventsController < ApplicationController

	def new
		@event = Event.new
		render partial: 'new', locals: { event: @event }
	end

	def create
		Event.create( event_params )
	end

  def event_params
    params.require(:event).permit(:details, :submitter, :offender, :location, :date, :event_photo)
  end

  def show
    @event = Event.find params[:id]
  end

end
