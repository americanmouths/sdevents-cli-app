class SdEvents::CLI

  def call
    start
  end

  def start
    puts ""
    puts "******* Events Happening Now in San Diego *******".colorize(:blue)
    puts ""
    list_menu
  end

  def list_menu
    puts "Hello, the time is now #{Time.now}.".colorize(:light_blue)
    puts "Please select which events you would like to see or type 'exit'".colorize(:red)
    puts ""
    puts "1. Morning Events".colorize(:green)
    puts "2. Afternoon Events".colorize(:green)
    puts "3. Evening Events".colorize(:green)
    puts "4. Late Night Events".colorize(:green)
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
      SdEvents::Events.create_daypart("evening")
      display_events
      event_menu

    elsif input == "4"
      SdEvents::Events.create_daypart("night")
      display_events
      event_menu

    elsif input == "exit"
      goodbye

    else
      puts "Not sure what you're asking, here is the menu again:".colorize(:red)
      list_menu
    end
  end

  def display_events
    SdEvents::Events.all.each.with_index(1) do |event, i|
      puts "#{i}."
      puts "Event: #{event.name.upcase}".colorize(:magenta)
      puts "Venue: #{event.venue}".colorize(:magenta)
      puts "Time: #{event.time}".colorize(:magenta)
      puts ""
    end
  end

  def event_menu
    input = nil
    while input != "exit"
    puts ""
    puts "To see more info about an event, please select the number of the event".colorize(:red)
    puts ""
    puts "OR type 'menu' to see the menu again".colorize(:red)
    puts "OR type 'exit' to exit the program".colorize(:red)
    puts ""
    input = gets.strip
      if input == "menu"
        list_menu
      elsif input.to_i.between?(1, SdEvents::Events.all.size)
        event = SdEvents::Events.find(input)
        puts ""
        puts "Event: #{event.name}".colorize(:magenta)
        puts "Location: #{event.location}".colorize(:magenta)
        puts "Category: #{event.category}".colorize(:magenta)
        puts ""
        SdEvents::Events.all.clear
      elsif input == "exit"
        goodbye
      else
        puts "Not sure what you're asking, here is the menu again:".colorize(:red)
        list_menu
      end
    end
  end

  def self.no_events
    puts ""
    puts "Uh oh, looks like there are no events for that time...".colorize(:magenta)
    puts "Please return tomorrow for more events.".colorize(:magenta)
    puts ""
    puts "To see the menu again, type 'menu' or type 'exit':".colorize(:red)
    input = gets.downcase.strip
    if input == "menu"
      self.new.list_menu
    elsif input == "exit"
      self.new.goodbye
    else
      "Not sure what you're asking, here is the menu again:".colorize(:red)
      self.new.list_menu
    end
  end

  def goodbye
    puts "Thanks for visiting SD Events!".colorize(:blue)
    exit
  end

end
