class Event < ActiveRecord::Base
	validates_presence_of :details
	belongs_to :user

  def self.search(search_item)
    p search_item
      p "****************"
    if search_item
      p search_item
      where("details LIKE ?", "%#{search_item}%")
    else
      return search_item
    end
  end

end
