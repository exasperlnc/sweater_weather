require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns a forecast' do
    get '/api/v0/forecast?location=denver,co'
    expect(response).to be_successful
    expect(response.status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to be_a Hash
    expect(data).to have_key(:data)

    forecast = data[:data]
    expect(forecast).to be_a Hash
    expect(forecast).to have_key(:id)
    expect(forecast[:id]).to eq(nil)

    expect(forecast).to have_key(:type)
    expect(forecast[:type]).to eq('forecast')

    expect(forecast).to have_key(:attributes)
    expect(forecast[:attributes]).to be_a Hash

    attributes = forecast[:attributes]

    expect(attributes).to have_key(:current_weather)
    expect(attributes[:current_weather]).to be_a Hash

    expect(attributes[:current_weather]).to have_key(:last_updated)
    expect(attributes[:current_weather][:last_updated]).to be_a String

    expect(attributes[:current_weather]).to have_key(:temperature)
    expect(attributes[:current_weather][:temperature]).to be_a Float

    expect(attributes[:current_weather]).to have_key(:feels_like)
    expect(attributes[:current_weather][:feels_like]).to be_a Float

    expect(attributes[:current_weather]).to have_key(:humidity)
    expect(attributes[:current_weather][:humidity]).to be_a Integer

    expect(attributes[:current_weather]).to have_key(:uvi)
    expect(attributes[:current_weather][:uvi]).to be_a Float

    expect(attributes[:current_weather]).to have_key(:visibility)
    expect(attributes[:current_weather][:visibility]).to be_a Float

    expect(attributes[:current_weather]).to have_key(:condition)
    expect(attributes[:current_weather][:condition]).to be_a String

    expect(attributes[:current_weather]).to have_key(:icon)
    expect(attributes[:current_weather][:icon]).to be_a String

    expect(attributes).to have_key(:daily_weather)
    expect(attributes[:daily_weather]).to be_a Array

    daily_weather = attributes[:daily_weather].first

    expect(daily_weather).to have_key(:date)
    expect(daily_weather[:date]).to be_a String

    expect(daily_weather).to have_key(:sunrise)
    expect(daily_weather[:sunrise]).to be_a String

    expect(daily_weather).to have_key(:sunset)
    expect(daily_weather[:sunset]).to be_a String

    expect(daily_weather).to have_key(:max_temp)
    expect(daily_weather[:max_temp]).to be_a Float

    expect(daily_weather).to have_key(:min_temp)
    expect(daily_weather[:min_temp]).to be_a Float

    expect(daily_weather).to have_key(:condition)
    expect(daily_weather[:condition]).to be_a String

    expect(daily_weather).to have_key(:icon)
    expect(daily_weather[:icon]).to be_a String

    expect(attributes).to have_key(:hourly_weather)
    expect(attributes[:hourly_weather]).to be_a Array

    hourly_weather = attributes[:hourly_weather].first

    expect(hourly_weather).to have_key(:time)
    expect(hourly_weather[:time]).to be_a String

    expect(hourly_weather).to have_key(:temperature)
    expect(hourly_weather[:temperature]).to be_a Float

    expect(hourly_weather).to have_key(:conditions)
    expect(hourly_weather[:conditions]).to be_a String

    expect(hourly_weather).to have_key(:icon)
    expect(hourly_weather[:icon]).to be_a String
  end
end