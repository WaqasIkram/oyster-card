class JourneyLog

  attr_reader :journey_class


  def initialize(journey)
    @journey_class = journey
  end

  def start(station)
    @journey_class.entry_station(station)
  end

  def finish(station)
    @journey_class.exit_station(station)
  end

  def current_journey
    { @journey_class.entry_station => @journey_class.exit_station }
  end

end