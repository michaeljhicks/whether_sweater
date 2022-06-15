class MapQuestService 
  def self.conn 
    Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.lat_long(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(trip_params)
    response = conn.get("/directions/v2/route?from=#{trip_params[:from]}&to=#{trip_params[:to]}")

    JSON.parse(response.body, symbolize_names: true)
  end
end 