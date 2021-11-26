require 'journey_log'

describe JourneyLog do
  let(:journey) {double :journey}
  let(:station) {double :station}
  let(:station2) {double :station}
  let(:journey_class) {double :journey_class, new: journey}
  
  

  before do
    @log = JourneyLog.new(journey_class)
  end

  it 'should initialize with a journey_class parameter' do
    expect(@log.journey_class).to eq journey_class
  end

  it 'should start a new journey with an entry station' do
    allow(journey).to receive(:entry_station).and_return(station)
    @log.start(station)
    expect(@log.current_journey.entry_station).to eq station 
  end

  it "should finish the journey at an exit station" do
    allow(journey).to receive(:entry_station).and_return(station)
    allow(journey).to receive(:exit_station).and_return(station2)
    @log.start(station)
    @log.finish(station2)
    expect(@log.current_journey.exit_station).to eq station2
  end

  xit "should have a current journey method that returns an incomplete journey" do
    allow(journey).to receive(:entry_station).and_return(station)
    allow(journey).to receive(:complete?).and_return(false)
    allow(journey).to receive(:exit_station)
    @log.start(station)
    expect(@log.current_journey).to eq ({station => nil})
  end

  xit "should have a current journey method that creates a new journey if complete" do
    # allow(journey).to receive(:entry_station).and_return(station)
    # allow(journey).to receive(:exit_station).and_return(station2)
    actual_log = JourneyLog.new(Journey.new)
    actual_log.start(station)
    actual_log.finish(station2)
    actual_log.current_journey
    expect(actual_log.journey_class.entry_station == nil && actual_log.journey_class.exit_station == nil ).to be true

  end

  it 'should return all journyes in an array' do
    # allow(journey).to receive(:entry_station).and_return(station)
    # allow(journey).to receive(:exit_station).and_return(station2)
    # @log.start(station)
    # @log.finish(station2)
    # array = Array.new
    actual_log = JourneyLog.new(Journey)
    actual_log.start(station)
    test_array = [actual_log.current_journey]
    test_array[0].exit_station(station2)
    actual_log.finish(station2)
    expect(actual_log.journeys).to match_array(test_array)

  end


end