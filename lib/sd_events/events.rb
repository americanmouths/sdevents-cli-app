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

  def self.all
    @@all
  end

end
