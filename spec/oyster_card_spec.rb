require 'oyster_card'

describe Oystercard do
let(:oystercard) { described_class.new}
  # User story 1
  # In order to use public transport
  # As a customer
  # I want money on my card
  
  it 'will have balance of zero' do
    expect(oystercard.balance).to eq(0)
  end

  # User story 2

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'will add money to the balance 'do
  oystercard.top_up(10)
  expect(oystercard.balance).to eq(10)
  end
  
end