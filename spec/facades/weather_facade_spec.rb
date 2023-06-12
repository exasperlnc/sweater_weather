require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns weather for a latlon' do
    latlon = '40.2337,-111.66889'
    facade = WeatherFacade.new
    weather = facade.weather(latlon)

    expect(weather).to be_a Weather
    expect(weather.current_weather).to be_a Float
    expect(weather.summary).to be_a String
  end
end