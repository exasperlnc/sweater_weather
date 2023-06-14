require 'rails_helper'

RSpec.describe TimeZoneService do
  it 'returns a timezone' do
    lat = 40.2337
    lng = -111.66889
    service = TimeZoneService.new
    data = service.timezone(lat, lng)

    expect(data).to be_a Hash
    expect(data[:timeZoneId]).to eq('America/Denver')
    expect(data[:rawOffset]).to eq(-25200)
  end
end