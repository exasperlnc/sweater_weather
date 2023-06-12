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
end