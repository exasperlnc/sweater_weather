require 'rails_helper'

RSpec.describe 'Road Trip' do
  describe 'happy path' do
    it 'returns road trip info' do
      user = create(:user)
      headers = { 'CONTENT_TYPE' => 'application/json' }
      body = { 
        origin: "Austin, TX",
        destination: "Salt Lake City, UT",
        api_key: "#{user.token}"
      }

      post '/api/v0/road_trip', params: body.to_json, headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(road_trip).to be_a(Hash)
      
      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to be_a(Hash)

      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)

      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to be_a(String)

      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to be_a(Hash)

      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it 'returns impossible travel time if no route exists' do
      user = create(:user)
      headers = { 'CONTENT_TYPE' => 'application/json' }
      body = {
        origin: "Austin, TX",
        destination: "London, UK",
        api_key: "#{user.token}"
      }

      post '/api/v0/road_trip', params: body.to_json, headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(road_trip).to be_a(Hash)

      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).to be_a(Hash)

      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq(nil)

      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to be_a(String)

      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).to be_a(Hash)

      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to be_a(String)

      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(road_trip[:data][:attributes][:travel_time]).to eq("impossible")

      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)

      expect(road_trip[:data][:attributes][:weather_at_eta]).to_not have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to_not have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to eq({})
    end
  end

  describe 'sad path' do
    it 'returns an error if api_key is invalid' do
      user = create(:user)
      headers = { 'CONTENT_TYPE' => 'application/json' }
      body = {
        origin: "Austin, TX",
        destination: "Salt Lake City, UT",
        api_key: "invalid_api_key"
      }

      post '/api/v0/road_trip', params: body.to_json, headers: headers

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error).to be_a(Hash)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to be_a(String)
      expect(error[:errors]).to eq("Unauthorized")
    end
  end
end