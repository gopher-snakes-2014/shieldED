class EventsController < ApplicationController
  include ApplicationHelper

	def new
		@event = Event.new
		render partial: 'new', locals: { event: @event }
	end

	def create
		Event.create(event_params)
	end

  private

  def event_params
    params.require(:event).permit(:details, :date, :location, :offender, :submitter).merge(user_id: current_user.id)
  end
end
