class EventTagsController < ApplicationController

  def create
    @event = Event.find(params[:id])

    @event.tag(params[:tags])

    render partial:'this_event_tags'
  end

  def delete
    @event = Event.find(params[:id])
    @event.untag(params[:untags])

    @tags = Tag.all
    render partial: 'tags/show'
  end
end
