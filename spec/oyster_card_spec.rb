require 'oyster_card'
require 'journey'
require 'journey_log'

describe Oystercard do
  before do
    @oystercard = Oystercard.new(JourneyLog, Journey)
  end
  let(:station) {double :station}
  let(:station2) {double :station2}
  
  it 'will have balance of zero' do
    expect(@oystercard.balance).to eq(0)
  end

  it 'will add money to the balance 'do
    @oystercard.top_up(10)
    expect(@oystercard.balance).to eq(10)
  end
  
  it 'raise an error if balance above maximumm limit' do
    
    expect{@oystercard.top_up(91)}.to raise_error('Can not exceed more than £90.')
  end

  it ' will deduct the money from balance'do
    @oystercard.top_up(30)
    @oystercard.touch_in(station)
    @oystercard.touch_out(station2)
    expect(@oystercard.balance).to eq(29)
  end

  it 'will confirm it is in journey' do
    expect(@oystercard.in_journey?).to be(false)
  end

  it 'will confirm if oyster has been touched in' do
    @oystercard.top_up(30)
    @oystercard.touch_in(station)
    expect(@oystercard.in_journey?).to be(true)
  end 
  
  it 'will confirm if oyster has been touched out' do
    @oystercard.top_up(30)
    @oystercard.touch_in(station)
    @oystercard.touch_out(station2)
    expect(@oystercard.in_journey).to be(false)
  end 
  it 'will not allow journey with insufficient funds' do
    expect{@oystercard.touch_in(station)}.to raise_error(RuntimeError, 'insufficient funds') 
  end

  it 'will confirm that oyster has been charged' do
    @oystercard.top_up(30)
    @oystercard.touch_in(station)
    expect{@oystercard.touch_out(station2)}.to change{@oystercard.balance}.by -1
  end

  it 'should show all previous trips' do
    @oystercard.top_up(20)
    @oystercard.touch_in(station)
    @oystercard.touch_out(station2)
    expect(@oystercard.journey_history.count).to eq 1
  end

  it 'should log the incomplete journey when touching in twice' do
    @oystercard.top_up(20)
    @oystercard.touch_in(station)
    @oystercard.touch_in(station2)
    expect(@oystercard.journey_history.count).to eq 1
  end
    

end