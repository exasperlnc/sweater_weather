class Api::V0::RoadTripController < ApplicationController
  def create
    return error unless User.find_by(token: JSON.parse(request.raw_post)["api_key"])
    data = request.raw_post
    road_trip = RoadTripFacade.new.trip(JSON.parse(data)["origin"], JSON.parse(data)["destination"])
    render json: RoadTripSerializer.new(road_trip)
  end


  private
    def error
      render json: { errors: "Unauthorized" }, status: 401
    end
end