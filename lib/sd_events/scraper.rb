class SdEvents::Scraper

  def self.scrape_morning
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    morning_events = []
    doc.css(".daypart_morning .event_list").each do |event|
      event.css(".title").collect do |attribute|
        event_name = attribute.css("h4").text.strip
        event_venue = attribute.css("h5").text.strip
        event_time = event.css(".time").first.text.strip
      morning_events << {name: event_name, venue: event_venue, time: event_time}
      end
    end
    morning_events
  end

  def self.scrape_afternoon
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    afternoon_events = []
    doc.css(".daypart_afternoon .event_list").each do |event|
      event.css(".title").collect do |attribute|
        event_name = attribute.css("h4").text.strip
        event_venue = attribute.css("h5").text.strip
        event_time = event.css(".time").first.text.strip
      afternoon_events << {name: event_name, venue: event_venue, time: event_time}
      end
    end
    afternoon_events
  end

  def self.scrape_evening
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    evening_events = []
    doc.css(".daypart_evening .event_list").each do |event|
      event.css(".title").collect do |attribute|
        event_name = attribute.css("h4").text.strip
        event_venue = attribute.css("h5").text.strip
        event_time = event.css(".time").first.text.strip
        evening_events << {name: event_name, venue: event_venue, time: event_time}
      end
    end
    evening_events
  end



end
