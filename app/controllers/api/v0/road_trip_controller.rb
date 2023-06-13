class Api::V0::RoadTripController < ApplicationController
  def create
    data = request.raw_post
    road_trip = RoadTripFacade.new.road_trip(JSON.parse(data))
  end
end