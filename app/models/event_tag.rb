class EventTag < ActiveRecord::Base
  validates_presence_of :event_id
  validates_presence_of :tag_id

  belongs_to :event
  belongs_to :tag
end
