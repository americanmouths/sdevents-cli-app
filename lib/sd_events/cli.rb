class SdEvents::CLI

  def call
    start
  end

  def start
    puts ""
    puts "******* Events Happening Now in San Diego *******"
    puts ""
    list_menu
  end

  def list_menu
    puts "Hello, the time is now #{Time.now}."
    puts "Please select which events you would like to see or type 'exit'"
    puts ""
    puts "1. Morning Events"
    puts "2. Afternoon Events"
    puts "3. Evening Events"
    puts "4. Late Night Events"
    puts ""

    input = gets.strip.downcase

    if input == "1"
      SdEvents::Events.create_morning_events
      display_events
      event_menu

    elsif input == "2"
      SdEvents::Events.create_afternoon_events
      display_events
      event_menu

    elsif input == "3"
      SdEvents::Events.create_evening_events
      display_events
      event_menu

    elsif input == "4"
      SdEvents::Events.create_night_events
      display_events
      event_menu

    elsif input == "exit"
      goodbye

    else
      puts "Not sure what you're asking, here is the menu again:"
      list_menu
    end
  end

  def display_events
    SdEvents::Events.all.each.with_index(1) do |event, i|
      puts "#{i}."
      puts "Event: #{event.name.upcase}"
      puts "Venue: #{event.venue}"
      puts "Time: #{event.time}"
      puts ""
    end
  end

  def event_menu
    puts ""
    puts "To see more info about an event, please select the number of the event:"
    input = gets.downcase.to_i-1
      SdEvents::Events.find(input)
      puts ""
      puts "Event: #{SdEvents::Events.all[input].name}"
      puts "City: #{SdEvents::Events.all[input].city}"
      puts "Category: #{SdEvents::Events.all[input].category}"
      puts ""
      puts "To see the menu again, type 'menu' or to exit type 'exit':"
      SdEvents::Events.all.clear
        new_input = gets.downcase.strip
        if new_input == "menu"
          list_menu
        elsif new_input == "exit"
          goodbye
        end
    end

  def self.no_events
    puts ""
    puts "Uh oh, looks like there are no events for that time..."
    puts "Please return tomorrow for more events."
    puts ""
    puts "To see the menu again, type 'menu' or type 'exit':"
    input = gets.downcase.strip
    if input == "menu"
      self.new.list_menu
    elsif input == "exit"
      self.new.goodbye
    else
      "Not sure what you're asking, here is the menu again:"
      self.new.list_menu
    end
  end

  def goodbye
    puts "Thanks for visiting SD Events!"
    exit
  end

end
