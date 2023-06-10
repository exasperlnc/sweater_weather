require 'rails_helper'

RSpec.describe GeocodeService do
  it 'gets lat and long for provo utah' do
    location = 'provo, ut'
    service = GeocodeService.new
    data = service.geocode(location)
    result = data[:results].first[:locations].first[:latLng]

    expect(result).to be_a Hash
    expect(result[:lat]).to eq(40.2337)
    expect(result[:lng]).to eq(-111.66889)
  end

  it 'gets lat and long for austin texas' do
    location = 'austin, tx'
    service = GeocodeService.new
    data = service.geocode(location)
    result = data[:results].first[:locations].first[:latLng]

    expect(result).to be_a Hash
    expect(result[:lat]).to eq(30.26759)
    expect(result[:lng]).to eq(-97.74299)
  end
end