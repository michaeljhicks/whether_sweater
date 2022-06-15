# Whether Sweater 

![languages](https://img.shields.io/github/languages/top/michaeljhicks/whether_sweater?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov)
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)


## Description 

Sweater Weather is a BE application that is designed to return desired weather conditions for a specific area. The current weather, a five day forecast, and a 48 hour forecast are all available. Directions from one location to another are also available. By combining the two, Sweater Weather is able to geocode a destination location based on its name, find the route to that destination, and also return what the current weather conditions will be upon arrival of the desired destination. Sweater weather consumes data from an active weather API, an active mapquest API, and the Unsplash photo API. By creating endpoints in a new API, Whether Sweater is able to serialize, and send data to the FE team, ssatisfying their needs for their application.

## APIs Used 

- [Open Weather API](https://openweathermap.org/api)
- [Map Quest API](https://developer.mapquest.com/documentation/)
- [Unsplash Photo API](https://unsplash.com/documentation)

## Learning Goals 
- Create a functioning BE API with new endpoints through the consumption and exposure of other API endpoints 
- Follow SOA convention
- Create new endpoints
- Use serializers to package, and send JSON responses
- Implement sessions after user sign in
- Test API exposure
- Test JSON response of newsly created endpoints
- Combine the consumption of multiple APIs for a single JSON response

## Versions
- Ruby 2.7.2
- Rails 7.0.3

## Gems
```ruby 
  #Global Scope 
  gem 'bcrypt', '~> 3.1.7'
  gem 'faraday'
  gem 'jsonapi-serializer'
  gem 'figaro'
  
  #group :development, :test
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
  gem 'faker'
  gem 'simplecov'
  gem 'factory_bot_rails'
  
  #group :test
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'
```
- [VCR Docs](https://github.com/vcr/vcr)
- [WebMock Docs](https://github.com/bblimke/webmock)
- [Figaro Docs](https://github.com/laserlemon/figaro)
- [Faraday Docs](https://lostisland.github.io/faraday/)
- [JSONAPI_Serialzier Docs](https://github.com/jsonapi-serializer/jsonapi-serializer)
- [SimpleCov Docs](https://github.com/simplecov-ruby/simplecov)
- [Capybara Docs](https://github.com/teamcapybara/capybara)
- [ShouldMatchers Docs](https://github.com/thoughtbot/shoulda-matchers)
- [Factory Bot Rails Docs](https://github.com/thoughtbot/factory_bot_rails)
- [Faker Docs](https://github.com/faker-ruby/faker)
- [Bcrypt Docs](https://github.com/bcrypt-ruby/bcrypt-ruby)

## Local Setup 

1. Fork & Clone the repo 
```shell
$ git clone git@github.com:michaeljhicks/whether_sweater.git
```
2. Navigate to the directory 
```shell 
$ cd whether_sweater
```
3. Install gem packages:
```shell
$ bundle install
```
4. Update gem packages: 
```shell
$ bundle update
```
5. Run the migrations: 
```shell
$ rails db:{drop,create,migrate,seed}
```

## Test Suite 

To properly run the test suite, you will need to follow the below instructions and run the following commands in terminal: 

1. Navigate to the above mentioned API websites (three in total) and request a developer API key for each of the respective APIs. This allows you to access the data properly.
2. Upon having been granted all required API keys and navigate to the ```whether_sweather/config/application.yml``` file. 
3. If you are unable to locate the ```/config/application.yml``` file in your IDE, run the command ```shell bundle exec figaro install``` In the terminal. The ```/config/application.yml``` should appear. If you are still having problems, please references the Figaro documentation as shown below. 
4. Add your API keys in this format at the bottom of the ```ruby/config/application.yml``` file: 
  - ```mapquest_api_key: 'api_key'```
  - ```weather_api_key: 'api_key'```
  - ```unsplash_api_key: 'api_key'```
5. Once you have the API keys in place, you can run the entire test suite! To do this simply run the command ```bundle exec rspec```
6. Upon executing the initial test suite, you will notice it's running at a concerningly glacial pace. This is because of of the suite actually hitting the real API endpoints. However thanks to VCR, this initial run is the only slower execution whereby VCR records the API response on first execution, and then stores the responses in a file known as a 'cassette' to reduce API rate limits, thus optimizing the test suite performance. 

- [VCR Docs](https://github.com/vcr/vcr)
- [Figaro Docs](https://github.com/laserlemon/figaro)

## Created End Points 
- ``` GET /api/v1/forecast?location=denver,co```
- ``` GET /api/v1backgrounds?location=denver,co```
- ``` POST /api/v1/users``` 
  *JSON Params Passed for User create*
 * key: email value: your_email@here
 * key: password value: password
 * key: password_confirmation value: password
 
  
- ``` POST /api/v1/sessions``` 
  *JSON Params Passed for User login/Session Creation* 
 * key: email value: your_email@here
 * key: password value: 'Password123"
 * key: password_confirmation value: 'Password123' 

- ``` POST /api/v1/road_trip``` 
- *JSON Params Passed for Road Trip Creation
* key: origin value:Denver,CO
* key: destination value: Pueblo,CO
* key: api_key value: "your api key here"
  
## Exposed End Points 
  **All string interpolated values are dynamic values being passed in the code as query params. The param "imperial" on the weather API is the preferred form of         measurement. API is metric by defualt. End Points are as they appear in the API services in the code.**
  
- ``` GET http://www.mapquestapi.com/geocoding/v1/address?location=#{location}```
- ``` GET http://www.mapquestapi.com/directions/v2/route?from=#{trip_params[:from]}&to=#{trip_params[:to]}```
- ``` GET https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial```
- ``` GET https://api.unsplash.com/search/photos?page=1&query=#{city}")```

## Schema 
<img width="613" alt="Screen Shot 2022-06-15 at 8 18 41 AM" src="https://user-images.githubusercontent.com/77861247/173850159-62b86bde-f51e-450a-8bca-d0399c90afc4.png">


## Project Contributors

<a href="https://github.com/michaeljhicks/whether_sweater/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=michaeljhicks/whether_sweater" />
</a>


