class Tag < ActiveRecord::Base

  validates_presence_of :tag_name

  has_many :event_tags
  has_many :events, through: :event_tags
end
