class RoadTripFacade
  def trip(origin, destination)
    data = TripService.new.get_trip(origin, destination)
    if data[:info][:messages].include?("We are unable to route with the given locations.")
      return BadTrip.new(origin, destination)
    end
    latlon = geocode_facade.get_lat_lon(destination)
    #for the line below (8), I don't have a way to get
    #the time from the data
    #so I'm just passing in 0 for now
    weather = weather_facade.weather_at_eta(latlon, 0, 0)
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
end