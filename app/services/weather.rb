require 'json'
require 'open-uri'
require 'pry'

# api_key= OpenWeather_API
class Weather
    def self.call
    api_key= ENV['OPENWEATHER_KEY']
    api_key2 = ENV['MAPBOX_API_KEY']
    binding.pry
    city_name = "melbourne"
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{api_key}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)

    puts (user)
    end
end

