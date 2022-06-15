require 'rails_helper'

RSpec.describe 'unplash API requests' do
  it 'returns a photo of a desired location', :vcr do 
    get '/api/v1/backgrounds?location=denver,co'
    
    expect(response.status).to eq(200)

    photo_json = JSON.parse(response.body, symbolize_names: true)
    photo = photo_json[:data]
 
    expect(photo[:attributes][:image]).to be_a(Hash)
    expect(photo[:attributes][:image][:location]).to be_a(String)
    expect(photo[:attributes][:image][:image_url]).to be_a(String)
    expect(photo[:attributes][:credits]).to be_a(Hash)
    expect(photo[:attributes][:credits][:source]).to be_a(String)
    expect(photo[:attributes][:credits][:author]).to be_a(String)
    expect(photo[:attributes][:credits][:logo]).to be_a(String)
  end
end