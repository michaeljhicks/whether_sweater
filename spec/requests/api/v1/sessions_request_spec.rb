require 'rails_helper'

RSpec.describe 'sessions creation' do
  it 'happy path successfully creates a session', :vcr do 
    user_data = {
      "email": "ThePurpleBass@gmail.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    User.create!(user_data)

    user_login = {
      "email": "ThePurpleBass@gmail.com",
      "password": "password123"
    }

    post '/api/v1/sessions', params: user_login

    user_json = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(user_json).to be_a(Hash)
    expect(user_json[:data][:id]).to be_a(String)
    expect(user_json[:data][:type]).to be_a(String)
    expect(user_json[:data][:attributes]).to be_a(Hash)
    expect(user_json[:data][:attributes][:email]).to be_a(String)
    expect(user_json[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'sad path unsuccessfully creates a session invalid email', :vcr do 
    user_data = {
      "email": "ThePurpleBass@gmail.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    User.create!(user_data)

    user_login = {
      "email": "PurpleFish@gmail.com",
      "password": "password123"
    }

    post '/api/v1/sessions', params: user_login

    user_json = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    expect(user_json).to be_a(Hash)
    expect(user_json[:error]).to be_a(String)
    expect(user_json[:error]).to eq("Email and/or Password is Invalid")
  end

  it 'sad path unsuccessfully creates a session invalid password', :vcr do 
    user_data = {
      "email": "ThePurpleBass@gmail.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    User.create!(user_data)

    user_login = {
      "email": "ThePurpleBass@gmail.com",
      "password": "password456"
    }

    post '/api/v1/sessions', params: user_login

    user_json = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    expect(user_json).to be_a(Hash)
    expect(user_json[:error]).to be_a(String)
    expect(user_json[:error]).to eq("Email and/or Password is Invalid")
  end
end