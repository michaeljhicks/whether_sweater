class UnsplashService 
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_access_key']
    end
  end

  def self.location_photo(city)
    response = conn.get("/search/photos?page=1&query=#{city}")

    JSON.parse(response.body, symbolize_names: true)
  end
end