class SdEvents::Scraper

  def self.scrape
    @@doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
  end

  def self.scrape_morning
    self.scrape.css(".daypart_morning .event_list").each do |event|
      event.css(".title").collect do |attribute|
        new_event = SdEvents::Events.new
        new_event.name = attribute.css("h4").text.strip
        new_event.venue = attribute.css("h5").text.strip
        new_event.time = event.css(".time").first.text.strip
    end
  end
end

  def self.scrape_afternoon
    self.scrape.css(".daypart_afternoon .event_list").each do |event|
      event.css(".title").collect do |attribute|
        new_event = SdEvents::Events.new
        new_event.name = attribute.css("h4").text.strip
        new_event.venue = attribute.css("h5").text.strip
        new_event.time = event.css(".time").first.text.strip
    end
  end
end

  def self.scrape_evening
    self.scrape.css(".daypart_evening .event_list").each do |event|
      event.css(".title").collect do |attribute|
        new_event = SdEvents::Events.new
        new_event.name = attribute.css("h4").text.strip
        new_event.venue = attribute.css("h5").text.strip
        new_event.time = event.css(".time").first.text.strip
    end
  end
end

end
