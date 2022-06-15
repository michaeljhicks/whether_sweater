class RoadtripFacade 
  def self.trip_info(trip_params)
    directions = MapQuestService.directions(trip_params)

    if directions[:info][:statuscode] == 402
      return 401
    elsif directions[:info][:statuscode] == 611 #	System error	All unhandled exceptions
      return 611
    else 
      departure = directions[:route][:locations][0][:adminArea5] + ", " + directions[:route][:locations][0][:adminArea3]
      destination = directions[:route][:locations][1][:adminArea5] + ", " + directions[:route][:locations][1][:adminArea3]

      total_seconds = directions[:route][:legs][0][:time]
      total_hours = total_seconds/3600
      minutes = (total_seconds - (total_hours*3600))/60
      total_time = "#{total_hours} Hour(s), #{minutes} Minutes"
      hour_of_arrival = (total_seconds.to_f/3600).round

      coords = MapQuestFacade.lat_long(destination)
      
      current_weather = WeatherService.current_weather(coords[:lat], coords[:lng])
      
      arrival_weather = current_weather[:hourly][hour_of_arrival]
      temperature = arrival_weather[:temp]
      conditions = arrival_weather[:weather][0][:description]

      RoadTrip.new(departure, destination, total_time, temperature, conditions)
    end
  end
end