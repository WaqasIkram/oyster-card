require_relative 'journey'

MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1
class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :journey_history
 
  def initialize
    @balance = 0
    @in_journey = false #maybe needs change?
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(money)
    @balance += money
    if @balance > MAXIMUM_BALANCE
      raise 'Can not exceed more than £90.'
    end
  end

  def touch_in(station)
    # deduct(@journey.fare) unless @journey.complete? || @journey.entry_station == nil #first journey
    # @journey_history << { @journey.entry_station => @journey.exit_station} unless @journey.complete? || @journey.entry_station == nil
    unless @journey.complete? || @journey.entry_station == nil
      deduct(@journey.fare)
      @journey_history << { @journey.entry_station => @journey.exit_station}
    end
    @journey.entry_station(station)
    if MINIMUM_FARE > @balance
      raise 'insufficient funds'
    end
      @in_journey = true #needs change?
  end

  def touch_out(station)
    @journey.exit_station(station)
    deduct(@journey.fare) #needs change
    @journey_history << { @journey.entry_station => @journey.exit_station} #needs change
    @journey.entry_station(nil)
    @journey.exit_station(nil)
    @in_journey = false #maybe?? neeeds change
  end  

  def in_journey? #??
    @in_journey
  end

  private

  def deduct(money)
    @balance -= money
  end
end