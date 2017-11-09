class SdEvents::Events
  attr_accessor :name, :venue, :time
  @@all = []

  def self.all
    @@all << self.scrape_events
  end

  def self.scrape_events
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    e = self.new
    doc.search(".event_list").collect do |events|
      e.name = events.search(".event_list .title h4").text
      e.venue = events.search("h5 a").text.strip
      e.time = events.search(".time").text.strip
    end
    e
  end


end
