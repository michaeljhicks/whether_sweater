require 'rails_helper'

RSpec.describe 'weather API requests' do
  it 'returns a forecast', :vcr do 
    get '/api/v1/forecast?location=denver,Co'
    
    expect(response.status).to eq(200)

    forecast_json = JSON.parse(response.body, symbolize_names: true)
    forecast = forecast_json[:data]
    
    expect(forecast).to have_key(:id)
    expect(forecast[:id]).to eq(nil)

    expect(forecast[:attributes]).to have_key(:current_weather)
    expect(forecast[:attributes][:current_weather]).to be_a(Hash)

    expect(forecast[:attributes]).to have_key(:daily_weather)
    expect(forecast[:attributes][:daily_weather]).to be_a(Array)
    expect(forecast[:attributes][:daily_weather].count).to eq(5)

    expect(forecast[:attributes]).to have_key(:hourly_weather)
    expect(forecast[:attributes][:hourly_weather]).to be_a(Array)
    expect(forecast[:attributes][:hourly_weather].count).to eq(8)
  end
end