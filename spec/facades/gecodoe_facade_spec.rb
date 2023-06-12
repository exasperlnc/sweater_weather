require 'rails_helper'

RSpec.describe GeocodeFacade do 
  it 'gets lat and long for provo utah' do
    location = 'provo, ut'
    facade = GeocodeFacade.new
    data = facade.get_lat_lon(location)

    expect(data).to be_a Hash
    expect(data[:lat]).to eq(40.2337)
    expect(data[:lng]).to eq(-111.66889)
  end
end