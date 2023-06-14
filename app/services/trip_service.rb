class TripService

  def get_trip(origin, destination)
    response = conn.get("?from=#{origin}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end


  private
    def conn 
      Faraday.new(url: "https://www.mapquestapi.com/directions/v2/route") do |f|
        f.params['key'] = ENV['MAP_QUEST_API_KEY']
      end
    end
end