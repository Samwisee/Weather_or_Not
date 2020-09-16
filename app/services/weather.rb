require 'json'
require 'open-uri'

class Weather
    def self.call(lat, lon)
        api_key= ENV['OPENWEATHER_KEY']
        url= "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&units=metric&appid=#{api_key}"
        forecast_serialized = open(url).read
        forecast = JSON.parse(forecast_serialized)
        # store in json and read it
        # File.open('./weather_data.json', 'wb') do |file|
        #     file.write(JSON.generate(forecast))
        # end
        # weather_data = File.read('./weather_data.json')
        # return weather_data
        return forecast
    end
end


