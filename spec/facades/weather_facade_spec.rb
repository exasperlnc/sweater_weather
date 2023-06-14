require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns a forecast object' do
    location = 'denver,co'
    forecast = WeatherFacade.new.forecast(location)
    
    expect(forecast).to be_a Forecast
    expect(forecast.current_weather).to be_a CurrentWeather
    expect(forecast.daily_weather).to be_a Array
    expect(forecast.daily_weather.first).to be_a DailyWeather
    expect(forecast.hourly_weather).to be_a Array
    expect(forecast.hourly_weather.first).to be_a HourlyWeather
  end

  it 'returns weather_at_eta' do
    location = 'denver,co'
    weather_eta = WeatherFacade.new.weather_at_eta(location, 0, 2, "5:52 AM")
    
    expect(weather_eta).to be_a WeatherEta
    expect(weather_eta.temperature).to be_a Float
    expect(weather_eta.conditions).to be_a String
    expect(weather_eta.datetime).to be_a String
  end
end