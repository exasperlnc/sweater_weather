require 'rails_helper'

RSpec.describe WeatherService do
  it 'gets weather for provo utah' do
    latlon = '40.2337,-111.66889'
    service = WeatherService.new
    data = service.get_weather(latlon)

    current = data[:current]
    expect(current).to be_a Hash
    expect(current[:temp_f]).to be_a Float
    expect(current[:last_updated_epoch]).to be_a Integer
    expect(current[:condition]).to be_a Hash
    expect(current[:condition][:text]).to be_a String
    expect(current[:humidity]).to be_a Integer
    expect(current[:wind_mph]).to be_a Float
    expect(current[:uv]).to be_a Float
    expect(current[:vis_miles]).to be_a Float
  end

  it 'gets forecast for provo utah' do
    latlon = '40.2337,-111.66889'
    service = WeatherService.new
    data = service.get_forecast(latlon)
    
    forecast_days = data[:forecast][:forecastday].each do |day|
      expect(day).to be_a Hash
      expect(day[:date]).to be_a String
      expect(day[:date_epoch]).to be_a Integer
      expect(day[:day]).to be_a Hash
      expect(day[:day][:maxtemp_f]).to be_a Float
      expect(day[:day][:mintemp_f]).to be_a Float
      expect(day[:day][:avgtemp_f]).to be_a Float
      expect(day[:day][:maxwind_mph]).to be_a Float
      expect(day[:day][:totalprecip_in]).to be_a Float
      expect(day[:day][:condition]).to be_a Hash
      expect(day[:day][:condition][:text]).to be_a String
      expect(day[:day][:condition][:icon]).to be_a String
      expect(day[:day][:condition][:code]).to be_a Integer
      expect(day[:astro]).to be_a Hash
      expect(day[:astro][:sunrise]).to be_a String
      expect(day[:astro][:sunset]).to be_a String
    end
  end
end