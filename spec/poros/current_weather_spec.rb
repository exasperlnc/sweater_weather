require 'rails_helper'

RSpec.describe CurrentWeather do
  before :each do
    @data = {
      last_updated: "2023-06-12 15:17",
      temp_f: 72.0,
      feelslike_f: 72.0,
      humidity: 10,
      uv: 10.0,
      vis_miles: 10.0,
      condition: {
        text: "Sunny",
        icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }}
    end

  it 'exists' do
    @cw = CurrentWeather.new(@data)

    expect(@cw).to be_a CurrentWeather
    expect(@cw.last_updated).to eq("2023-06-12 15:17")
    expect(@cw.temperature).to eq(72.0)
    expect(@cw.feels_like).to eq(72.0)
    expect(@cw.humidity).to eq(10)
    expect(@cw.uvi).to eq(10.0)
    expect(@cw.visibility).to eq(10.0)
    expect(@cw.condition).to eq("Sunny")
    expect(@cw.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
  end
end