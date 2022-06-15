class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadtripFacade.trip_info({to: params["destination"], from: params["origin"]})
    user = User.find_by(api_key: params["api_key"])
   
    if user != nil 
      if road_trip == 401 
        render(json: { error: "We are unable to route with the given locations."}, status: 400 )
      elsif road_trip == 611
        render(json: { error: "At least two locations must be provided."}, status: 611 )
      else 
        render(json: RoadTripSerializer.new(road_trip))
      end
    else
      render(json: { error: "A valid API key must be provided."}, status: 400 )
    end
  end
end
      
