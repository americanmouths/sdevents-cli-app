class SdEvents::CLI

  def call
    puts ""
    puts "******* Events Happening Right Now in San Diego **********"
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

      if SdEvents::Events.create_morning_events.empty?
        puts "Sorry, please check back tomorrow morning for morning events"
      else
        SdEvents::Events.create_morning_events
        display_events
      end

    elsif input == "2"

      if SdEvents::Events.create_afternoon_events.empty?
        puts "Sorry, please check back tomorrow afternoon for afternoon events"
      else
        SdEvents::Events.create_afternoon_events
        display_events
      end

    elsif input == "3"
      if SdEvents::Events.create_evening_events.empty?
        puts "Sorry, day is over! Check back tomorrow for more events"
      else
        SdEvents::Events.create_evening_events
        display_events
      end
      
    else
      "Not sure what you're asking, please enter a valid number choice."
    end
  end

  def display_events
    SdEvents::Events.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name.upcase} - #{event.time} - #{event.venue}"
    end
  end


end
