class Event < ActiveRecord::Base

	validates_presence_of :details
	belongs_to :user
  has_attached_file :event_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :event_photo, :content_type => /\Aimage\/.*\Z/
	belongs_to :user

  def self.search(search_item)

    if search_item
      where("details LIKE ?", "%#{search_item}%")
    else
      return search_item
    end
  end
end
