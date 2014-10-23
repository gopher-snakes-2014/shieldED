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
      incidents << self.where("details LIKE ?", "%#{search_item}%") << self.where("submitter LIKE ?", "%#{search_item}%") << self.where("offender LIKE ?", "%#{search_item}%") << self.where("location LIKE ?", "%#{search_item}%")
      incidents.flatten!
      incidents.uniq!
      return incidents
    else
      return search_item
    end
  end

  def self.get_totals
    totals = []
    totals << self.find_physical << self.find_verbal << self.find_rumor << self.find_cyber << self.find_exclusion
  end

  def self.find_physical
    where("details LIKE ?", "%impedit%").count
  end

  def self.find_verbal
    where("details LIKE ?", "%blanditiis%").count
  end

  def self.find_rumor
    where("details LIKE ?", "%suscipit%").count
  end

  def self.find_cyber
    where("details LIKE ?", "%voluptatem%").count
  end

  def self.find_exclusion
    where("details LIKE ?", "%repellat%").count
  end

  def self.get_month_totals
    words = ['ducimus','aliquam', 'suscipit', 'molestiae', 'repellat', 'voluptatem', 'occaecati', 'blanditiis', 'impedit']
    totals = []
    words.each do |word|
      num = 4
        while num >= 0
          events = Event.by_calendar_month(Time.now - num.month)
          events = events.where("details LIKE ?", "%#{word}%").count
          totals << events
          num -= 1
        end
      end
      totals
  end

  def self.get_top_offender_names
     # offenders = Event.select("offender, COUNT(*)").group("offender").order("COUNT(*) DESC").limit(20)
     offenders = Event.group(:offender).count
     offenders = offenders.sort_by { |k,v| v }.last(200).flatten
     offenders
  end

  def self.offender_stats
    words = ['ducimus','aliquam', 'suscipit', 'molestiae', 'repellat', 'voluptatem', 'occaecati', 'blanditiis', 'impedit']
    radii = []
    bullies = Event.get_top_offender_names
    words.each do |word|
    radius = 0
      num = 4
        while num >= 0
          events = Event.by_calendar_month(Time.now - num.month)
          events = events.where("details LIKE ?", "%#{word}%")
          events.each do |event|
            offender = event.offender
            if bullies.include?(offender)
              radius += 25
            else radius += 1
            end
          end
          radius = radius/events.size
          num -= 1
          radii << radius
        end
      end
      radii
  end

  def self.get_quarter
    num = 4
    totals = []
      while num >= 0
        p num
        events = Event.by_calendar_month(Time.now - num.month)
        totals << events.count
        num -= 1
      end
    totals
  end

  def tag(new_tag_ids)
    new_tag_ids.each do |tag|
      event_tags.create(tag_id: tag)
    end
  end

  def untag(untag_ids)
    untag_ids.each do |untag|
      event_tags.find(untag).delete
    end
  end

end
