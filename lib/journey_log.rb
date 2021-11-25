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
    if @journey_class.complete?
      @journey_class.entry_station(nil)
      @journey_class.exit_station(nil)
    else
      { @journey_class.entry_station => @journey_class.exit_station }
    end
  end

end