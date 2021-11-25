require 'oyster_card'
require 'journey'

describe Oystercard do
let(:oystercard) { described_class.new}
let(:oyster1) {double :oystercard}
let(:station) {double :station}
let(:station2) {double :station2}

# require './lib/oyster_card.rb' 
# User story 

  # In order to use public transport
  # As a customer
  # I want money on my card
  
  it 'will have balance of zero' do
    expect(oystercard.balance).to eq(0)
  end

  # User story 

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'will add money to the balance 'do
  oystercard.top_up(10)
  expect(oystercard.balance).to eq(10)
  end


  # User story 

  # In order to protect my money from theft or  loss
  # As a customer
  # I want a maximum limit (of £90) on my card
  
  it 'raise an error if balance above maximumm limit' do
    expect{oystercard.top_up(100)}.to raise_error('Can not exceed more than £90.')
  end

  it ' will deduct the money from balance'do
    oystercard.top_up(30)
    oystercard.touch_in(station)
    oystercard.touch_out(station2)
    expect(oystercard.balance).to eq(29)
  end

  it 'will confirm it is in journey' do
    expect(oystercard.in_journey?).to be(false)
  end

  it 'will confirm if oyster has been touched in' do
    oystercard.top_up(30)
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to be(true)
  end 
  
  it 'will confirm if oyster has been touched out' do
    oystercard.top_up(30)
    oystercard.touch_in(station)
    oystercard.touch_out(station2)
    expect(oystercard.in_journey).to be(false)
  end 
  it 'will not allow journey with insufficient funds' do
    expect{oystercard.touch_in(station)}.to raise_error(RuntimeError, 'insufficient funds') 
  end

  it 'will confirm that oyster has been charged' do
    oystercard.top_up(30)
    oystercard.touch_in(station)
    expect{oystercard.touch_out(station2)}.to change{oystercard.balance}.by -1
  end

  # User Story 
  
  # In order to know where I have been
  # As a customer
  # I want to see all my previous trips

  it 'should show all previous trips' do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_out(station2)
    expect(subject.journey_history).to match_array [{station => station2}]
  end

  it "should log the incomplete journey when touching in twice" do
    subject.top_up(20)
    subject.touch_in(station)
    subject.touch_in(station2)
    expect(subject.journey_history).to match_array [{station => nil}]
  end
    

end