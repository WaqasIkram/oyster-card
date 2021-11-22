require 'oyster_card'

describe Oystercard do
let(:oystercard) { described_class.new}
  
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
end