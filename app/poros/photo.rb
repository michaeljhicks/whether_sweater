class Photo 
  attr_reader :id, 
              :image,
              :credits

  def initialize(data)
    @id       = nil 
    @image    = {location: data[:tags][0][:title] + "," + data[:tags][1][:title], image_url: data[:urls][:raw]}
    @credits  = {source: "images.unsplash.com", author: data[:user][:name], logo: "https://unsplash.com/@andrewcoophttps" }
  end
end