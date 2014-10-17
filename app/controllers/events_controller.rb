class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		p params
		Event.create(details: params[:event][:details])
	end
end
