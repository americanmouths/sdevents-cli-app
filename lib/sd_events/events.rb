class SdEvents::Events
  attr_accessor :name, :venue, :city, :area, :category, :time
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
    self.all[id-1]
  end

  def self.empty?
    if @@all.empty?
      SdEvents::CLI.no_events
    end
  end

  def self.create_morning_events
    SdEvents::Scraper.scrape_morning
    self.empty?
  end

  def self.create_afternoon_events
    SdEvents::Scraper.scrape_afternoon
    self.empty?
  end

  def self.create_evening_events
    SdEvents::Scraper.scrape_evening
    self.empty?
  end

  def self.create_night_events
    SdEvents::Scraper.scrape_night
    self.empty?
  end

end
