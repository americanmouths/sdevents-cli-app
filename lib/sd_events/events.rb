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

  def self.create_morning_events
    SdEvents::Scraper.scrape_morning
    if @@all.empty?
      SdEvents::CLI.no_events
    end
  end

  def self.create_afternoon_events
    SdEvents::Scraper.scrape_afternoon
    if @@all.empty?
      SdEvents::CLI.no_events
    end
  end

  def self.create_evening_events
    SdEvents::Scraper.scrape_evening
    if @@all.empty?
      SdEvents::CLI.no_events
    end
  end

  def self.create_night_events
    SdEvents::Scraper.scrape_night
    if @@all.empty?
      SdEvents::CLI.no_events
    end
  end

end
