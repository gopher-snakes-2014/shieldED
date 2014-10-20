class EventTag < ActiveRecord::Base
  validates_presence_of :event_id
  validates_presence_of :tag_id

  validates_uniqueness_of :tag_id, scope: :event_id

  belongs_to :event
  belongs_to :tag
end
