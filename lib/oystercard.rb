require_relative 'journey'

MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

class Oystercard

  attr_reader :balance, :in_journey, :journey_log

  def initialize(journey_log, journey)
    @balance = 0
    @in_journey = false 
    @journey_log = journey_log.new(journey)
  end

  def top_up(money)
    if @balance + money > MAXIMUM_BALANCE
      raise 'Can not exceed more than £90.'
    end
    @balance += money
  end

  def touch_in(station)
   unless @journey_log.current_journey.complete? || @journey_log.current_journey.entry_station == nil
      deduct(@journey_log.current_journey.fare)
      @journey_log.finish(nil)
    end
    @journey_log.current_journey.entry_station(station)
    if MINIMUM_FARE > @balance
      raise 'insufficient funds'
    end
      @in_journey = true 
  end

  def touch_out(station)
    @journey_log.current_journey.exit_station(station)
    deduct(@journey_log.current_journey.fare)
    @journey_log.finish(station)
    @in_journey = false
  end  

  def in_journey?
    @in_journey
  end

  def journey_history
    @journey_log.journeys
  end  

  private

  def deduct(money)
    @balance -= money
  end
end