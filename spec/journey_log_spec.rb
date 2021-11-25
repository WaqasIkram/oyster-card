require 'journey_log'

describe JourneyLog do
  let(:journey) {double :journey}
  let(:station) {double :station}
  before do
    @log = JourneyLog.new(journey)
  end
  it 'should initialize with a journey_class parameter' do
    expect(@log.journey_class).to eq journey
  end

  it 'should start a new journey with an entry station' do
    allow(journey).to receive(:entry_station).and_return(station)
    @log.start(station)
    expect(@log.journey_class.entry_station).to eq station 
    
  end

end