class WeatherService

  def get_weather(latlon)
    response = conn.get("current.json?q=#{latlon}}")
    JSON.parse(response.body, symbolize_names: true)
  end


  private

    def conn
      Faraday.new(url: "http://api.weatherapi.com/v1") do |f|
        f.params['key'] = ENV['WEATHER_API_KEY']
      end
    end
end