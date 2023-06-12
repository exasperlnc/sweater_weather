require 'rails_helper'

RSpec.describe DailyWeather do
  before :each do
    @data = {
      date: "2023-04-07",
      day: {
        maxtemp_f: 72.0,
        mintemp_f: 42.0,
        condition: {
          text: "Sunny",
          icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
        }},
        astro: {
          sunrise: "5:57 AM",
          sunset: "7:42 PM"
        }}
    end

    it 'exists' do
      @dw = DailyWeather.new(@data)

      expect(@dw).to be_a DailyWeather
      expect(@dw.date).to eq("2023-04-07")
      expect(@dw.sunrise).to eq("5:57 AM")
      expect(@dw.sunset).to eq("7:42 PM")
      expect(@dw.max_temp).to eq(72.0)
      expect(@dw.min_temp).to eq(42.0)
      expect(@dw.condition).to eq("Sunny")
      expect(@dw.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
    end
end