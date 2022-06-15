require 'rails_helper'

RSpec.describe Forecast do
  it 'attributes', :vcr do 
    forecast = WeatherFacade.all_weather("Denver,CO")

    expect(forecast.id).to eq(nil)
    expect(forecast).to be_a(Forecast)
  end
end