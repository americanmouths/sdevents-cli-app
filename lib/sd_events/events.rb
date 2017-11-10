class SdEvents::Events
  attr_accessor :name, :venue, :time
  @@all = []

  def initialize(event_hash)
    event_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(events_array)
    events_array.each do |event_hash|
    self.new(event_hash)
    end
  end

  def self.create_morning_events
    event_array = SdEvents::Scraper.scrape_morning
    self.create_from_collection(event_array)
  end

  def self.create_afternoon_events
    event_array = SdEvents::Scraper.scrape_afternoon
    self.create_from_collection(event_array)
  end

  def self.create_evening_events
    event_array = SdEvents::Scraper.scrape_evening
    self.create_from_collection(event_array)
  end

  def self.all
    @@all
  end

end
