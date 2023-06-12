class Api::V1::BookSearchController < ApplicationController
  def index
    book_forecast = BookForecastFacade.new.get_forecast_books(params[:location], params[:quantity])
    render json: BookForecastSerializer.new(book_forecast)
  end
end