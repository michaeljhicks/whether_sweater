require 'rails_helper'

RSpec.describe CurrentWeather do
  
  it 'attributes', :vcr do 
    weather = WeatherFacade.current_weather("Denver,CO")

    expect(weather.date_time).to be_a(String)
    expect(weather.sunrise).to be_a(String)
    expect(weather.sunset).to be_a(String)
    expect(weather.temperature).to be_a(Float)
    expect(weather.feels_like).to be_a(Float)
    expect(weather.humidity).to be_an(Integer)
    expect((weather.uvi) >= 0).to be(true)
    expect(weather.visibility).to be_an(Integer)
    expect(weather.conditions).to be_a(String)
    expect(weather.icon).to be_a(String)
  end
end