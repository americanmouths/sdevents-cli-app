class SdEvents::CLI

  def call
    puts ""
    puts "******* Events Happening in San Diego Today **********"
    puts ""
    list_menu
  end

  def list_menu
    puts ""
    puts "Hello, the time is now #{Time.now}. Would you like to see:"
    puts "1. Morning Events"
    puts "2. Afternoon Events"
    puts "3. Evening Events"
    puts = ""

    input = gets.strip.downcase
    if input == "1"
      create_morning_events
      display_events
    elsif input == "2"
      create_afternoon_events
      display_events
    elsif input == "3"
      create_evening_events
      display_events
    else
      "Not sure what you're asking, please enter a valid number choice."
    end
  end

  def create_morning_events
    event_array = SdEvents::Scraper.scrape_morning
    SdEvents::Events.create_from_collection(event_array)
  end

  def create_afternoon_events
    event_array = SdEvents::Scraper.scrape_afternoon
    SdEvents::Events.create_from_collection(event_array)
  end

  def create_evening_events
    event_array = SdEvents::Scraper.scrape_evening
    SdEvents::Events.create_from_collection(event_array)
  end

  def display_events
    SdEvents::Events.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name.upcase} - #{event.time} - #{event.venue}"
    end
  end


end
