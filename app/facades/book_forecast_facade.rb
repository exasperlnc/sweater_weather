class BookForecastFacade

  def get_forecast_books(location, quantity)
    latlon = geocode_facade.get_lat_lon(location)
    forecast = weather_facade.weather(latlon)
    books = book_facade.books(location)
    BookForecast.new(format_forecast(forecast), (books), (location), quantity)
  end
    
  private 

    def format_forecast(data)
      {
        summary: data.summary,
        temperature: data.current_weather
      }
    end

    def geocode_facade
      @_geocode_facade = GeocodeFacade.new
    end

    def weather_facade
      @_weather_facade = WeatherFacade.new
    end

    def book_facade
      @_book_facade = BookFacade.new
    end
end