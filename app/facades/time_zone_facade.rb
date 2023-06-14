class TimeZoneFacade


  def initialize(travel_time, lat, lon)
    @travel_time = travel_time.to_i  
    @lat = lat
    @lon = lon
  end

  def get_offset
    data = service.timezone(@lat, @lon)
    data[:rawOffset]
  end

# use offset to get time at destination
# add travel time to get arrival time

  def get_arrival_time
    offset = self.get_offset
    arrival_time = Time.now.utc + @travel_time + offset
    arrival_time.strftime("%I:%M%p")
  end

  private
    def service
      @_service = TimeZoneService.new
    end
end