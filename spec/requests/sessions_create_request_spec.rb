require 'rails_helper'

RSpec.describe 'Sessions Create' do
  describe 'happy path' do
    it 'creates a session' do
     user = create(:user)
      headers = { 'CONTENT_TYPE' => 'application/json' }
      body = { 
        email: "#{user.email}",
        password: "#{user.password}"
      }
      post '/api/v0/sessions', params: body.to_json, headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      session = JSON.parse(response.body, symbolize_names: true)
      expect(session).to be_a(Hash)
      expect(session).to have_key(:data)
      expect(session[:data]).to be_a(Hash)

      expect(session[:data]).to have_key(:id)
      expect(session[:data][:id]).to be_a(String)

      expect(session[:data]).to have_key(:type)
      expect(session[:data][:type]).to be_a(String)

      expect(session[:data]).to have_key(:attributes)
      expect(session[:data][:attributes]).to be_a(Hash)

      expect(session[:data][:attributes]).to have_key(:email)
      expect(session[:data][:attributes][:email]).to be_a(String)

      expect(session[:data][:attributes]).to have_key(:api_key)
      expect(session[:data][:attributes][:api_key]).to be_a(String)
      end
    end

    describe 'sad path' do
      it 'returns an error if password does not match' do
        user = create(:user)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        body = { 
          email: "#{user.email}",
          password: "wrong_password"
        }
        post '/api/v0/sessions', params: body.to_json, headers: headers

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to be_a(Hash)
        expect(error).to have_key(:errors)
        expect(error[:errors]).to be_a(String)
        expect(error[:errors]).to eq("Invalid Credentials")
      end
      
      it 'returns an error if email does not match' do
        user = create(:user)
        headers = { 'CONTENT_TYPE' => 'application/json' }
        body = { 
          email: "wrong_email",
          password: "#{user.password}"
        }
        post '/api/v0/sessions', params: body.to_json, headers: headers

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        error = JSON.parse(response.body, symbolize_names: true)
        expect(error).to be_a(Hash)
        expect(error).to have_key(:errors)
        expect(error[:errors]).to be_a(String)
        expect(error[:errors]).to eq("Invalid Credentials")
      end
    end
  end