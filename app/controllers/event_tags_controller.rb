class EventTagsController < ApplicationController

  def create
    @event = Event.find(params[:id])

    @event.tag(params[:tags]) # Use Strong params in the model method

    render partial:'this_event_tags'
  end

end
