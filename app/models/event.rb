class Event < ActiveRecord::Base
	validates_presence_of :details
end
