class EventsController < ApplicationController

	def new
		@event = Event.new
		render partial: 'new', locals: { event: @event }
	end

	def create
		Event.create(details: params[:event][:details])
	end
end
