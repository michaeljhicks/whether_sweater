require 'rails_helper'

RSpec.describe MapQuestFacade do
  it 'returns lat and long coordinates', :vcr do 
    response = MapQuestFacade.lat_long("Denver,CO")
    
    expect(response[:lat]).to be_a(Float)
    expect(response[:lng]).to be_a(Float)
  end
end