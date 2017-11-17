class SdEvents::Scraper

  def self.scrape
    Nokogiri::HTML(open("https://www.sandiegoreader.com/events/#"))
  end

  def self.scrape_events(attribute)
    new_event = SdEvents::Events.new
    new_event.name = attribute.css(".title").css("h4").text.strip
    new_event.venue = attribute.css(".title").css("h5").text.strip
    new_event.time = attribute.css("td.time").text.strip
    new_event.location = attribute.css("td.city").text.strip
    new_event.category = attribute.css("td.category").text.strip
  end

  def self.scrape_daypart(event_time)
    self.scrape.css("div#body div#content.content div.daypart_#{event_time} .event_list").each do |event|
      event.css("tr").collect do |attribute|
        self.scrape_events(attribute)
      end
    end
  end


end
