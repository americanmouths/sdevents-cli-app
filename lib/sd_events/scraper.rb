class SdEvents::Scraper

  def self.scrape_morning
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    morning_events = []
    doc.css(".daypart_morning").each do |event|
      event.css(".event_list").each do |attribute|
        event_name = attribute.css(".title").first.css("h4").text
        event_venue = attribute.css(".title").first.css("h5").text.strip
        event_time = attribute.css(".time").first.text.strip
      morning_events << {name: event_name, venue: event_venue, time: event_time}
      end
    end
    morning_events
  end

  def self.scrape_afternoon
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    afternoon_events = []
    doc.css(".daypart_afternoon").each do |event|
      event.css(".event_list").each do |attribute|
        event_name = attribute.css(".title").first.css("h4").text
        event_venue = attribute.css(".title").first.css("h5").text.strip
        event_time = attribute.css(".time").first.text.strip
      afternoon_events << {name: event_name, venue: event_venue, time: event_time}
      end
    end
    afternoon_events
  end

  def self.scrape_evening
    doc = Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
    evening_events = []
    doc.css(".daypart_evening").each do |event|
      event.css(".event_list").each do |attribute|
        event_name = attribute.css(".title").first.css("h4").text
        event_venue = attribute.css(".title").first.css("h5").text.strip
        event_time = attribute.css(".time").first.text.strip
      evening_events << {name: event_name, venue: event_venue, time: event_time}
      end
    end
    evening_events
  end



end
