#TODO
require 'json'
require 'open-uri'

class Weather
    def self.call(lat, lon)
        # forecast_data = File.read('app/services/forecast_data.json')
        # if valid_json?(forecast_data)
        #     forecast = JSON.parse(forecast_data)
        #     forecast_date = Date.strptime(forecast["current"]["dt"].to_s, '%s')
        #     hours_ago = - (forecast_date.to_time - DateTime.current) / 1.hours
        #     if hours_ago < 48
        #         return forecast
        #     else
        #         api_key= ENV['OPENWEATHER_KEY']
        #         url= "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&units=metric&appid=#{api_key}"
        #         forecast_serialized = open(url).read
        #         forecast = JSON.parse(forecast_serialized)
        #         # store in json and read it
        #         File.open('app/services/forecast_data.json', 'w') do |file|
        #             file.write(JSON.generate(forecast))
        #         end
        #         return forecast_data
        #     end
        # else
            api_key= ENV['OPENWEATHER_KEY']
            url= "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely&units=metric&appid=#{api_key}"
            forecast_serialized = open(url).read
            forecast = JSON.parse(forecast_serialized)
            # store in json and read it
            File.open('app/services/forecast_data.json', 'w') do |file|
                file.write(JSON.generate(forecast))
            end
            return forecast
        # end
    end

    def self.valid_json?(json)
        JSON.parse(json)
        return true
        rescue JSON::ParserError => e
        return false
    end
end


