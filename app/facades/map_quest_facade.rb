class MapQuestFacade 
  def self.lat_long(location) 
   coordinates = {}
   data = MapQuestService.lat_long(location)

   coordinates[:lat] = data[:results][0][:locations][0][:latLng][:lat]
   coordinates[:lng] = data[:results][0][:locations][0][:latLng][:lng]

   coordinates
  end
end