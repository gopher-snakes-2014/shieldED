class Event < ActiveRecord::Base

  has_attached_file :event_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :event_photo, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :details

  belongs_to :user
  has_many :event_tags
  has_many :tags, through: :event_tags

  def self.search(search_item)
    incidents = []
    if search_item
      incidents << self.where("details LIKE ?", "%#{search_item}%")
      incidents << self.where("submitter LIKE ?", "%#{search_item}%")
      incidents << self.where("offender LIKE ?", "%#{search_item}%")
      incidents << self.where("location LIKE ?", "%#{search_item}%")
      incidents.flatten!
      incidents.uniq!
      return incidents
    else
      return error  #implement this
    end

  end

  def tag(tags)
    tags.each do |tag|
      self.event_tags.create(tag_id: tag.to_i)
    end
  end

  def self.get_totals
    totals = []
    p "$$$$$$$$$$$$$$"
    p totals << self.find_physical << self.find_verbal << find_rumor << find_cyber << find_exclusion
  end

  def self.find_physical
    where("details LIKE ?", "%impedit%").count  #148
  end

  def self.find_verbal
    where("details LIKE ?", "%blanditiis%").count  #151
  end

  def self.find_rumor
    where("details LIKE ?", "%suscipit%").count #162
  end

  def self.find_cyber
    where("details LIKE ?", "%voluptatem%").count  #546
  end

  def self.find_exclusion
    where("details LIKE ?", "%repellat%").count  #147
  end

end
