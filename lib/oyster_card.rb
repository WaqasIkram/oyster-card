MAXIMUM_BALANCE = 90

class Oystercard

  attr_reader :balance 

  def initialize
    @balance = 0
    
  end

  def top_up(money)
    @balance += money
    if @balance > MAXIMUM_BALANCE
      raise 'Can not exceed more than £90.'
    end
  end
end