class WeatherFacade

  def forecast(latlon)
    data = service.get_forecast(latlon)
    Forecast.new(data)
  end

  def weather(latlon)
    data = service.get_weather(latlon)
    Weather.new(data)
  end

  private 
    def service
      @_service = WeatherService.new
    end

    def format_weather(data)
      {
        current_weather: current_weather(data),
        summary: summary(data)
      }
    end
end