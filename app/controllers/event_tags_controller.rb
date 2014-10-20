class EventTagsController < ApplicationController

  def create
    @event = Event.find(params[:id])

    @event.tag(params[:tags])

    render partial:'this_event_tags'
  end

end
