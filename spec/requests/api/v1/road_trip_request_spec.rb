require 'rails_helper'

RSpec.describe 'road trip request spec' do
  it 'happy path returns a road trip with weather conditions', :vcr do 
    user = User.create!(email: "superman@dailyplanet.com", password_digest: "Clark Kent")
    
    road_trip_params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }
    
    post '/api/v1/road_trip', params: road_trip_params

    trip_json = JSON.parse(response.body, symbolize_names: true)
    road_trip = trip_json[:data]

    expect(response).to be_successful
    
    expect(road_trip[:id]).to eq(nil)
    expect(road_trip[:type]).to eq("roadtrip")
    expect(road_trip[:attributes][:start_city]).to be_a(String)
    expect(road_trip[:attributes][:end_city]).to be_a(String)
    expect(road_trip[:attributes][:travel_time]).to be_a(String)
    expect(road_trip[:attributes][:weather_at_eta]).to be_a(Hash)
    expect(road_trip[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip[:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it 'sad path for locaitons spanning unpassable routes', :vcr do 
    user = User.create!(email: "superman@dailyplanet.com", password_digest: "Clark Kent")
    
    road_trip_params = {
      "origin": "New York, NY",
      "destination": "London, UK",
      "api_key": "#{user.api_key}"
    }

    post '/api/v1/road_trip', params: road_trip_params

    trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(trip_json).to be_a(Hash)
    expect(trip_json[:error]).to be_a(String)
    expect(trip_json[:error]).to eq("We are unable to route with the given locations.")
  end

  it 'sad path for missing params', :vcr do 
    user = User.create!(email: "superman@dailyplanet.com", password_digest: "Clark Kent")
    
    road_trip_params = {
      "origin": "",
      "destination": "London, UK",
      "api_key": "#{user.api_key}"
    }

    post '/api/v1/road_trip', params: road_trip_params

    trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(611)
    expect(trip_json).to be_a(Hash)
    expect(trip_json[:error]).to be_a(String)
    expect(trip_json[:error]).to eq("At least two locations must be provided.")
  end

  it 'sad path for incorrect api_key', :vcr do 
    user = User.create!(email: "superman@dailyplanet.com", password_digest: "Clark Kent")

    road_trip_params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    post '/api/v1/road_trip', params: road_trip_params

    trip_json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(trip_json).to be_a(Hash)
    expect(trip_json[:error]).to be_a(String)
    expect(trip_json[:error]).to eq("A valid API key must be provided.")
  end

end