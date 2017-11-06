class SdEvents::CLI

  def call
    puts "Today's Events in San Diego:"
    list_events
    goodbye
    menu
  end

  def list_events
    puts ""
    puts "****** Now Happening in San Diego *******"
    puts ""
    puts "1. Halsey Hopeless Fountain Kingdom - Viejas Arena - 7:00PM - Tickets Available"
    puts "2. Cults - The Irenic - 6:30PM - Tickets Available"
  end

  def menu
    puts "Enter the event you would like more info on or type exit"

    input = nil

    while input != "exit"
      input = gets.strip.downcase
      case input

      when "1"
        puts "More info on first event..."

      when "2"
        puts "More info on second event..."

    end
  end
end

  def goodbye
    puts "Goodbye!"
  end



end
