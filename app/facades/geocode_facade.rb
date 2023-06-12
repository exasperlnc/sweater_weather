class GeocodeFacade
  
  def get_lat_lon(location)
    data = service.geocode(location)
    data[:results][0][:locations][0][:latLng]
  end


  private 
    def service
      @_service = GeocodeService.new
    end

end