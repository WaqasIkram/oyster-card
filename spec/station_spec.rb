require "station"

describe Station do

  it "should have a zone" do
    station = Station.new(1, "Aldgate")
    expect(station.zone).to be_a_kind_of(Integer)
  end

  it "should have a name" do
    station = Station.new(1, "Aldgate")
    expect(station.name).to be_a_kind_of(String)
  end
  
end