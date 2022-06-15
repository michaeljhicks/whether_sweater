class RoadTrip 
  attr_reader :id,
              :start_city,
              :end_city, 
              :travel_time, 
              :weather_at_eta 

  def initialize(departure, destination, total_time, temperature, conditions)
    @id             = nil
    @start_city     = departure
    @end_city       = destination
    @travel_time    = total_time
    @weather_at_eta = { "temperature": temperature, "conditions": conditions}
  end
end