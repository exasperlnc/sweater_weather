require 'rails_helper'

RSpec.describe 'Create User', type: :request do
  describe 'happy path' do
    it 'creates a user' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      body = {
        email: 'user_email@email.com',
        password: 'password',
        password_confirmation: 'password'
      }
      post '/api/v0/users', params: body.to_json, headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)

      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(String)

      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to be_a(String)
      
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)

      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)

      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)

      expect(user[:data][:attributes]).to_not have_key(:password_digest)

      expect(user[:data][:attributes]).to_not have_key(:password)
    end
  end
end