require 'rails_helper'

RSpec.describe TimeZoneFacade do
  it 'exists' do
    tz = TimeZoneFacade.new('19:24:25', 40.2337, -111.66889)

    expect(tz).to be_a TimeZoneFacade
  end

  describe 'instance methods' do
    it '#get_arrival_time' do
      tz = TimeZoneFacade.new('19:24:25', 40.2337, -111.66889)

      expect(tz.get_arrival_time).to be_a String
    end
  end
end