require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns current weather forecast', :vcr do 
    response = WeatherFacade.current_weather("Denver,CO")
    
    expect(response).to be_a(CurrentWeather)
  end

  it 'returns daily weather forecast', :vcr do
    response = WeatherFacade.daily_weather("Denver,CO")
    
    expect(response).to be_an(Array)
    expect(response.sample).to be_a(DailyWeather)
  end

  it 'returns hourly weather forecast', :vcr do 
    response = WeatherFacade.hourly_weather("Denver,CO")

    expect(response).to be_an(Array)
    expect(response.sample).to be_an(HourlyWeather)
  end

  it 'returns all weather times', :vcr do 
    response = WeatherFacade.all_weather("Denver,CO")

    expect(response).to be_a(Forecast)
  end
end