MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1
class Oystercard

  attr_reader :balance, :in_journey
 
  def initialize
    @balance = 0
    @in_journey = false
  
  end

  def top_up(money)
    @balance += money
    if @balance > MAXIMUM_BALANCE
      raise 'Can not exceed more than £90.'
    end
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    p @balance
    if MINIMUM_FARE > @balance
      raise 'insufficient funds'
      p @balance
    end
      @in_journey = true
  end

  def touch_out
    @in_journey = false
  end  

  def in_journey?
    @in_journey
  end
end