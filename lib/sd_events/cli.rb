class SdEvents::CLI

  def call
    list_events
    menu
    goodbye
  end

  def list_events
    puts ""
    puts "****** Now Happening in San Diego *******"
    puts ""
    SdEvents::Events.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.venue} - #{event.time}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the event you would like more info on or type list to see the events again or type exit"
      input = gets.strip.downcase

      if input.to_i > 0
        the_event = SdEvents::Events.all[input.to_i-1]
        puts "#{the_event.name} - #{the_event.venue} - #{the_event.time}"
      elsif input == "list"
        list_events
      else
        puts "Not sure what you want, type list to see the events or type exit"
    end
  end
end

  def goodbye
    puts "See you tomorrow for some more events."
  end

end
