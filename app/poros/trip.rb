class Trip
  attr_reader :start_city, :end_city, :formattedTime, :weather_at_eta


  def initialize(data, origin, destination, weather_at_eta = nil)
    @start_city = origin
    @end_city = destination
    @formattedTime = data[:route][:formattedTime]
    @weather_at_eta = weather_at_eta
  end
end