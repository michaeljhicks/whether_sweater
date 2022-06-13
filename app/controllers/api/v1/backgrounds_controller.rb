class Api::V1::BackgroundsController < ApplicationController 
    def index
        photo = UnsplashFacade.location_photo(params["location"])
        render(json: PhotoSerializer.new(photo))
    end    
end