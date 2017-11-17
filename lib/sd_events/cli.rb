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
      SdEvents::Events.create_daypart("morning")
      display_events
      event_menu

    elsif input == "2"
      SdEvents::Events.create_daypart("afternoon")
      display_events
      event_menu

    elsif input == "3"
      SdEvents::Events.create_evening("evening")
      display_events
      event_menu

    elsif input == "4"
      SdEvents::Events.create_evening("night")
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
    input = nil
    while input != "exit"
    puts ""
    puts "To see more info about an event, please select the number of the event"
    puts ""
    puts "OR type 'menu' to see the menu again"
    puts "OR type 'exit' to exit the program"
    puts ""
    input = gets.strip
      if input == "menu"
        list_menu
      elsif input.to_i.between?(1, SdEvents::Events.all.size)
        event = SdEvents::Events.find(input)
        puts ""
        puts "Event: #{event.name}"
        puts "Location: #{event.location}"
        puts "Category: #{event.category}"
        puts ""
        SdEvents::Events.all.clear
      elsif input == "exit"
        goodbye
      else
        puts "Not sure what you're asking, here is the menu again:"
        list_menu
      end
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
