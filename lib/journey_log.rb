class JourneyLog

  attr_reader :journey_class, :current_journey

  def initialize(journey)
    @journey_class = journey
    @current_journey 
    @journeys = []
  end

  def start(station)
    current_journey
    @current_journey.entry_station(station)
  end

  def finish(station)
    @current_journey.exit_station(station)
    @journeys << @current_journey
    @current_journey = journey_class.new
  end

  def journeys
    @journeys.dup
  end


  # private

  def current_journey
    @current_journey ||= journey_class.new
  end

end