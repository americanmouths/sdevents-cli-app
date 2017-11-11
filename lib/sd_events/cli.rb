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
      SdEvents::Events.create_morning_events
      display_events

    elsif input == "2"
      SdEvents::Events.create_afternoon_events
      display_events
      event_menu

    elsif input == "3"
      SdEvents::Events.create_evening_events
      display_events

    elsif input == "list"
      list_menu

    else
      "Not sure what you're asking, please enter a valid number choice or type list to see menu again."
    end

  end

  def display_events
    SdEvents::Events.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name.upcase} - #{event.venue} - #{event.time}"
    end
  end

  def event_menu
    puts "To see more info about an event, please enter the number"
    input = gets.downcase.strip.to_i
    SdEvents::Events.find(input)
      puts "Event: #{SdEvents::Events.all[input].name}"
      puts "City: #{SdEvents::Events.all[input].city}"
      puts "Category: #{SdEvents::Events.all[input].category}"
  end


end
