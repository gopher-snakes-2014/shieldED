class Event < ActiveRecord::Base

	validates_presence_of :details
	belongs_to :user
  # has_attached_file :event_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :event_photo, :content_type => /\Aimage\/.*\Z/


  def self.search(search_item)
    incidents = []
    if search_item
      incidents << self.where("details LIKE ?", "%#{search_item}%")
      incidents << self.where("submitter LIKE ?", "%#{search_item}%")
      p incidents
      p "%$%$%$%$%$%$%$%$%$%$%$%$%$%$%"
      incidents << self.where("offender LIKE ?", "%#{search_item}%")
      incidents << self.where("location LIKE ?", "%#{search_item}%")
      p incidents.length
      p "***********$$$$$$$*********"
      p incidents.flatten!
      p incidents.length
      incidents.uniq!
      p incidents.length
      return incidents
    else
      return search_item
    end
  end
end
