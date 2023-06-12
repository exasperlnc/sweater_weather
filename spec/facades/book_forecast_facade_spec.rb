require 'rails_helper'

RSpec.describe BookForecastFacade do
  it 'returns books and forecast for locaiton' do
    location = 'denver, co'
    facade = BookForecastFacade.new
    book_forecast = facade.get_forecast_books(location)
    
    expect(book_forecast).to be_a BookForecast
    expect(book_forecast.id).to eq(nil)
    expect(book_forecast.summary).to be_a String
    expect(book_forecast.temperature).to be_a Float
    expect(book_forecast.destination).to be_a String
    expect(book_forecast.books).to be_a Array
    book_forecast.books.each do |book|
      expect(book).to be_a Book
    end
  end
end