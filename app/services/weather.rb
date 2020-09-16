require 'json'
require 'open-uri'

class Weather
    def self.call(lat, lon)
        api_key= ENV['OPENWEATHER_KEY']
        # url = "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&exclude=minutely&units=metric&APPID=#{api_key}"
        url= "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&appid=#{api_key}"
        forecast_serialized = open(url).read
        forecast = JSON.parse(forecast_serialized)
        return forecast
        # return "#{user['name']} #{user['main']['temp'].round}c "
    end
end


