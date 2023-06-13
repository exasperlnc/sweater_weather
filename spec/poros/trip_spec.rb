require 'rails_helper'

RSpec.describe Trip do
  it 'exists' do
    trip_data = {
      route: {
        formattedTime: "04:40:45"
      }}

    origin = "Cincinnati, OH"
    destination = "Denver, CO"
    weather_at_eta = { 
      datetime: "2021-05-07 21:00",
      temperature: 72.0,
      conditions: "Sunny"
    }
    trip = Trip.new(trip_data, origin, destination, weather_at_eta)

    expect(trip).to be_a Trip
    expect(trip.start_city).to eq("Cincinnati, OH")
    expect(trip.end_city).to eq("Denver, CO")
    expect(trip.formattedTime).to eq("04:40:45")
    expect(trip.weather_at_eta).to be_a Hash
    expect(trip.weather_at_eta[:datetime]).to eq("2021-05-07 21:00")
    expect(trip.weather_at_eta[:temperature]).to eq(72.0)
    expect(trip.weather_at_eta[:conditions]).to eq("Sunny")
  end
end