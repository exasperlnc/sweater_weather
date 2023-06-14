class Trip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :id


  def initialize(data, origin, destination, weather_at_eta = nil)
    @start_city = origin
    @end_city = destination
    @travel_time = data[:route][:formattedTime]
    @weather_at_eta = weather_at_eta
    @id = nil
  end
end