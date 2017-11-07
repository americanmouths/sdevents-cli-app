class SdEvents::Events
  attr_accessor :name, :venue, :time, :availability

  def self.today
    #return a bunch of instances of events

    event_1 = self.new
    event_1.name = "Halsey Hopeless Fountain Kingdom"
    event_1.venue = "Viejas Arena"
    event_1.time = "7:00PM"
    event_1.availability = true

    event_2 = self.new
    event_2.name = "Cults"
    event_2.venue = "The Irenic"
    event_2.time = "6:30PM"
    event_2.availability = true

    [event_1, event_2]

  end

end
