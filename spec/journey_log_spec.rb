require 'journey_log'

describe JourneyLog do
  let(:journey) {double :journey}
  let(:station) {double :station}
  let(:station2) {double :station}
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

  it "should finish the journey at an exit station" do
    allow(journey).to receive(:entry_station).and_return(station)
    allow(journey).to receive(:exit_station).and_return(station2)
    @log.start(station)
    @log.finish(station2)
    expect(@log.journey_class.exit_station).to eq station2
  end

  it "should have a current journey method that returns an incomplete journey" do
    allow(journey).to receive(:entry_station).and_return(station)
    allow(journey).to receive(:complete?).and_return(false)
    allow(journey).to receive(:exit_station)
    @log.start(station)
    expect(@log.current_journey).to eq ({station => nil})
  end

  it "should have a current journey method that creates a new journey if complete" do
    # allow(journey).to receive(:entry_station).and_return(station)
    # allow(journey).to receive(:exit_station).and_return(station2)
    actual_log = JourneyLog.new(Journey.new)
    actual_log.start(station)
    actual_log.finish(station2)
    actual_log.current_journey
    expect(actual_log.journey_class.entry_station == nil && actual_log.journey_class.exit_station == nil ).to be true

  end

end