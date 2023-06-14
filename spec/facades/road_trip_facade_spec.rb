require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'returns a trip object' do
    origin = 'salt lake city, ut'
    destination = 'provo, ut'
    trip = RoadTripFacade.new.trip(origin, destination)
    
    expect(trip).to be_a Trip
    expect(trip.start_city).to be_a String
    expect(trip.end_city).to be_a String
    expect(trip.travel_time).to be_a String
    expect(trip.weather_at_eta).to be_a WeatherEta
    expect(trip.weather_at_eta.temperature).to be_a Float
    expect(trip.weather_at_eta.conditions).to be_a String
    expect(trip.weather_at_eta.datetime).to be_a String
  end
end