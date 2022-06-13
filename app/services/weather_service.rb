class WeatherService 
  def self.conn 
    Faraday.new(url: 'https://api.openweathermap.org') do |f|
      f.params['appid'] = ENV['weather_api_key']
    end
  end

  def self.current_weather(lat, lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial")
    
    JSON.parse(response.body, symbolize_names: true)
  end
end