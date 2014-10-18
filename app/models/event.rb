class Event < ActiveRecord::Base
	validates_presence_of :details

	belongs_to :user
end
