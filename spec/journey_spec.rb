require "journey"

describe Journey do
  let(:station) {double :station}
  let(:station2) {double :station2}

  it 'should be able to store an entry station' do
    journey = Journey.new(station)
    expect(journey.entry_station).to eq(station)
  end

  it 'should be able to store an exit station' do
    journey = Journey.new(station)
    journey.exit_station(station2)
    expect(journey.exit_station).to eq(station2)
  end

  it 'should be able to know if a journey is complet' do
    journey = Journey.new(station)
    journey.exit_station(station2)
    expect(journey.complete?).to be true
  end

  it 'should be able to know if a journey is incomplete(i.e.no touched out)' do
    journey = Journey.new(station)
    expect(journey.complete?).to be false
  end

  it 'should be able to know if a journey is incomplete(i.e.no touched in)' do
    journey = Journey.new
    journey.exit_station(station2)
    expect(journey.complete?).to be false
  end
  
end