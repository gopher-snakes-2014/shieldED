class Event < ActiveRecord::Base

	validates_presence_of :details
  has_attached_file :event_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :event_photo, :content_type => /\Aimage\/.*\Z/

	belongs_to :user

  def self.search(search)
    if search
      where("details LIKE ?", "%#{search}%")
    else
      find(:all)
    end
  end
end
