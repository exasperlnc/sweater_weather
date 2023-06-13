class RoadTripFacade
  def trip(origin, destination)
    data = TripService.new.get_trip(origin, destination)
    # get lat lon for destination
    latlon = geocode_facade.get_lat_lon(destination)
    # get weather for destination
    weather = weather_facade.projected_weather(latlon)
    # create trip object
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