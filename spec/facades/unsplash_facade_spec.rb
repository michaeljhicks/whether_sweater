require 'rails_helper'

RSpec.describe UnsplashFacade do
  it 'returns a photo', :vcr do 
    response = UnsplashFacade.location_photo('denver')

    expect(response).to be_a(Photo)
  end
end