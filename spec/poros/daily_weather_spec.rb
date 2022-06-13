require 'rails_helper'

 RSpec.describe DailyWeather do
    let(:weather) { WeatherFacade.daily_weather("Denver,CO") }

    it "has attributes", :vcr do
      expect(weather.date).to be_a(String)
      expect(weather.sunrise).to be_a(String)
      expect(weather.sunset).to be_a(String)
      expect(weather.max_temp).to be_a(Float)
      expect(weather.min_temp).to be_a(Float)
      expect(weather.conditions).to be_a(String)
      expect(weather.icon).to be_a(String)
    end
 end
