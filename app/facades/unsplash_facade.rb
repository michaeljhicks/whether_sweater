class UnsplashFacade
  def self.location_photo(city)
    data = UnsplashService.location_photo(city)

    Photo.new(data[:results][0])
  end
end