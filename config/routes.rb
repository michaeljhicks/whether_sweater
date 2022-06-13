Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do 
      resources :forecast, only: %i[index]
      resources :backgrounds, only: %i[index]
      get '/book-search', to: 'book_search#index'
    end 
  end 
end
