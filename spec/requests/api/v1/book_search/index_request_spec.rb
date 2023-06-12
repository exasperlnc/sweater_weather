require 'rails_helper'

RSpec.describe "Book Forecast API" do
  it 'serializes a book forecast' do
    get '/api/v1/book-search?location=denver,co&quantity=5'
    expect(response).to be_successful
    
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to be_a Hash
    expect(data).to have_key(:data)

    book_forecast = data[:data]

    expect(book_forecast).to have_key(:id)
    expect(book_forecast[:id]).to eq(nil)

    expect(book_forecast).to have_key(:type)
    expect(book_forecast[:type]).to eq('books')

    expect(book_forecast).to have_key(:attributes)
    expect(book_forecast[:attributes]).to be_a Hash
    expect(book_forecast[:attributes]).to have_key(:destination)
    expect(book_forecast[:attributes][:destination]).to be_a String

    expect(book_forecast[:attributes]).to have_key(:forecast)
    expect(book_forecast[:attributes][:forecast]).to be_a Hash
    expect(book_forecast[:attributes][:forecast]).to have_key(:summary)
    expect(book_forecast[:attributes][:forecast][:summary]).to be_a String
    expect(book_forecast[:attributes][:forecast]).to have_key(:temperature)
    expect(book_forecast[:attributes][:forecast][:temperature]).to be_a Float

    expect(book_forecast[:attributes]).to have_key(:total_books_found)
    expect(book_forecast[:attributes][:total_books_found]).to be_a Integer

    expect(book_forecast[:attributes]).to have_key(:books)

    #can't itreate through books with each method???

    book = book_forecast[:attributes][:books].first
    expect(book).to have_key(:isbn)
    expect(book[:isbn]).to be_a Array
    expect(book).to have_key(:title)
    expect(book[:title]).to be_a String
    expect(book).to have_key(:publisher)
    expect(book[:publisher]).to be_a Array

    book_2 = book_forecast[:attributes][:books].second
    expect(book_2).to have_key(:isbn)
    expect(book_2[:isbn]).to be_a Array
    expect(book_2).to have_key(:title)
    expect(book_2[:title]).to be_a String
    expect(book_2).to have_key(:publisher)
    expect(book_2[:publisher]).to be_a Array
  end
end