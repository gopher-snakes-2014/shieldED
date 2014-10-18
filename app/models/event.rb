class Event < ActiveRecord::Base
	validates_presence_of :details

  def self.search(search)
    if search
      where("details LIKE ?", ["%#{search}%"])
    else
      find(:all)
    end
  end
end
