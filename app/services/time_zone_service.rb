class TimeZoneService

  def timezone(lat, lng)
    response = conn.get("?location=#{lat}%2C#{lng}&timestamp=1331161200")
    JSON.parse(response.body, symbolize_names: true)
    
  end




  private
    def conn 
      faraday = Faraday.new(url: "https://maps.googleapis.com/maps/api/timezone/json") do |f|
        f.params['key'] = ENV['GOOGLE_API_KEY']
      end
    end
end