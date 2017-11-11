class SdEvents::Events
  attr_accessor :name, :venue, :time
  @@all = []

  def initialize
    @name = name
    @venue = venue
    @time = time
    @@all << self
  end

  def self.save
    @@all << self
  end

  #def self.create_from_collection(events_array)
    #Event.new.tap do |event|
    #events_array.each do |event_hash|
      #event_hash.each do
    #self.new(event_hash)
    #end
  #end

  def self.create_morning_events
    SdEvents::Scraper.scrape_morning
  end

  def self.create_afternoon_events
    SdEvents::Scraper.scrape_afternoon
  end

  def self.create_evening_events
    SdEvents::Scraper.scrape_evening
  end

  def self.all
    @@all
  end


end
