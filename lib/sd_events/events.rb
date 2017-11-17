class SdEvents::Events
  attr_accessor :name, :venue, :location, :category, :time
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.find(id)
    self.all[id.to_i-1]
  end

  def self.empty?
    if @@all.empty?
      SdEvents::CLI.no_events
    end
  end

  def self.create_daypart(event_time) #=> "afternoon"
    SdEvents::Scraper.scrape_daypart(event_time) #=> "SdEvents::Scraper.scrape_daypart("afternoon")"
    self.empty?
  end


end
