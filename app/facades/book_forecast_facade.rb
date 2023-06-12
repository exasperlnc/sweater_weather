class BookForecastFacade

  def 
    
  end


  private 

    def weather_service
      @_service = WeatherService.new
    end

    def book_service
      @_service = BookService.new
    end
end