require 'rails_helper'

RSpec.describe Photo do
  let(:photo) { UnsplashFacade.location_photo('denver') }

  it 'has attributes', :vcr do 
    expect(photo.id).to eq(nil)
    expect(photo.image).to be_a(Hash)
    expect(photo.image).to have_key(:location)
    expect(photo.image).to have_key(:image_url)
    expect(photo.image[:location]).to be_a(String)
    expect(photo.image[:image_url]).to be_a(String)
    expect(photo.credits).to be_a(Hash)
    expect(photo.credits).to  have_key(:source)
    expect(photo.credits).to  have_key(:author)
    expect(photo.credits).to  have_key(:logo)
    expect(photo.credits[:source]).to be_a(String)
    expect(photo.credits[:author]).to be_a(String)
    expect(photo.credits[:logo]).to be_a(String)
  end
end