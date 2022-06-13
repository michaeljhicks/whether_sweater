class WeatherFacade 
  def self.all_weather(location)
    Forecast.new(current_weather(location), daily_weather(location), hourly_weather(location))
  end

  def self.current_weather(location)
    coords = MapQuestFacade.lat_long(location)
    data = WeatherService.current_weather(coords[:lat], coords[:lng])
    
    CurrentWeather.new(data[:current])    
  end

  def self.daily_weather(location)
    coords = MapQuestFacade.lat_long(location)
    data = WeatherService.current_weather(coords[:lat], coords[:lng])
    days = data[:daily][0..4]

    days.map do |day|
      DailyWeather.new(day)
    end
  end

  def self.hourly_weather(location)
    coords = MapQuestFacade.lat_long(location)
    data = WeatherService.current_weather(coords[:lat], coords[:lng])
    hours = data[:hourly][0..7]

    hours.map do |hour|
      HourlyWeather.new(hour)
    end
  end
end