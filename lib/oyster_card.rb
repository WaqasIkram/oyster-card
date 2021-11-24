MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1
class Oystercard

  attr_reader :balance, :in_journey, :entry_station, :journey_history
 
  def initialize
    @balance = 0
    @in_journey = false
    @entry_station
    @journey_history = []
  
  end

  def top_up(money)
    @balance += money
    if @balance > MAXIMUM_BALANCE
      raise 'Can not exceed more than £90.'
    end
  end

  def touch_in(station)
    @entry_station = station
    if MINIMUM_FARE > @balance
      raise 'insufficient funds'
    
    end
      @in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey_history << {@entry_station=>station}
    @entry_station = nil
    @in_journey = false
  end  

  def in_journey?
    @in_journey
  end

  private

  def deduct(money)
    @balance -= money
  end
end