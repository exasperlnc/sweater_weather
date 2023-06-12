require 'rails_helper'

RSpec.describe HourlyWeather do
  before :each do
    @data = {
      time: "2023-06-12 00:00",
      temp_f: 72.0,
      condition: {
        text: "Sunny",
        icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"
      }}
    end

    it 'exists' do
      @hw = HourlyWeather.new(@data)

      expect(@hw).to be_a HourlyWeather
      expect(@hw.time).to eq("2023-06-12 00:00")
      expect(@hw.temperature).to eq(72.0)
      expect(@hw.conditions).to eq("Sunny")
      expect(@hw.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
    end
end