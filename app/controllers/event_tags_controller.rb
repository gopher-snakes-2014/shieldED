class EventTagsController < ApplicationController

  def create
    @event = Event.find(params[:id])

    params[:tags].each do |tag|
      @event.event_tags.create(tag_id: tag.to_i)
    end

    @event = Event.find(params[:id])
    render partial:'this_event_tags'
  end

end
