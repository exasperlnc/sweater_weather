class RoadTripFacade
  def trip(origin, destination)
    data = TripService.new.get_trip(origin, destination)
    if data[:info][:messages].include?("We are unable to route with the given locations.")
      return BadTrip.new(origin, destination)
    end
    latlon = geocode_facade.get_lat_lon(destination)
    # use timezone facade to get needed timing info
    arrival_time = TimeZoneFacade.new(data[:route][:realTime], latlon[:lat], latlon[:lng] ).get_arrival_time
    # pass that info to the weather facade
    weather = weather_facade.weather_at_eta(latlon, format_time(data[:route][:formattedTime][0]), format_time(data[:route][:formattedTime][1]) )
    Trip.new(data, origin, destination, weather)
  end

  private
    def trip_service
      @_service = TripService.new
    end

    def geocode_facade
      @_geocode_facade = GeocodeFacade.new
    end

    def weather_facade
      @_weather_facade = WeatherFacade.new
    end

    def format_time(time)
      time.split(":")
    end
end