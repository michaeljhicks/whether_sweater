require 'rails_helper'

 RSpec.describe HourlyWeather do
    let(:weather) { WeatherFacade.hourly_weather("Denver, CO") }

    it "has attributes", :vcr do
      expect(weather.time).to be_a(String)
      expect(weather.temperature).to be_a(Float)
      expect(weather.conditions).to be_a(String)
      expect(weather.icon).to be_a(String)
    end
 end
