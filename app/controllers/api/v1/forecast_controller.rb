class Api::V1::ForecastController < ApplicationController 
  def index 
    forecast = WeatherFacade.all_weather(params["location"])
    
    render(json: ForecastSerializer.new(forecast))
  end
end