class Api::V1::BookSearchController < ApplicationController
    before_action :check_location

    def index
        location = params[:location]
        quantity = params[:quantity].to_i
        forecast = ForecastFacade.find_forecast(@coordinates[:lat], @coordinates[:lng])
        books = BookFacade.find_books(location)
        
        if quantity <= books[:numFound]
            render json: BooksSerializer.book_response(forecast, books, location, quantity)
        else 
            invalid_quantity
        end 
    end

private

  def check_location
    if params[:location].present?
      @coordinates = MapQuestFacade.lat_long(params[:location])
    else
      render status: 404
    end
  end
end 