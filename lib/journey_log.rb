class JourneyLog

  attr_reader :journey_class


  def initialize(journey)
    @journey_class = journey
  end

  def start(station)
    @journey_class.entry_station(station)
  end

end