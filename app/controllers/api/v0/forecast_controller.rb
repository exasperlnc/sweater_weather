class Api::V0::ForecastController < ApplicationController
  def index
    forecast = WeatherFacade.new.forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end