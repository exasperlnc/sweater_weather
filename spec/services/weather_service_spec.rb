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
end