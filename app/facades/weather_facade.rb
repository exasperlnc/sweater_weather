class WeatherFacade

  def forecast(location)
    latlon = GeocodeFacade.new.get_lat_lon(location)
    data = service.get_forecast(latlon)
    current_weather = CurrentWeather.new(data[:current])
    daily_weather = data[:forecast][:forecastday].map do |day|
      DailyWeather.new(day)
    end
    hourly_weather = data[:forecast][:forecastday][0][:hour].map do |hour|
      HourlyWeather.new(hour)
    end
    Forecast.new(current_weather, daily_weather, hourly_weather)
  end

  def weather_at_eta(latlon, days, hours)
    data = service.get_forecast(latlon)
    WeatherEta.new(data[:forecast][:forecastday][days][:hour][hours])
  end

  private 

    def service
      @_service = WeatherService.new
    end

    def location_service
      @_location_service = GeocodeFacade.new
    end
end