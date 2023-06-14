require 'rails_helper'

RSpec.describe TripService do
  it 'gets travel time for a road trip' do
    origin = 'salt lake city, ut'
    destination = 'provo, ut'
    service = TripService.new
    data = service.get_trip(origin, destination)
    result = data[:route]

    expect(result).to be_a Hash
    expect(result[:formattedTime]).to be_a String
  end
end