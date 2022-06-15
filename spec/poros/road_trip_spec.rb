require 'rails_helper'

RSpec.describe RoadTrip do
  it 'attributes', :vcr do
    trip_params = {to: "Fort Collins, CO", from: "Estes Park, CO"}

   road_trip = RoadtripFacade.trip_info(trip_params)

   expect(road_trip).to be_a(RoadTrip)
   expect(road_trip.id).to eq(nil)
   expect(road_trip.start_city).to be_a(String)
   expect(road_trip.end_city).to be_a(String)
   expect(road_trip.travel_time).to be_a(String)
   expect(road_trip.weather_at_eta).to be_a(Hash)
   expect(road_trip.weather_at_eta[:temperature]).to be_a(Float)
   expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
  end
end